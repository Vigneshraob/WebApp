<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
<link type="text/css" rel="stylesheet" href="csses/calc.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calculate </title>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
<script src="Vals.js"></script>
<script src="Ops.js"></script>
<title>Login Page</title>
</head>
<body>
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a>
</div>
<c:if test="${sessionScope.userattribute ne null}">
<section>
<span id="msg"> Hi, ${sessionScope.userattribute.getUsername()} </span>
<span id="hdd"><h1> Simple calculator</h1></span>
<hr id="line">
<form id="f1" method="get" action="logout">
<table id="tc" cellpadding="10" cellspacing="0" bgcolor="#e0ffff">
<tr><th>Number 1: </th>
<td><input type="text" id="txtnum1"  onblur="vali(this.value,this.id)"/>
&nbsp;</td>
</tr>
<tr><th>Number 2: </th>
<td><input type="text" id="txtnum2" onblur="vali(this.value,this.id)"/></td>
</tr>
<tr><th>The Result Is: </th>
<td><span id="res"></span></td>
</tr>
<tr>
<th colspan="2" id="erd"></th>
</tr>
</table >
<table id="menu" bgcolor="#d3d3d3">
<tr>
<td><input type="button" value="Sum" onclick="op(this.value)"></td>
<td><input type="button" value="Difference" onclick="op(this.value)"></td> 
<td><input type="button" value="Multiply" onclick="op(this.value)"></td>
<td><input type="button" value="Divide" onclick="op(this.value)"></td>
<td><input type="button" value="Clear" onclick="clr()"></td>
</table>
<input id="lo" type="submit" value="Logout">
 </form> <hr id="line1">
<a href="Calculator.jsp"><input class="button b1" value="Calculator"/></a>
<a href="SLetter.jsp"><input class="button b2" value="Vocabulary"/></a>
<a href="Update.jsp"><input class="button b3" value="Contribute"/></a>


 </c:if>
</section>
<c:if test="${sessionScope.userattribute eq null }">
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
	You are not authenticated.Please <a id="lg" href="index.jsp">Login</a>
</div>
</c:if>
</body>
</html>