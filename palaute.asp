<html>
<head>
    <title>palaute</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #4E6D9B; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #1D2A3B; 
	scrollbar-arrow-color: #FFFFFF; 
}
input, textarea { 
	background: #1D2A3B;
	color: #FFFFFF;
	font-family: Arial;
	text-align: left;
}
-->
</style>
</head>

<body bgcolor="#000000" background="pics/tausta3.jpg" bgproperties="fixed">

<br>
<form action="sendmail.asp" method="POST">
<table width="100%" cellpadding="4" cellspacing=0 border=0>
<tr>
	<td width="10%" rowspan="5">&nbsp;</td>
	<td class="seuraava">kuka:</td>
	<td><input type="Text" name="FromName" size="25" maxlength="50"></td>
	<td width="10%" rowspan="5">&nbsp;</td>
</tr>
<tr>
	<td class="seuraava">e-mail:</td>
	<td><input type="Text" name="FromAddress" size="25" maxlength="50"></td>
</tr>
<tr>
	<td class="seuraava">aihe:</td>
	<td><input type="Text" name="Subject" size="25" maxlength="50"></td>
</tr>
<tr>
	<td class="seuraava" valign="top">palaute:</td>
	<td><textarea name="BodyText" cols="50" rows="10" wrap="PHYSICAL"></textarea></td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>
<input style="background:" type="Image" name="" src="pics/icon_ok.gif" border="0" width="28" height="35" alt="oujeah!"> <a 	href="javascript:history.go(-1)"><img src="pics/icon_pyh.gif" width=28 height=36 border=0 alt="antaa olla"></a>
	</td>
</tr>
</table>
</form>

</body>
</html>