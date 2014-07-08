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
etsin = request.form("etsin")

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


dim allEntries, numEntries

sub openData(v, kk)
	set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	fn = "data\" & zero(v) & zero(kk)
	if objFSO.FileExists(Server.Mappath(fn)) then
		set objEntries = objFSO.OpenTextFile(Server.Mappath(fn), 1, false)
		allfile = objEntries.readall
		objEntries.close
		allfile = replace(allfile, chr(13), "§")
		redim allEntries(cint(ubound(split(allfile, "§"))))
		allEntries = split(allfile, "§")
		numEntries = cInt(ubound(allEntries) / 8)
		sort
	else
		numEntries = 0
	end if
end sub

dAdded = 0
dP = 1
dPileet = 2
dPileeturl = 3
dPaikka = 4
dPaikkaurl = 5
dDj = 6
dMuuta = 7

dim sorted()

sub sort()
	redim sorted(numEntries)
	for e = 1 to numEntries
		sorted(e) = e
	next
	for e = 1 to numEntries - 1
		for s = e to numEntries
			if int(getData(sorted(s), dP)) < int(getData(sorted(e), dP)) then swap sorted(e), sorted(s)
		next
	next
end sub

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
%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="4">&nbsp;</td>
	<td class="edellinen">&nbsp;<br> <br></td>
	<td align="center" valign="bottom">
<form name="etsi" method="post" action="etsi.asp">
<input type="text" name="etsin" size="20" value="<%=etsin %>"> 
<input style="background: none" type="image" name="submit" src="pics/icon_etsi.gif" alt="etsi" width="12" height="22" hspace="5" align="absmiddle" border="0"> &nbsp; &nbsp; 
</form>
	</td>
	<td class="seuraava">&nbsp;<br> <br></td>
	<td width="10%" rowspan="4">&nbsp;</td>
</tr>
<tr>
	<td colspan="3">
<table width="100%" cellspacing="0" cellpadding="3" border="0">
<%
etsin = ucase(etsin)
kkloyty = false
for vuodet = 2000 to 2002 
	for kuukaudet = 1 to 12
		kkloyty = false
		openData vuodet, kuukaudet
		if numEntries > 0 then
			for e = 1 to numEntries
				loyty = false
				if instr(ucase(getData(sorted(e), dPileet)), etsin) > 0 then loyty = true
				if instr(ucase(getData(sorted(e), dPaikka)), etsin) > 0 then loyty = true
				if instr(ucase(getData(sorted(e), dDj)), etsin) > 0 then loyty = true
				if instr(ucase(getData(sorted(e), dMuuta)), etsin) > 0 then loyty = true
				if loyty then
					if not kkloyty then
						kkloyty = true
%>
<tr>
	<td class="kuukausi" colspan="4"><%=kuut(int(kuukaudet)) %>, <%=vuodet %></td>
</tr>
<%
					end if
					state = "1x1.gif"
					if dateDiff("d", getData(sorted(e), dAdded), date()) < 4 then state = "icon_uusi.gif"
%>
<tr <% if (int(getData(sorted(e), dP)) = int(datepart("d", date())) and int(kk) = int(datepart("m", date()))) then response.write("bgcolor='#990099'") %> >
	<td class="uusi" rowspan="2" valign="middle" width="30"><img src="pics/<%=state %>" width=19 height=19 border=0 alt=""></td>
	<td class="pvm" rowspan="2" valign="top"><%=paiva(getData(sorted(e), dP), kuukaudet, vuodet)%>&nbsp;<%=zero(getData(sorted(e), dP)) %>.</td>
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
				end if
			next
		end if
	next
next
%>
</table>
	</td>
</tr>
</table>
</div>

</body>
</html>
