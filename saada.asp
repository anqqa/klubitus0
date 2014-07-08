<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
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
kk = int(request.querystring("kk"))
v = int(request.querystring("v"))
num = int(request.querystring("num"))

set objFSO = Server.CreateObject("Scripting.FileSystemObject")
fn = "data\" & v & zero(kk)

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

%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<form name="uus" method="post" action="saados.asp">
<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="8">&nbsp;</td>
	<td class="kuukausi" colspan="2">MUUTA PILE?<br>&nbsp;</td>
	<td width="10%" rowspan="8">&nbsp;</td>
</tr>
<tr>
	<td class="pvm">koska?</td>
	<td>
<select name="p">
<%
for i = 1 to 31
%>
<option value="<%=i %>"<%if (i = int(getData(num, dP))) then response.write("selected") %>><%=i %>.</option>
<%
next
%>
</select> 

<select name="kk">
<option value="01" <%if kk = 1 then response.write("selected") %>>tammikuuta</option>
<option value="02" <%if kk = 2 then response.write("selected") %>>helmikuuta</option>
<option value="03" <%if kk = 3 then response.write("selected") %>>maaliskuuta</option>
<option value="04" <%if kk = 4 then response.write("selected") %>>huhtikuuta</option>
<option value="05" <%if kk = 5 then response.write("selected") %>>toukokuuta</option>
<option value="06" <%if kk = 6 then response.write("selected") %>>kes&auml;kuuta</option>
<option value="07" <%if kk = 7 then response.write("selected") %>>hein&auml;kuuta</option>
<option value="08" <%if kk = 8 then response.write("selected") %>>elokuuta</option>
<option value="09" <%if kk = 9 then response.write("selected") %>>syyskuuta</option>
<option value="10" <%if kk = 10 then response.write("selected") %>>lokakuuta</option>
<option value="11" <%if kk = 11 then response.write("selected") %>>marraskuuta</option>
<option value="12" <%if kk = 12 then response.write("selected") %>>joulukuuta</option>
</select>

<select name="v">
<option value="2000" <%if v = 2000 then response.write("selected") %>>2000</option>
<option value="2001" <%if v = 2001 then response.write("selected") %>>2001</option>
<option value="2002" <%if v = 2002 then response.write("selected") %>>2002</option>
</select>
	</td>
</tr>
<tr>
	<td class="pvm">mitk&auml;s?</td>
	<td>
<input type="Text" name="pileet" size="20" value="<%=getData(num, dPileet) %>">
<input type="Text" name="pileeturl" size="30" value="<%=getData(num, dPileeturl) %>">
	</td>
</tr>
<tr>
	<td class="pvm">miss&auml;?</td>
	<td>
<input type="Text" name="paikka" size="20" value="<%=getData(num, dPaikka) %>">
<input type="Text" name="paikkaurl" size="30" value="<%=getData(num, dPaikkaurl) %>">
	</td>
</tr>
<tr>
	<td class="pvm">dj?</td>
	<td>
<input type="Text" name="dj" size="57" value="<%=getData(num, dDj) %>">
	</td>
</tr>
<tr>
	<td class="pvm">muuta?</td>
	<td>
<textarea name="muuta" cols="60" rows="3" wrap="VIRTUAL"><%=replace(getData(num, dMuuta), "<br>", chr(13)) %></textarea>
	</td>
</tr>
<tr>
	<td class="pvm">salasana?</td>
	<td>
<input type="password" name="salasana" size="57" value="">
	</td>
</tr>
<tr>
	<td><input type="Hidden" name="num" value="<%=num %>"><input type="Hidden" name="kk2" value="<%=zero(kk) %>"></td>
	<td><input style="background:" type="Image" name="" src="pics/icon_ok.gif" border="0" width="28" height="35" alt="oujeah!"> <a href="javascript:history.go(-1)"><img src="pics/icon_pyh.gif" width=28 height=36 border=0 alt="antaa olla"></a></td>
</tr>
</table>
</div>
</form>

</body>
</html>
