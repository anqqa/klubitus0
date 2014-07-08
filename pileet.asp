<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>pileet</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #990099; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #341729; 
	scrollbar-arrow-color: #FFFFFF; 
}
input, textarea, select { 
	background: #341729;
	color: #FFFFFF;
	font-family: Arial;
	text-align: left;
}
-->
</style>
<%
kk = request.querystring("kk")
v = request.querystring("v")
d = request.querystring("d")
if (kk = "") then kk = month(date())
if (v = "") then v = datepart("yyyy", date())
if (d = "") then d = 0
kk = int(kk) + int(d)
if (kk > 12) then 
	kk = 1
	v = int(v) + 1
end if
if (kk < 1) then
	kk = 12
	if int(v) > 2000 then v = int(v) - 1
end if

dim kuut(12)
kuut(1) = "TAMMIKUU"
kuut(2) = "HELMIKUU"
kuut(3) = "MAALISKUU"
kuut(4) = "HUHTIKUU"
kuut(5) = "TOUKOKUU"
kuut(6) = "KESÄKUU"
kuut(7) = "HEINÄKUU"
kuut(8) = "ELOKUU"
kuut(9) = "SYYSKUU"
kuut(10) = "LOKAKUU"
kuut(11) = "MARRASKUU"
kuut(12) = "JOULUKUU"

dim paivat(7)
paivat(1) = "ma"
paivat(2) = "ti"
paivat(3) = "ke"
paivat(4) = "to"
paivat(5) = "pe"
paivat(6) = "la"
paivat(7) = "su"

set objFSO = Server.CreateObject("Scripting.FileSystemObject")
fn = "data\" & zero(v) & zero(kk)

if objFSO.FileExists(Server.Mappath(fn)) then
	set objEntries = objFSO.OpenTextFile(Server.Mappath(fn), 1, false)
	allfile = objEntries.readall
	objEntries.close
	allfile = replace(allfile, chr(13), "§")
	allEntries = split(allfile, "§")
	numEntries = cInt(ubound(allEntries) / 8)
else
	numEntries = 0
end if

dAdded = 0
dP = 1
dPileet = 2
dPileeturl = 3
dPaikka = 4
dPaikkaurl = 5
dDj = 6
dMuuta = 7

tanaan = false

dim sorted()
redim sorted(numEntries)

for e = 1 to numEntries
	sorted(e) = e
next
function sort()
	for e = 1 to numEntries - 1
		for s = e to numEntries
			if int(getData(sorted(s), dP)) < int(getData(sorted(e), dP)) then swap sorted(e), sorted(s)
		next
	next
end function

