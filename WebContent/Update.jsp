<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*"%> 
<%@ page import="vo.*"%> 
<%@ page import="java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script type="text/javascript" src="Imp.js"></script>
<script type="text/javascript">
<% DaoI daoi=DaoImpl.getInstance(); 
List<Things> lt=daoi.getEverything();
%>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="csses/univ.css"> 
<link type="text/css" rel="stylesheet" href="csses/up.css"> 
<title>Update-Page</title>

</head>
<body>
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a>
</div>
<c:if test="${sessionScope.userattribute ne null }">
<div id="wel">Hi , ${sessionScope.userattribute.getUsername()}</div>
<form id="f1" method="get" action="logout"><input id="lo" type="submit" value="Logout"></form>
<a href="Calculator.jsp"><input class="button1 b1" value="Calculator"/></a>
<a href="SLetter.jsp"><input class="button1 b2" value="Vocabulary"/></a>
<a href="Update.jsp"><input class="button1 b3" value="Contribute"/></a>


<div>
<input class="button btn1" type="button" value="Add a new word" onclick="ShowAdd()">
<input class="button btn2" type="button" value="Update the word" onclick="ShowUpd()">
<input class="button btn3" type="button" value="Remove the word" onclick="ShowRem()">
</div>

<span id="er"></span>
<div id="divoftables">
</form>
<form action="upload" method="post"  enctype="multipart/form-data" >
  <div id="st1" style="visibility:hidden;">
  <input type="file" id="fn" name="txtfile">
    <input type="submit"/></div>
</form>
  <div id="st2" style="visibility:hidden;">
<p><b>Select an option from the below list</b></p>
  <li onclick="ShowSpell()" style="cursor:pointer">Update the Spelling</li>
  <a href="UpdateDesc.jsp" style="text-decoration: none; color:violet;"><li>Update the Description</li></a>
  <li onclick="ShowImage()"style="cursor:pointer">Update the Image</li>
</div>
<form action="updateword" method="post" onsubmit="return nul2()">
<div id="upsp" style="visibility:hidden;">
<table id="upthing" style="color:#ffff66; background-color:#ffb3da;">
<tr><th colspan="2">Please Enter The Details To Be Updated</th></tr>
<tr><td>Spelling to be replaced</td>
<td><select class="op" name="fl" id="fl">
<option>--select word--</option>
<c:forEach items="${sessionScope.listnames}" var="str">
<option> ${str}</option>
</c:forEach>
</select></td></tr>
<tr><td>Correct Spelling</td>
<td><input type="text" name="upspl" id="upspl" onblur="finStart(this.value)"></td></tr>
<tr><th colspan="2">
<input type="submit" style="background-color:pink; font-size:20px; border-radius:5px" value="Upadte Spelling">
</th></tr>
</table>
</div>
</form>
<form action="removeword" method="post">
<div id="table2" style="visibility:hidden">
<table id="lt">
<tr><th>Select</th>
	<th>Image</th>
    <th>Name</th>
    <th>Description</th>
</tr>
<%if(!lt.isEmpty()) %>
<tr>
<%int i=0; %>
<%for(Things th:lt){%>
<td><input type="checkbox" name="remove" id="c<%=i++%>" value="<%=th.getTname()%>"/></td>
<td><img style="height:50px; width:50px;" src="images/<%=th.getTimage()%>"/></td>
<td><%=th.getTname() %></td>
<td><%=th.getTdesc() %></td>
</tr>
<%} %>
</table>
</div>
<input  style="visibility: hidden" id="rm" type="submit" value="Remove word">

</form>
<div id="error">${sessionScope.imageerror}</div>

</c:if>
<c:if test="${sessionScope.userattribute eq null }">
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
	You are not authenticated.Please <a id="lg" href="index.jsp">Login</a>
</div>
</c:if>
</body>
</html>