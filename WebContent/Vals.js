function vali(val,id){
	var patt="[0-9]{8}";
	if(isNaN(val)){
		document.getElementById("erd").innerHTML="You entered a character."+
		"Please enter a number";
		document.getElementById(id).focus();
		return false;
		}
	else if(val.match(patt)){
		document.getElementById("erd").innerHTML="------------You can enter max of 7 digits-----------";
		document.getElementById(id).focus();
		return false;
	}
	else
		document.getElementById("erd").innerHTML="";
	   
}
function check(n1,n2){
		if(n1=="" || n2=="" ){
		document.getElementById("erd").innerHTML="You cant let a field blank";
	    document.getElementById("res").innerHTML="";
	}}
function nullchecker()
{

	var arr=["txtupass","txtuname","txtuid"];
	var i=0;
	for(i=0;i<arr.length;i++){
		if(document.getElementById(arr[i]).value=="")
			{
			document.getElementById(arr[i]).focus();
			document.getElementById("erd1").innerHTML="You cant let a field blank";
			return false;
			}}}
function nameVali(val){
	var patt="[A-Z]([a-z]{2,})";
	var patt1=".*\\d+.*";
	if(!val.match(patt) || val.match(patt1))
	{
		document.getElementById("txtuname").innerHTML="";
		document.getElementById("txtuname").focus();
		document.getElementById("erd").innerHTML="Name should begin with capital letter contain & have min 3 letters";
		return false;
	}
	else{
		document.getElementById("erd").innerHTML="";
	}}
function passVali(){
	var patt1=".*[A-Z].*";
	var patt2=".*[a-z].*";
	var patt3=".*\\d+.*";
	var patt4=".*[!@#$%^&*(/(<>?,.].*";
	var patt5=".*\\s+.*";
	var val=document.getElementById("txtupass").value;
	if(! (val.match(patt1) && val.match(patt2) && val.match(patt3) && val.match(patt4)) || val.match(patt5))
	{
		document.getElementById("txtupass").innerHTML="";
		document.getElementById("txtupass").focus();
		document.getElementById("erd").innerHTML="Password must contain Capital,Small letter, a number & spl character";
		document.getElementById("txtupass").focus();
		return false;
	}
	else{
		document.getElementById("erd").innerHTML="";
		
	}}


	
	
	
		


