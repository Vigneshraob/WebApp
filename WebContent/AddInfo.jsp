<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script type="text/javascript" src="Imp.js"></script>
<script>
$(document).ready(function() {
<% DaoI d = DaoImpl.getInstance(); %>
<% int rows=d.getThingId(); %>
alert(<%=rows%>)
document.getElementById('addthing').rows[1].cells[1].getElementsByTagName('input')[0].value=<%=++rows%>;
});

function chksize(){
	var str=document.getElementById("widesc").value;
	var siz=str.length;
	if(siz>45){
		document.getElementById('addthing').rows[4].cells[1].getElementsByTagName('input')[0].value=null;
		document.getElementById('er').innerHTML="Maximum 40 char is allowed.";
		return false;
	}
	else
		return true;
}
</script>
<link type="text/css" rel="stylesheet" href="csses/univ.css">
<link type="text/css" rel="stylesheet" href="csses/adi.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<span id="er"></span>

<form action="newword" method="post" onsubmit="return nul()">
<table id="addthing" style="color:#ffff66; background-color:#ffb3da; ">
<tr><th colspan="2">Please Enter The Details</th></tr>
<tr><td>Word Id</td>
<td><input type="text" name="wnum" id="number" readonly></td></tr>
<tr><td>Spelling</td>
<td><input type="text" name="wname" id="word" onblur="finStart(this.value)"></td></tr>
<tr><td>First Letter </td>
<td><input type="text" name="wslet" id="wslet" readonly></td></tr>
<tr><td>Image Description </td>
<td><input type="text" name="widesc" id="widesc" placeholder="5-6 words only" onblur="chksize()"></td></tr>
<tr><td>Image Name </td>
<td><input type="text" name="winame" id="winame" value="${sessionScope.imagename}" readonly></td></tr>
<tr><th colspan="2"><input type="submit" style=" background-color:pink; font-size:20px; border-radius:5px" value="Add Word"></th></tr>
</table>
</form>
</c:if>
<c:if test="${sessionScope.userattribute eq null }">
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
	You are not authenticated.Please <a id="lg" href="index.jsp">Login</a>
</div>
</c:if>
</body>
</html>