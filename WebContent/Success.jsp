<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="csses/univ.css"></link>
<link type="text/css" rel="stylesheet" href="csses/scs.css"></link>
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
<title>Success-Page!!</title>
</head>
<body>
<a href="Calculator.jsp"><input class="button b1" value="Calculator"/></a>
<a href="SLetter.jsp"><input class="button b2" value="Vocabulary"/></a>
<a href="Update.jsp"><input class="button b3" value="Contribute"/></a>
<div id="header"></div>
<div class="left"></div>
<div class="right"></div>
<div id="footer"> &#169 2016. Copyrights Reserved.
<br><a href="Home.jsp"><img src="images/home.jpg" height="30px"/>
</a>
</div>
<span id="msg"> Hi, ${sessionScope.userattribute.getUsername()} </span>
<form id="f1" method="get" action="logout"><input id="lo" type="submit" value="Logout"></form>
<% HttpSession sess= request.getSession();
 String msg=(String)sess.getAttribute("message");
	if(msg.equals(" Thanks for the contribution.Word is added successfully :-)."))
	{%>
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/happy.jpg" /><br>
${sessionScope.message}
</div>
<%}
	else if(msg.equals(" Thanks for the contribution.Word is updated successfully :-).")){%>
	<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/happy.jpg" /><br>
${sessionScope.message}
</div>
<%} 
	else if(msg.equals(" Thanks for the contribution.Description is updated successfully :-).")){%>
	<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/happy.jpg" /><br>
${sessionScope.message}
</div>
<% }	else if(msg.equals(" Pdf is downloaded successfully :-).")){%>
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/happy.jpg" /><br>
${sessionScope.message}
</div>
<% }else{%>
<div id="ermsg" align="center">
<img id="oimg" height="300px" width="300px" src="images/oops.jpg" /><br>
${sessionScope.message}
</div>
<% } %>



</body>
</html>