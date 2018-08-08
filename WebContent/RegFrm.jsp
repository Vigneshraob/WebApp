<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="Vals.js"></script>
<link type="text/css" rel="stylesheet" href="csses/Reg.css"></link>
<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
<title>Insert title here</title>
</head>
<body>
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.<br>
<a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a>
</div>
<form method="post" action="reg" onsubmit="return passVali()">
<table id="lt1">
<tr><th colspan="2">Enter your Details</th></tr>
<tr>
<td>UserId</td>
<td><input type="text" id="txtuid"  name="txtuid" onblur="vali(this.value,this.id)" required></td>
</tr>
<tr>
<td>UserName</td>
<td><input type="text" id="txtuname" name="txtuname" onblur="nameVali(this.value)" required></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" id="txtupass" name="txtupass"  required></td>
</tr>
<tr>
<th colspan="2">
<input type="submit" value="Register"></th>
</tr>
</table>
<span id="erd" style="text-align: center;"></span>
<span id="erd1"></span>
</form>
</body>
</html>