function fexists(existname)
	if objFSO.FileExists(Server.Mappath("data\" & existname)) then fexists = true else fexists = false
end function

function swap(var1, var2)
	vartemp = var1
	var1 = var2
	var2 = vartemp
end function

function getData(rec, dataType)
	if rec > 0 then
		getData = allEntries((rec - 1) * 8 + dataType)
	end if
end function

function zero(num)
	if num < 10 then 
		temp = "0" & num 
	else 
		temp = num
	end if
	zero = temp
end function

function paiva(p, kk, v)
	temp = weekday(zero(kk) & "/" & zero(p) & "/" & v, 2)
	paiva = paivat(temp)
end function
sort
%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="4">&nbsp;</td>
	<td class="edellinen"><a href="pileet.asp?kk=<%=kk %>&v=<%=v %>&d=-1">edellinen</a><br> <br></td>
	<td align="center" valign="bottom">
<form method="post" action="etsi.asp">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
	<td><input type="text" name="etsin" size="20">&nbsp;</td>
	<td><input style="background: none" type="image" name="submit" src="pics/icon_etsi.gif" alt="etsi" width="12" height="22" hspace="5" align="absmiddle" border="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
<select name="pika" onChange="window.location.href=this.options[this.selectedIndex].value">
<%
for vuodet = 2000 to 2001 
	for kuukaudet = 1 to 12
		if fexists(vuodet & zero(kuukaudet)) then
%>
<option value="pileet.asp?kk=<%=kuukaudet %>&v=<%=vuodet %>" <% if (vuodet & kuukaudet = v & kk) then response.write("selected") %>><%=lcase(kuut(kuukaudet)) %>, <%=vuodet %></option>
<%
		end if
	next 
next
%>
</select>
	</td>
</tr>
</table>
</form>
	</td>
	<td class="seuraava"><a href="pileet.asp?kk=<%=kk %>&v=<%=v %>&d=+1">seuraava</a><br> <br></td>
	<td width="10%" rowspan="4">&nbsp;</td>
</tr>
<tr>
	<td class="kuukausi" colspan="2"><%=kuut(int(kk)) %>, <%=v %></td>
	<td class="seuraava"><img src="pics/icon_uusi.gif" width=19 height=19 border=0 alt="" align="absmiddle"> <a href="lisaa.asp?kk=<%=kk %>&v=<%=v %>" align="right">uus pile</a></td>
</tr>
<tr>
	<td colspan="3">
<table width="100%" cellspacing="0" cellpadding="3" border="0">
<%
if numEntries > 0 then
	for e = 1 to numEntries
		state = "1x1.gif"
		if dateDiff("d", getData(sorted(e), dAdded), date()) < 4 then state = "icon_uusi.gif"
		if (int(getData(sorted(e), dP)) = int(datepart("d", date())) and int(kk) = int(datepart("m", date()))) then 
			if not tanaan then
				tanaan = true
				response.write("<a name='tanaan'></a>")
			end if
		end if
%>
<tr <% if (int(getData(sorted(e), dP)) = int(datepart("d", date())) and int(kk) = int(datepart("m", date()))) then response.write("bgcolor='#990099'") %> >
	<td class="uusi" rowspan="2" valign="middle" width="30"><img src="pics/<%=state %>" width=19 height=19 border=0 alt=""></td>
	<td class="pvm" rowspan="2" valign="top"><%=paiva(getData(sorted(e), dP), kk, v)%>&nbsp;<a href="saada.asp?kk=<%=kk %>&v=<%=v %>&num=<%=sorted(e) %>"><%=zero(getData(sorted(e), dP)) %></a>.</td>
	<td class="pile" valign="top"><% if not (getData(sorted(e), dPileeturl) = "") then %><a href="<%=getData(sorted(e), dPileeturl) %>" class="pile" target="new"><%=getData(sorted(e), dPileet) %></a><% else %><%=getData(sorted(e), dPileet) %><% end if %></td>
	<td class="selitys" valign="top">
dj: <%=getData(sorted(e), dDj) %>
	</td>
</tr>
<tr <% if (int(getData(sorted(e), dP)) = int(datepart("d", date())) and int(kk) = int(datepart("m", date()))) then response.write("bgcolor='#990099'") %> >
	<td class="paikka" valign="top"><% if not (getData(sorted(e), dPaikkaurl) = "") then %><a href="<%=getData(sorted(e), dPaikkaurl) %>" class="paikka" target="new"><%=getData(sorted(e), dPaikka) %></a><% else %><%=getData(sorted(e), dPaikka) %><% end if %></td>
	<td class="selitys">
<%=getData(sorted(e), dMuuta) %>&nbsp;
	</td>
</tr>
<%
	next
end if
%>
</table>
	</td>
</tr>

<tr>
	<td class="edellinen"><a href="pileet.asp?kk=<%=kk %>&v=<%=v %>&d=-1">edellinen</a></td>
	<td>&nbsp;</td>
	<td class="seuraava"><a href="pileet.asp?kk=<%=kk %>&v=<%=v %>&d=+1">seuraava</a></td>
</tr>
</table>
</div>

</body>
</html>
