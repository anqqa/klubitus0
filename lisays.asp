<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<link rel="stylesheet" href="style.css" type="text/css">
<%
p = request.form("p")
kk = request.form("kk")
v = request.form("v")
pileet = lcase(request.form("pileet"))
pileeturl = request.form("pileeturl")
paikka = lcase(request.form("paikka"))
paikkaurl = request.form("paikkaurl")
dj = lcase(request.form("dj"))
muuta = lcase(request.form("muuta"))
added = date()

muuta = replace(muuta, chr(13), "<br>")

if left(pileeturl, 3) = "www" then pileeturl = "http://" & pileeturl
if (instr(pileeturl, ".") < 1) or (instr(pileeturl, "http") < 1) then
	pileeturl = ""
end if

if left(paikkaurl, 3) = "www" then paikkaurl = "http://" & paikkaurl
if (instr(paikkaurl, ".") < 1) or (instr(paikkaurl, "http") < 1) then
	paikkaurl = ""
end if

set objFSO = Server.CreateObject("Scripting.FileSystemObject")
fn = "data\" & v & kk
if objFSO.FileExists(Server.Mappath(fn)) then
	set objDesc = objFSO.OpenTextFile(Server.Mappath(fn), 8, true)
else
	set objDesc = objFSO.CreateTextFile(Server.Mappath(fn), false)
end if
objDesc.writeline added & "§" & p & "§" & pileet & "§" & pileeturl & "§" & paikka & "§" & paikkaurl & "§" & dj & "§" & muuta
objDesc.close

%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="7">&nbsp;</td>
	<td>
jees.
<p>
<a href="pileet.asp?kk=<%=kk %>&v=<%=v %>">takas</a>
	</td>
	<td width="10%" rowspan="7">&nbsp;</td>
</tr>
</table>
</div>

</body>
</html>
