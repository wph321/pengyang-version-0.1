<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
document.ready(function (){
		button1_onclick();
		button2_onclick();
		button3_onclick();
		button4_onclick();
})


function button1_onclick() {//cpu 信息 
var locator = new ActiveXObject ("WbemScripting.SWbemLocator"); 
var service = locator.ConnectServer("."); 
var properties = service.ExecQuery("SELECT * FROM Win32_Processor"); 
var e = new Enumerator (properties); 

for (;!e.atEnd();e.moveNext ()) 
{ 
var p = e.item (); 
document.getElementById("cpu").innerHTML=p.name; 
<!-- 
document.write("<td>" + p.Caption + "</td>"); 
document.write("<td>" + p.DeviceID + "</td>"); 
document.write("<td>" + p.Name + "</td>"); 
document.write("<td>" + p.CpuStatus + "</td>"); 
document.write("<td>" + p.Availability + "</td>"); 
document.write("<td>" + p.Level + "</td>"); 
document.write("<td>" + p.ProcessorID + "</td>"); 
document.write("<td>" + p.SystemName + "</td>"); 
document.write("<td>" + p.ProcessorType + "</td>"); 
document.write("</tr>");
--> 
} 
} 

function Button2_onclick() {//CD-ROM 信息 
var locator = new ActiveXObject ("WbemScripting.SWbemLocator"); 
var service = locator.ConnectServer("."); 
var properties = service.ExecQuery("SELECT * FROM Win32_CDROMDrive"); 
var e = new Enumerator (properties); 
for (;!e.atEnd();e.moveNext ()) 
{ 
var p = e.item (); 
document.getElementById("caozuoxitong").innerHTML=p.Caption;
<!--  
document.write("<td>" + p.Caption + "</td>"); 
document.write("<td>" + p.Description + "</td>"); 
document.write("<td>" + p.Drive + "</td>"); 
document.write("<td>" + p.Status + "</td>"); 
document.write("<td>" + p.MediaLoaded + "</td>"); 
document.write("</tr>");
--> 
} 
} 

function Button3_onclick() {//键盘信息 
var locator = new ActiveXObject ("WbemScripting.SWbemLocator"); 
var service = locator.ConnectServer("."); 
var properties = service.ExecQuery("SELECT * FROM Win32_Keyboard"); 
var e = new Enumerator (properties); 
for (;!e.atEnd();e.moveNext ()) 
{ 
var p = e.item (); 
document.getElementById("jianpan").innerHTML=p.Name;
<!--  
document.write("<td>" + p.Description + "</td>"); 
document.write("<td>" + p.Name + "</td>"); 
document.write("<td>" + p.Status + "</td>"); 
document.write("</tr>");
--> 
} 
} 

function Button4_onclick() {//主板信息 
var locator = new ActiveXObject ("WbemScripting.SWbemLocator"); 
var service = locator.ConnectServer("."); 
var properties = service.ExecQuery("SELECT * FROM Win32_BaseBoard"); 
var e = new Enumerator (properties); 
for (;!e.atEnd();e.moveNext ()) 
{ 
var p = e.item (); 
document.getElementById("zhuban").innerHTML=p.HostingBoard;

document.write("<td>" + p.HostingBoard + "</td>"); 
document.write("<td>" + p.Manufacturer + "</td>"); 
document.write("<td>" + p.PoweredOn + "</td>"); 
document.write("<td>" + p.Product + "</td>"); 
document.write("<td>" + p.SerialNumber + "</td>"); 
document.write("<td>" + p.Version + "</td>"); 
document.write("</tr>");

} 
} 
</script>
</head>
<body>

<table id="1">

	<tr>
		<td id="cpu"></td>
		<td id="caozuoxitong"></td>
		<td id="jianpan"></td>
		<td id="zhuban"></td>
	</tr>
</table>

</body>
</html>