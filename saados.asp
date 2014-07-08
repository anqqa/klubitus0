<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
<link rel="stylesheet" href="style.css" type="text/css">
<%
p = request.form("p")
kk = request.form("kk")
kk2 = request.form("kk2")
v = request.form("v")
num = int(request.form("num"))
pileet = lcase(request.form("pileet"))
pileeturl = request.form("pileeturl")
paikka = lcase(request.form("paikka"))
paikkaurl = request.form("paikkaurl")
dj = lcase(request.form("dj"))
muuta = lcase(request.form("muuta"))
salasana = lcase(request.form("salasana"))
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
fn = "data\" & v & kk2

set objEntries = objFSO.OpenTextFile(Server.Mappath(fn), 1, false)
allfile = objEntries.readall
objEntries.close
allfile = replace(allfile, chr(13), "§")
allEntries = split(allfile, "§")
numEntries = cInt(ubound(allEntries) / 8)

dAdded = 0
dP = 1
dPileet = 2
dPileeturl = 3
dPaikka = 4
dPaikkaurl = 5
dDj = 6
dMuuta = 7

sub setData(rec, dataType, data)
	if rec > 0 then
		allEntries((rec - 1) * 8 + dataType) = data
	end if
end sub

function getData(rec, dataType)
	if rec > 0 then
		getData = allEntries((rec - 1) * 8 + dataType)
	end if
end function

sub saveData
	set objEntries = objFSO.CreateTextFile(Server.Mappath(fn), true)
	for entries = 0 to numEntries - 1
		if not ((kk <> kk2) and (entries = (num - 1)) or (getData(entries + 1, dPileet) = "")) then
			for cells = 0 to 6
				objEntries.write getData(entries + 1, cells) & "§"
			next
			objEntries.write getData(entries + 1, 7) & chr(13)
		end if
	next
	objEntries.close
end sub

if (salasana = "huoh") then

setData num, dAdded, added
setData num, dP, p
setData num, dPileet, pileet
setData num, dPileeturl, pileeturl
setData num, dPaikka, paikka
setData num, dPaikkaurl, paikkaurl
setData num, dDj, dj
setData num, dMuuta, muuta
saveData

if not (kk = kk2) then
	set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	fn = "data\" & v & kk
	if objFSO.FileExists(Server.Mappath(fn)) then
		set objDesc = objFSO.OpenTextFile(Server.Mappath(fn), 8, true)
	else
		set objDesc = objFSO.CreateTextFile(Server.Mappath(fn), false)
	end if
	objDesc.writeline added & "§" & p & "§" & pileet & "§" & pileeturl & "§" & paikka & "§" & paikkaurl & "§" & dj & "§" & muuta
	objDesc.close
end if

else

Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
Mailer.FromName = "klubiopas"
Mailer.FromAddress = "klubi@anqqa.com"
Mailer.RemoteHost = "smtpgw.activeisp.com"
Mailer.AddRecipient "anqqa", "webmaster@anqqa.com"
Mailer.Subject = "Klubbaajan Opas... Helsinkiin - bilefixaus"
bt = "päivä: " & p & "." & kk & "." & v & vbnewline & "pileet: " & pileet & vbnewline & "pileeturl: " & pileeturl
bt = bt & vbnewline & "     paikka: " & paikka & vbnewline & "paikkaurl: " & paikkaurl & vbnewline
bt = bt & "dj: " & dj & vbnewline & "muuta: " & muuta & vbnewline
bt = bt & "salasana: " & salasana & vbnewline & "ip: " & request.servervariables("REMOTE_ADDR")
Mailer.BodyText = bt
Mailer.SendMail

end if

%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="7">&nbsp;</td>
	<td>
<%
if (salasana = "huoh") then
	response.write("jees")
else
	response.write("jees, muutos tarkistetaan mitä pikimmiten")
end if
%>
<p>
<a href="pileet.asp?kk=<%=kk %>&v=<%=v %>">takas</a>
	</td>
	<td width="10%" rowspan="7">&nbsp;</td>
</tr>
</table>
</div>

</body>
</html>
