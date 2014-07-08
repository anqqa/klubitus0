<!-- #INCLUDE FILE="discussfuncs.asp" -->
<%
id	= TRIM( Request( "id" ) )
IF id = "-1" THEN id = ""
%>

<html>
<head>
<title>viesti vastaus</title>
<link rel="stylesheet" href="../style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #009900; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #002200; 
	scrollbar-arrow-color: #FFFFFF; 
}
-->
</style>
</head>
<body bgcolor="#002200" background="../pics/tausta5a.jpg" bgproperties="fixed">

<table width="100%" border=0 cellpadding=2 cellspacing=0>
<tr>
	<td width="10%">&nbsp;</td>
	<td class="edellinen"><a href="messagelist.asp" target="main">takaisin</a></td>
	<td class="seuraava"><a href="post.asp?id=<%=id%>" target="main">vastaa</a></td>
	<td width="10%">&nbsp;</td>
</tr>
</table>

</body>
</html>
