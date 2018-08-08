package web;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import vo.Things;
import dao.DaoI;
import dao.DaoImpl;

/**
 * Servlet implementation class ThingsController
 */

public class ThingsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoI daoi=DaoImpl.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThingsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		String url=null;
	    
		if(path.equals("/SL"))
		{
			String startlett=request.getParameter("sellet");
			if(!startlett.isEmpty())
			{
			TreeSet<String> lstnames=daoi.getThingNames();
			HttpSession sess= request.getSession();
			sess.setAttribute("listnames", lstnames);
			List<Things> lt = new ArrayList<Things>();
			lt = daoi.getbyStart(startlett);
			request.setAttribute("LT1", lt);
			url=response.encodeURL("ListPage.jsp");
			}}
		else if(path.equals("/SL1"))
		{
			TreeSet<String> lstnames=daoi.getThingNames();
			HttpSession sess= request.getSession();
			sess.setAttribute("listnames", lstnames);
			String radio=request.getParameter("gender");
			if(radio!=null){
			List<Things> lt1 = new ArrayList<Things>();
			lt1=daoi.getbyStart(radio);
			request.setAttribute("LT2",lt1);
			url=response.encodeURL("ListPage.jsp");}
			}
		else if(path.equals("/SL2"))
		{
			TreeSet<String> lstnames=daoi.getThingNames();
			HttpSession sess= request.getSession();
			sess.setAttribute("listnames", lstnames);
			String[] startlett=request.getParameterValues("cbs");
			List<Things> lt = new ArrayList<Things>();
			lt=daoi.getsbyStart(startlett);
			request.setAttribute("LT3", lt);
			url=response.encodeURL("ListPage.jsp");
		}
		else if(path.equals("/newword")){
		
			String numb=request.getParameter("wnum");
			String name=request.getParameter("wname");
			String slett=Character.toString(name.charAt(0));
			String idesc= request.getParameter("widesc");
			String iname= request.getParameter("winame");
			daoi.createThing(numb, name, slett, iname, idesc);
			HttpSession sess=request.getSession();
			TreeSet<String> lstnames=daoi.getThingNames();
			sess.setAttribute("listnames", lstnames);
			sess.setAttribute("message", " Thanks for the contribution.Word is added successfully :-).");
			url=response.encodeURL("Success.jsp");
			
		}
		else if(path.equals("/updateword")){
			String old= request.getParameter("fl");
			String neww=request.getParameter("upspl");
			daoi.UpdateSpell(old, neww);
			HttpSession sess=request.getSession();
			sess.setAttribute("message", " Thanks for the contribution.Word is updated successfully :-).");
			url=response.encodeURL("Success.jsp");
		}
		else if(path.equals("/updatedesc")){
			String word=request.getParameter("wd");
			String ndesc= request.getParameter("updesc");
			daoi.UpdateDesc(ndesc, word);
			HttpSession sess=request.getSession();
			sess.setAttribute("message", " Thanks for the contribution.Description is updated successfully :-).");
			url=response.encodeURL("Success.jsp");
			
		}
		else if(path.equals("/removeword")){
			System.out.println("hi");
			String[] arr=request.getParameterValues("remove");
			daoi.RemoveWord(arr);
			HttpSession sess=request.getSession();
			sess.setAttribute("imageerror", "Removed successfully :-).");
			url=response.encodeURL("Update.jsp");
		}
		else if(path.equals("/pdf")){
			
			System.out.println("hi");
			
		}

		RequestDispatcher rd=request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
