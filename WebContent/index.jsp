<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
    </script>
    <script>
    $(document).ready(function(){
        $("input").focus(function(){
            $(this).css("background-color", "#4233FF");
        });
        $("input").blur(function(){
            $(this).css("background-color", "#ffffff");
        });
    });
    
</script>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="csses/login.css"></link>
<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
</head>
<body>
<%! int vis=0; %>
<form method="post" action="login">
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br> Visitors visited: <%=++vis%>
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a>
</div>
<table id="lt1">
<thead ><tr><th colspan="2">Login !!!</th></tr></thead>
<tbody>
<tr>
<td>Username</td>
<td><input  type="text" style="height: 30px; font-size:25px; width:170px;" placeholder="user-name" tooltip="Enter User-Name" name="txtname"><img src="images/u.png" id="input_img" width="16" height="16"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" style="height: 30px; font-size:25px; width:170px; " placeholder="password" name="txtpwd"><img src="images/p.png" id="input_img1" width="16" height="16"></td>
</tr>
<tr ><td><input type="submit" id="lb" value="Login"></td>
<td ><a id="nu" href="RegFrm.jsp">New User? Register Here.</a></td></tr>
</tbody>
</table> 
<span id="err">${requestScope.msg}
</span>

</form>
</body>
</html>