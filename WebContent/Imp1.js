function fillDesc()
{
	var val=document.getElementById("wd").value;
	var xmlhttp = null;
	if (window.XMLHttpRequest)
		xmlhttp = new XMLHttpRequest();//chrome, safari, opera, ff, IE7 +
	else
		xmlhttp = new ActiveXObject(Microsoft.XMLHTTP);//IE 5, IE6

	var url = "UpdateDescResult.jsp?word=" + val+"";
	xmlhttp.open("GET", url, 1);
	xmlhttp.send();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var data = xmlhttp.responseText;
			document.getElementById("upthing").rows[2].cells[1].getElementsByTagName('input')[0].value=data;
			
		}
	}
}
function ShowAdd(){
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('st1').style.visibility='visible';
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById('upds').style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowUpd(){
	document.getElementById('st2').style.visibility='visible';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('upds').style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowSpell(){
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('upsp').style.visibility='visible';
	document.getElementById('upds').style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowDesc(){
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('upds').style.visibility='visible';
	document.getElementById("er").innerHTML="";
}
function nul(){
	if(document.getElementById("word").value=="" || document.getElementById("widesc").value==""){
		document.getElementById('er').innerHTML="None of the fields should be blank";
		return false;
	}}
function nul2(){
		if(document.getElementById("wd").value=="" || document.getElementById("corders").value=="" || 
			document.getElementById("updesc").value==""){
		document.getElementById("er").innerHTML="None of the fields should be blank";
		return false;
	}}