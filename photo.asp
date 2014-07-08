<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<%
pileet = request.querystring("pileet")
num = cint(request.querystring("num"))
yht = cint(request.querystring("yht"))
%>
	<title>photo <%=num %> / <%=yht %></title>
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
	<td colspan="2" width="100%" align="center"><img src="photot/<%=pileet & num %>.jpg" border="0"></td>
</tr>
<tr>
	<td class="seuraava" width="50%" valign="bottom">
<% if (num > 1) then %>
<a href="photo.asp?pileet=<%=pileet %>&num=<%=(num - 1) %>&yht=<%=yht %>">edellinen</a>&nbsp;
<% end if %>
	</td>
	<td class="edellinen" width="50%" valign="bottom">
<% if (num < yht) then %>
&nbsp;<a href="photo.asp?pileet=<%=pileet %>&num=<%=(num + 1) %>&yht=<%=yht %>">seuraava</a>
<% end if %>
	</td>
</tr>
</table>

</body>
</html>
