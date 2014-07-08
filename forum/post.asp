<%
id		= TRIM( Request( "id" ) )
email	= TRIM( Request( "email" ) )
subject = TRIM( Request( "subject" ) )
message	= TRIM( Request( "message" ) )
%>
<HTML>
<HEAD>
<TITLE>uus viesti</TITLE>
<link rel="stylesheet" href="../style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #009900; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #121E0A; 
	scrollbar-arrow-color: #FFFFFF; 
}
input, textarea { 
	background: #121E0A;
	color: #FFFFFF;
	font-family: Arial;
	text-align: left;
}
-->
</style>
</HEAD>
<BODY bgcolor="#002200" background="../pics/tausta5.jpg">


<form method="post" action="messagelist.asp" target="main">
<% IF id = "" THEN %>
<input name="addm" type="hidden" value="-1">
<% ELSE %>
<input name="addm" type="hidden" value="<%=id%>">
<% END IF %>


<br>
<table width="100%" cellpadding="4" cellspacing=0 border=0>
<tr>
	<td width="10%" rowspan="6">&nbsp;</td>
	<td class="seuraava" nowrap>e-mail:</td>
	<td>
	<input name="email" size="60" maxlength="255" value="<%=Server.HTMLEncode( email )%>">
	</td>
	<td width="10%" rowspan="6">&nbsp;</td>
</tr>
<tr>
	<td class="seuraava">aihe:</td>
	<td>
	<input name="subject" size="60" maxlength="50" value="<%=Server.HTMLEncode( subject )%>">
	</td>
</tr>
<tr>
	<td class="seuraava" valign="top">viesti:</td>
	<td>
	<textarea name="message" cols="60" rows="13" wrap="virtual"><%=Server.HTMLEncode( message )%></textarea>
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>
<input style="background:" type="Image" name="" src="../pics/icon_ok.gif" border="0" width="28" height="35" alt="oujeah!"> <a 	href="javascript:history.go(-1)"><img src="../pics/icon_pyh.gif" width=28 height=36 border=0 alt="antaa olla"></a>
	</form>
	</td>
</tr>
</table>
</BODY>
</HTML>
