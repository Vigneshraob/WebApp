<%@ page import="dao.*" %>
<%
 String str=request.getParameter("word");
System.out.println("came into URD");
 System.out.println(str);
 String res = null;
 DaoI daoi=DaoImpl.getInstance();
 res=daoi.getDesc(str);
 out.println(res);
 %>