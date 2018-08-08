<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script type="text/javascript" src="Imp1.js"></script>
<link type="text/css" rel="stylesheet" href="csses/up.css">
<link type="text/css" rel="stylesheet" href="csses/univ.css">
<title>Update Description</title>
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
<span id="er"></span>
<!-- *************************************Menu options**************************************** -->

<input class="button btn1" type="button" value="Add a new word" onclick="ShowAdd()">
<input class="button btn2" type="button" value="Update the word" onclick="ShowUpd()">
<input class="button btn3" type="button" value="Remove the word" onclick="Showmenu()">

 <div id="divoftables">
<!-- *************************************Upload Image**************************************** -->


<form action="upload" method="post"  enctype="multipart/form-data" >
  <div id="st1" style="visibility:hidden;">
  <input type="file" id="fn" name="txtfile">
    <input type="submit"/></div>
</form>

<!-- *************************************Update Menu options************************* -->
  <div id="st2" style="visibility:hidden;">
<p><b>Select an option from the below list</b></p>
  <li onclick="ShowSpell()" style="cursor:pointer">Update the Spelling</li>
  <a href="UpdateDesc.jsp" style="text-decoration: none; color:violet;">
  <li>Update the Description</li></a>
  <li onclick="ShowImage()"style="cursor:pointer">Update the Image</li>
</div>
<!-- *************************************Updating Spelling**************************************** -->
<form action="updateword" method="post" onsubmit="return nul()">
<div id="upsp" style="visibility:hidden;">
<table id="addthing" style="color:#ffff66; background-color:#ffb3da;">
<tr><th colspan="2">Please Enter The Details To Be Updated</th></tr>
<tr><td>Spelling to be replaced</td>
<td><select class="op" name="fl">
<option>--select word--</option>
<c:forEach items="${sessionScope.listnames}" var="str">
<option  id="firstline"> ${str}</option>
</c:forEach>
</select></td></tr>
<tr><td>Correct Spelling</td>
<td><input type="text" name="upspl" id="upspl" onblur="fineStart(this.value)"></td></tr>
<tr><th colspan="2">
<input type="submit" style="background-color:pink; font-size:20px; border-radius:5px" value="Upadte Spelling">
</th></tr>
</table>
</div>
</form>
<!-- *************************************Updating Description**************************************** -->
<form action="updatedesc" method="post" onsubmit="return nul2()">
<div id="upds">
<table id="upthing" style="color:#ffff66; background-color:#ffb3da;">
<tr><th colspan="2">Please Enter The Details To Be Updated</th></tr>
<tr><td> Select word</td>
<td><select class="op" name="wd" id="wd" onblur="fillDesc(this.value)">
<option>--select word--</option>
<c:forEach items="${sessionScope.listnames}" var="str">
<option>${str}</option>
</c:forEach>
</select></td></tr>
<tr><td>Description to be replaced</td>
<td><input id="corders" name="corders" readonly required></td></tr>
<tr><td>Correct Description</td>
<td><input type="text" name="updesc" id="updesc" onblur="chksize()"></td></tr>
<tr><th colspan="2">
<input type="submit" style="background-color:pink; font-size:20px; border-radius:5px" value="Upadte Description">
</th></tr>
</table>
</div>
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