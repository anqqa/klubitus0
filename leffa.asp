<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<%
filee = request.querystring("filee")
%>
	<title>leffa</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #00BBBB; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #002222; 
	scrollbar-arrow-color: #FFFFFF; 
}
-->
</style>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta6.jpg" bgproperties="fixed" leftmargin="0">

<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td colspan="2" width="100%" align="center"><img src="mpg/<%=filee %>.mpg" border="0"></td>
</tr>
</table>

</body>
</html>
