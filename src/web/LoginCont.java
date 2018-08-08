package web;

import java.io.IOException;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sun.java.swing.plaf.windows.resources.windows;

import vo.User;
import dao.DaoI;
import dao.DaoImpl;

/**
 * Servlet implementation class LoginCont
 */
public class LoginCont extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCont() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess=request.getSession();
		sess.removeAttribute("userattribute");
		sess.invalidate();
		response.sendRedirect("index.jsp");
	
	}

	/**
	 * @see HttpServlet
	 * #doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		if(path.endsWith("/login"))
		{
		String uname= request.getParameter("txtname");
		String pwd= request.getParameter("txtpwd");
		DaoI daoi=DaoImpl.getInstance();
		User user=daoi.getLogin(uname, pwd);
		TreeSet<String> lstnames=daoi.getThingNames();
		HttpSession sess=request.getSession();
		String url=null;
		if(user!=null){
			sess.setAttribute("listnames", lstnames);
			sess.setAttribute("userattribute", user);
			url=response.encodeURL("Home.jsp");
			}
		else{
			String uname1= request.getParameter("txtname");
			String pwd1= request.getParameter("txtpwd");
			DaoI daoi1=DaoImpl.getInstance();
			List<User> ul=daoi1.getUsers();
			boolean fgu=false;
			boolean fgp=false;
			for(User item:ul){
				if(uname1.equals(item.getUsername())){
					fgu=true;
				}
				if(pwd1.equals(item.getPassword())){
					fgp=true;
				}
			}
			if(!fgu && !fgp)
			{   
				request.setAttribute("msg","You have entered wrong credentials");
				url=response.encodeURL("index.jsp");
			}
			else if(!fgu)
			{
				request.setAttribute("msg","You have entered an invalid username");
				url=response.encodeURL("index.jsp");
			}
			else if(!fgp)
			{
				request.setAttribute("msg","You have entered an invalid password");
				url=response.encodeURL("index.jsp");
			}
		}
		RequestDispatcher rd =request.getRequestDispatcher(url);
		rd.forward(request, response);
		}
		else if( path.equals("/reg"))
		{	
			String uid= request.getParameter("txtuid");
			String uname= request.getParameter("txtuname");
			String pwd= request.getParameter("txtupass");
			System.out.println(uid+"  "+uname+" "+pwd);
			DaoI daoi=DaoImpl.getInstance();
			daoi.regUser(uid, uname, pwd);
			request.setAttribute("msg","User registered successfully.\nPlease login.");
			String url=response.encodeURL("index.jsp");
			RequestDispatcher rd =request.getRequestDispatcher(url);
			rd.forward(request, response);
			
		}
			
	}
}


