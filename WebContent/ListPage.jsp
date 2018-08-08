<%@page import="vo.Things"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script>
    $(window).ready(function() {
        function disableBack() { window.history.forward() }

          window.onload = disableBack(); 
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() } 
    });
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="csses/univ.css"> 
<link type="text/css" rel="stylesheet" href="csses/lp.css"> 
<title>Insert title here</title>
</head>

<body>
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a></div>
<c:if test="${sessionScope.userattribute ne null }">
<form method="get" action="logout">
<div id="wel">Hi , ${sessionScope.userattribute.getUsername()}</div>
<input id="lo" type="submit" value="Logout"></form>
<form action="vvv" method="post" target="_blank">
<div id="table2">
<table id="lt">
<tr><th>Image</th>
    <th>Name</th>
    <th>Description</th>
</tr>
<c:if test="${requestScope.LT1 ne null}">
<tr>
<c:forEach items="${requestScope.LT1}" var="str">
<tr>
<td name="im1"><img style="height:50px; width:50px;" src="images/${str.timage}"/></td>
<td name="nam1" >${str.tname}</td>
<td name="desc1">${str.tdesc}</td>
<input  style="visibility:hidden "type="text" id="dontcome" name="nam1" value="${str.tid}"/>

</tr>
</c:forEach>

</c:if>

<c:if test="${requestScope.LT2 ne null}">
<tr>
<c:forEach items="${requestScope.LT2}" var="str">
<tr>
<td><img style="height:50px; width:50px;" src="images/${str.timage}"/></td>
<td>${str.tname}</td>
<td>${str.tdesc}</td>
<input  style="visibility:hidden "type="text" id="dontcome" name="nam2" value="${str.tid}"/>
</tr>
</c:forEach>
</c:if>

<c:if test="${requestScope.LT3 ne null}">
<tr>
<c:forEach items="${requestScope.LT3}" var="str">
<tr>
<td><img style="height:50px; width:50px;" src="images/${str.timage}"/></td>
<td name="nam3">${str.tname}</td>
<td>${str.tdesc}</td>
<input  style="visibility:hidden "type="text" id="dontcome" name="nam3" value="${str.tid}"/>
</tr>
</c:forEach>
</c:if>
</table>
</div>
<input id="keys" type="submit" value="download">
</form>
</c:if>
<div id="contribute">If you want to update the library,Then <a href="Update.jsp">click here</a></div>
<c:if test="${sessionScope.userattribute eq null }">
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
	You are not authenticated.Please <a id="lg" href="index.jsp">Login</a>
</div>
</c:if>
</body>
</html>