function op(val){
	var n1=document.getElementById("txtnum1").value;
	var n2=document.getElementById("txtnum2").value;
	check(n1,n2);
	var pattern=/^-[1-9]|[0-9]+(\.[0-9]{1,})?$/;
	var notpatt=/^([0-9]{11,})+(\.[0-9]{1,})?$/;
	if(n1.match(pattern) && n2.match(pattern)){
		var num1=parseFloat(n1);
		var num2=parseFloat(n2);
		document.getElementById("res").innerHTML="";
		if(n1.match(notpatt) || n2.match(notpatt)){
			document.getElementById("res").innerHTML="";
			document.getElementById("erd").innerHTML="cant enter >10d b4 decimal point";
		}
		else{
		switch(val){
		case "Sum":var res=num1+num2; 
				   break;
		case "Difference":var res=num1-num2;
						  break;
		case "Multiply":var res=num1*num2;
						break;
		case "Divide":var res=num1/num2;
		              break;
		}
		document.getElementById("res").innerHTML=res.
		toFixed(3);
		document.getElementById("erd").innerHTML="Successfull";
		document.forms[0].reset();}}
	
		
}

function clr(){
	document.forms[0].reset();
	document.getElementById("erd").innerHTML="";
	document.getElementById("res").innerHTML="";
}