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
kk = request.querystring("kk")
v = request.querystring("v")
if (kk = "") then kk = month(date())
kk = int(kk)
if (v = "") then v = year(date())
v = int(v)
%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta.jpg" bgproperties="fixed">

<form name="uus" method="post" action="lisays.asp">
<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="7">&nbsp;</td>
	<td class="kuukausi" colspan="2">UUS PILE?<br>&nbsp;</td>
	<td width="10%" rowspan="7">&nbsp;</td>
</tr>
<tr>
	<td class="pvm">koska?</td>
	<td>
<select name="p">
<%
for i = 1 to 31
%>
<option value="<%=i %>"><%=i %>.</option>
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
<input type="Text" name="pileet" size="20">
<input type="Text" name="pileeturl" size="30" value="http://">
	</td>
</tr>
<tr>
	<td class="pvm">miss&auml;?</td>
	<td>
<input type="Text" name="paikka" size="20">
<input type="Text" name="paikkaurl" size="30" value="http://">
	</td>
</tr>
<tr>
	<td class="pvm">dj?</td>
	<td>
<input type="Text" name="dj" size="57">
	</td>
</tr>
<tr>
	<td class="pvm">muuta?</td>
	<td>
<textarea name="muuta" cols="60" rows="3" wrap="VIRTUAL"></textarea>
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td><input style="background:" type="Image" name="" src="pics/icon_ok.gif" border="0" width="28" height="35" alt="oujeah!"> <a href="javascript:history.go(-1)"><img src="pics/icon_pyh.gif" width=28 height=36 border=0 alt="antaa olla"></a></td>
</tr>
</table>
</div>
</form>

</body>
</html>
