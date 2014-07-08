<!-- #INCLUDE FILE="discussfuncs.asp" -->
<%
id	= TRIM( Request( "id" ) )
IF id = "-1" THEN id = ""
%>

<html>
<head>
<title>viesti</title>
<link rel="stylesheet" href="../style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #009900; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #002200; 
	scrollbar-arrow-color: #FFFFFF; 
}
-->
</style>
</head>
<body bgcolor="#002200" background="../pics/tausta5b.jpg" bgproperties="fixed">

<%
IF id = "" THEN
%>
<table width="100%" height="100%" cellpadding=0 cellspacing=0 border=0>
<tr>
	<td width="10%">&nbsp;</td>
	<td valign="center" align="center"><b>valkkaa luettava viesti listasta</b></td>
	<td width="10%">&nbsp;</td>
</tr>
</table>
<%
ELSE
readyDBCon
SET RS = Server.CreateObject( "ADODB.Recordset" )
RS.ActiveConnection = Con
RS.CursorType = adOpenStatic
RS.Open "select * FROM messages WHERE m_id=" & id & " OR m_reply=" & id & " order by m_id"
mCount = 0
WHILE NOT RS.EOF
	%>
	<table width="100%" border=0 cellpadding=2 cellspacing=0>
	<tr>
		<td width="10%" rowspan="2">&nbsp;</td>
		<td bgcolor="#009900">kuka: <b><%=showUser( RS( "m_email" ) )%></b></td>
		<td bgcolor="#009900" class="seuraava"><%=aika(RS( "m_entrydate" ))%></td>
		<td width="10%" rowspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td bgcolor="#009900" colspan=2>aihe: <b><%=Server.HTMLEncode( RS( "m_subject" ) )%></b></td>
	</tr>
	</table>
	<table width="100%" cellpadding=4 cellspacing=0 border=0>
	<tr>
		<td width="10%">&nbsp;</td>
		<td>
		<%=formatOutput( RS( "m_message" ) )%>
		<br>&nbsp;<br>&nbsp;
		</td>
		<td width="10%">&nbsp;</td>
	</tr>
	</table>
	<%
RS.MoveNext
WEND
END IF
%>

</body>
</html>
