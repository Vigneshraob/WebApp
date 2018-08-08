$(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack()}
    });
function ShowAdd(){
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('st1').style.visibility='visible';
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById('rm').style.visibility='hidden';
	document.getElementById("table2").style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowUpd(){
	document.getElementById('st2').style.visibility='visible';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('rm').style.visibility='hidden';
	document.getElementById("table2").style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowSpell(){
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('upsp').style.visibility='visible';
	document.getElementById('rm').style.visibility='hidden';
	document.getElementById("table2").style.visibility='hidden';
	document.getElementById("er").innerHTML="";
}
function ShowRem(){
	document.getElementById('upsp').style.visibility='hidden';
	document.getElementById('st1').style.visibility='hidden';
	document.getElementById('st2').style.visibility='hidden';
	document.getElementById("table2").style.visibility='visible';
	document.getElementById('rm').style.visibility='visible';
}
function finStart(val){
	var patt=".*[A-Z]([a-z]{2,}).*";
	var patt1=".*\\d+.*";
	if(!val.match(patt) || val.match(patt1))
	{
		document.getElementById('addthing').rows[2].cells[1].getElementsByTagName('input')[0].focus();
		document.getElementById('er').innerHTML="Spelling should begin with capital letter contain & have min 3 letters";
		return false;
	}else{
		var sl=val.charAt(0);
		document.getElementById('addthing').rows[3].cells[1].getElementsByTagName('input')[0].value=sl;
		}
	}
function fineStart(val){
	var patt=".*[A-Z]([a-z]{2,}).*";
	var patt1=".*\\d+.*";
	if(!val.match(patt) || val.match(patt1))
	{
		document.getElementById('addthing').rows[2].cells[1].getElementsByTagName('input')[0].focus();
		document.getElementById('er').innerHTML="Spelling should begin with capital letter contain & have min 3 letters";
		return false;
	}}
function chksize(){
	var str=document.getElementById("widesc").value;
	var siz=str.length;
	if(siz>45){
		document.getElementById('er').innerHTML="Maximum 40 char is allowed.";
		return false;
	}
	else
		return true;
}
function nul(){
	if(document.getElementById("word").value=="" || document.getElementById("widesc").value==""){
		document.getElementById('er').innerHTML="None of the fields should be blank";
		return false;
	}}
function nul2(){
	if(document.getElementById("upspl").value=="" || document.getElementById("fl").value==""){
		document.getElementById('er').innerHTML="None of the fields should be blank";
		return false;
	}}



