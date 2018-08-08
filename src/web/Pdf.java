package web;

import java.io.ByteArrayOutputStream;
import javax.swing.JApplet;
import javax.swing.JOptionPane;
import java.net.URL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import vo.Things;
import dao.DaoI;
import dao.DaoImpl;



/**
 * Servlet implementation class Pdf
 */
public class Pdf extends  HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String USER_PASSWORD = "password";
	private static String OWNER_PASSWORD = "secured";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TreeSet<Things> setth=new TreeSet<Things>(); 
	    TreeSet<String> setlt=new TreeSet<String>();
	    
	    int i=0;
		i=0;
		String[]a1=request.getParameterValues("nam1");
		String[]a2=request.getParameterValues("nam2");
		String[]a3=request.getParameterValues("nam3");
		if(a1!=null){
			DaoI daoi=DaoImpl.getInstance();
			setth=daoi.getsbyStartId(a1);
			}
		else if(a2!=null){
			DaoI daoi=DaoImpl.getInstance();
			setth=daoi.getsbyStartId(a2);
			}
		else{
				DaoI daoi=DaoImpl.getInstance();
				setth=daoi.getsbyStartId(a3);
			}
		for(Things th1:setth){
  		  i++;
  		  setlt.add(th1.getTstart());
  		  
  		  }System.out.println(i);
		  Document document = new Document(PageSize.A4, 50, 50, 50, 50);
	      try
	      {   
	    	  StringBuilder sb=new StringBuilder();
	      		for (String string : setlt) 
	      		{
					sb.append(string);
				}
	      		
	      		
	      		
	      		
	      		System.out.println("str ="+sb);
	    	  response.setContentType("application/pdf");
	    	  response.setHeader("Content-Disposition", "inline;filename="+sb+".pdf" );
	    	  ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
			  PdfWriter docWriter = PdfWriter.getInstance(document, baosPDF);
			  docWriter.setEncryption(USER_PASSWORD.getBytes(),OWNER_PASSWORD.getBytes(), PdfWriter.ALLOW_PRINTING,PdfWriter.ENCRYPTION_AES_128);
				document.open();
				Paragraph p= new Paragraph("List of Words Which starts with"+setlt);
				p.setAlignment(Element.ALIGN_CENTER);
				document.add(p);
				 
				
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				    PdfPTable table = new PdfPTable(3); // 3 columns.
			        table.setWidthPercentage(100); //Width 100%
			        table.setSpacingBefore(10f); //Space before table
			        table.setSpacingAfter(10f); //Space after table
		 
			        //Set Column widths
			        float[] columnWidths = {1f,1f,1f};
			        table.setWidths(columnWidths);
			 
			        PdfPCell cell1 = new PdfPCell(new Paragraph("Image"));
			       
			        cell1.setPaddingLeft(10);
			        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			 
			        PdfPCell cell2 = new PdfPCell(new Paragraph("Words"));
			        
			        cell2.setPaddingLeft(10);
			        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			 
			        PdfPCell cell3 = new PdfPCell(new Paragraph("Description"));
			      
			        cell3.setPaddingLeft(10);
			        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			 
			        //To avoid having the cell border and the content overlap, if you are having thick cell borders
			        //cell1.setUserBorderPadding(true);
			        //cell2.setUserBorderPadding(true);
		            //cell3.setUserBorderPadding(true);
			 
			        table.addCell(cell1);
			        table.addCell(cell2);
			        table.addCell(cell3);
			        table.completeRow();
			        for(Things th2:setth){
			        	
			        	String name=th2.getTimage();
			        	Image image1 = Image.getInstance("C:\\Vraob\\FinalHopeSo\\WebContent\\images\\"+name);
			        	image1.scaleAbsolute(200, 200);
				        image1.setLeft(10);
				        image1.setAlignment(Element.ALIGN_CENTER);
				       
				 
				        PdfPCell cell5 = new PdfPCell(new Paragraph(th2.getTname()));
				        
				        cell5.setPaddingLeft(10);
				        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
				 
				        PdfPCell cell6 = new PdfPCell(new Paragraph(th2.getTdesc()));
				      
				        cell6.setPaddingLeft(10);
				        cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
				        cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
				        table.addCell(image1);
				        table.addCell(cell5);
				        table.addCell(cell6);
				        table.completeRow();
				 
			        }
			        	
			        
			      
			 
			        
			   document.add(table);

	            document.close();
				docWriter.close();
				ServletOutputStream sos;
				sos = response.getOutputStream();
				baosPDF.writeTo(sos);
				sos.flush();
				sos.close();
				
				/*HttpSession sess=request.getSession();
				sess.setAttribute("message", " Pdf is downloaded successfully :-).");
				String url="Success.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(url);
				rd.forward(request, response);*/

	       } catch(Exception e){
	         e.printStackTrace();
	       }

		
		
		
		
		
		
		
	}
	}


