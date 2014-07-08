<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>vapaa sana</title>
<link rel="stylesheet" href="style.css" type="text/css">
<%
set objFSO = Server.CreateObject("Scripting.FileSystemObject")
set objEntries = objFSO.OpenTextFile(Server.Mappath("data\sanoma.txt"), 1, false)
sanoma = objEntries.readall
objEntries.close
%>
</head>

<body bgcolor="#000000" text="#FFFFFF">

<form action="sana.asp" method="POST">
<table width="100%" cellpadding="4" cellspacing=0 border=0>
<tr>
	<td width="10%" rowspan="5">&nbsp;</td>
	<td class="seuraava">sanoma: </td>
	<td>joo<%=sanoma %></td>
	<td class="edellinen"><a href="sana.html">vaihda sanoma</a></td>
	<td width="10%" rowspan="5">&nbsp;</td>
</tr>
</table>
</form>

</body>
</html>
