<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>vapaa sana</title>
<META HTTP-EQUIV="refresh" content="300; url=sana.asp">
<link rel="stylesheet" href="style.css" type="text/css">
<%
sanoma = request.form("sanoma")

if sanoma = "" then
	set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	set objSanoma = objFSO.OpenTextFile(Server.Mappath("data\sanoma.txt"), 1, false)
	sanoma = objSanoma.readall
	objSanoma.close
else
	set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	set objSanoma = objFSO.CreateTextFile(Server.Mappath("data\sanoma.txt"), true)
	sanoma = replace(sanoma, "<", "&lt;")
	sanoma = replace(sanoma, ">", "&gt;")
	sanoma = replace(sanoma, "&lt;b&gt;", "<b>")
	sanoma = replace(sanoma, "&lt;/b&gt;", "</b>")
	sanoma = replace(sanoma, "&lt;i&gt;", "<i>")
	sanoma = replace(sanoma, "&lt;/i&gt;", "</i>")
	sanoma = replace(sanoma, "&lt;u&gt;", "<u>")
	sanoma = replace(sanoma, "&lt;/u&gt;", "</u>")
	sanoma = replace(sanoma, "&lt;B&gt;", "<b>")
	sanoma = replace(sanoma, "&lt;/B&gt;", "</b>")
	sanoma = replace(sanoma, "&lt;I&gt;", "<i>")
	sanoma = replace(sanoma, "&lt;/I&gt;", "</i>")
	sanoma = replace(sanoma, "&lt;U&gt;", "<u>")
	sanoma = replace(sanoma, "&lt;/U&gt;", "</u>")
	objSanoma.writeline sanoma
	objSanoma.close
end if
%>
</head>

<body bgcolor="#000000" text="#FFFFFF">

<table width="100%" cellpadding="4" cellspacing=0 border=0>
<tr>
	<td width="10%">&nbsp;</td>
	<td width="60" class="edellinen"><br>sanoma: </td>
	<td align="left"><br><%=sanoma %></td>
	<td class="seuraava"><br><a href="sana.html">vaihda sanoma</a></td>
	<td width="10%">&nbsp;</td>
</tr>
</table>

</body>
</html>
