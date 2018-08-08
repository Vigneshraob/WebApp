package web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUploadServlet
 */

public class UploadServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("uploaded by " + request.getRemoteAddr());
		PrintWriter out = response.getWriter();
		File tempPath = new File("c:\\temp\\");
		if (!tempPath.exists()) {
			tempPath.mkdirs();
		}

		File perPath = new File("/images/");
		if (!perPath.exists()) {
			perPath.mkdirs();
		}

		String contentType = request.getContentType();
		if (contentType.indexOf("multipart/form-data") >=0) {
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(tempPath);
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List<FileItem> files = upload.parseRequest(request);
				for (FileItem fi : files) {
					String fname = fi.getName();
					File file = new File(perPath,fname);
					fi.write(file);
					
					HttpSession sess= request.getSession();
					sess.setAttribute("imagename", fname);
					
					String url=response.encodeURL("AddInfo.jsp");
					RequestDispatcher rd =request.getRequestDispatcher(url);
					rd.forward(request, response);
					
				}} catch (Exception e) {
				System.out.println(e.getMessage());
				HttpSession sess= request.getSession();
				sess.setAttribute("message","Please upload an image by clicking on Add a new word Menu");
				String url=response.encodeURL("Success.jsp");
				RequestDispatcher rd =request.getRequestDispatcher(url);
				rd.forward(request, response);}}
		else{
			out.println("no file uploaded...");
		}}

}
