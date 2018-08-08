<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
<link type="text/css" rel="stylesheet" href="csses/home.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
<title>Home Page</title>
</head>
<body>
<form id="f1" method="get" action="logout">
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a></div>
<c:if test="${sessionScope.userattribute ne null }">
<div id="wel">Hi , ${sessionScope.userattribute.getUsername()}</div>
<input id="lo" type="submit" value="Logout">
<div id="mar" align="center"><marquee color="red" behavior="alternate" width="1000px">
Welcome to the website.</marquee></div>
<h1 id="hd1">Our Services</h1>
<table id="tb1" cell-padding="5px" cellspacing="20px";>
<tr>
<td><a href="Calculator.jsp"><img src="images/calc.jpg"/></a></td>
<td><a href="SLetter.jsp"><img src="images/vocab.jpg"/></a></td>

</tr>
</table>
</c:if>
</form>
<c:if test="${sessionScope.userattribute eq null }">
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
	You are not authenticated.Please <a id="lg" href="index.jsp">Login</a>
</div>
</c:if>
</body>
</html>