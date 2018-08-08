<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jquery-ui.js"></script>
<script type="text/javascript" src="jquery1.8.js"></script>
<script src="Vals.js"></script>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>

<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
<link type="text/css" rel="stylesheet" href="csses/sl.css"></link>
<title>Letters</title>
</head>
<body>

<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a></div>
<a href="Calculator.jsp"><input class="button b1" value="Calculator"/></a>
<a href="SLetter.jsp"><input class="button b2" value="Vocabulary"/></a>
<a href="Update.jsp"><input class="button b3" value="Contribute"/></a>
<c:if test="${sessionScope.userattribute ne null }">
<form action="logout" method="get">
<input id="lo" type="submit" value="Logout">
</form>
<form action="SL" method="post"  >
<div id="wel">Hi , ${sessionScope.userattribute.getUsername()}</div>
<p id="sellet6"><b>Choose the letters to find words:</b></p>
<p id="sellet1"><b>Choose the letter to find words:</b> </p>
<select id="sellet" name="sellet">
<option  value="">--sel letter--</option>
<c:forEach items="${applicationScope.Start}" var="str">
<option value="${str}" >${str}</option>
</c:forEach>
</select>
<input id="sellet2" type="submit" value="submit"/>
</form>







<form action="SL1" method="post"  >
<p id="sellet3"><b>Choose the letter to find words:</b> </p>
<div id="fs"><c:forEach items="${applicationScope.Start}" var="str">
 <span id="sellet4"><input  id="gen" type="radio" name="gender" value="${str}">${str}</span><br>
</c:forEach></div>
<input id="sellet5" type="submit" value="submit"/>
</form>











<form action="SL2" method="post" >

<input id="sellet8" type="submit" value="submit"/>


<hr id="breaker">
<hr id="brk2">
<hr id="brk3">
<hr id="brk4">
<div id="cb1">
<c:forEach items="${applicationScope.Start}" var="str">
<div class="horis"><input type="checkbox" name="cbs" value="${str}"/>${str}<br></div>
</c:forEach>
</div>
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