// JavaScript Document
function check_validate()
{
subject = document.getElementById("subject");
rec = document.getElementById("recipient");
body = document.getElementById("body");

if (rec.value=="")
{
alert("Recipient Can't be blank");
rec.focus();
return false;
}
if (subject.value=="")
{
alert("Subject Can't be blank");
subject.focus();
return false;
}
if (body.value=="")
{
alert("Body Can't be blank");
body.focus();
return false;
}


	
	
return true;
}