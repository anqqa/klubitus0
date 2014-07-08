<!-- #INCLUDE FILE="discussfuncs.asp" -->
<%
addm	= TRIM( request( "addm" ) )
email	= TRIM( request( "email" ) )
subject	= TRIM( request( "subject" ) )
message	= TRIM( request( "message" ) )

IF addm <> "" THEN
	IF email = "" THEN
		showError "You did not enter your email address", "post.asp"
	END IF
	IF subject = "" THEN
		showError "You did not enter a subject for your message", "post.asp"
	END IF
	IF message = "" THEN
		showError "You did not enter a message", "post.asp"
	END IF
	IF INSTR( email, "." ) = 0 OR INSTR( email, "@" ) = 0 THEN
		showError "You did not enter a valid email address", "post.asp"
	END IF


	readyDBCon
	Set RS = Server.CreateObject( "ADODB.Recordset" )
	RS.ActiveConnection = Con
	RS.CursorType = adOpenStatic
	RS.LockType = adLockOptimistic
	RS.Open "SELECT * FROM messages WHERE 1<>1", Con
	RS.AddNew
	RS( "m_email" ) = email
	RS( "m_subject" ) = subject
	RS( "m_message" ) = message
	RS( "m_reply" ) = addm
	RS.Update
	RS.Close
	IF addm <> "-1" THEN
		Con.Execute "UPDATE messages SET m_numreplies = m_numreplies+1 WHERE m_id=" & addm
	END IF
END IF
%>
<html>
<head>
<title>viestit</title>
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
<body bgcolor="#002200" background="../pics/tausta5.jpg" bgproperties="fixed">

<%
readydbCon

dim kuka(1000), paivat(1000), id(1000)

SET RS = Server.CreateObject( "ADODB.Recordset" )
RS.ActiveConnection = Con
RS.CursorType = adOpenStatic
RS.Open "select m_id, m_entrydate, m_reply, m_email FROM messages ORDER by m_entrydate DESC"
total = int(RS.RecordCount)
pvm = RS.GetRows()
RS.Close
RS.Open "select m_id, m_email, m_subject, m_numreplies FROM messages WHERE m_reply=-1 ORDER by m_id DESC"
aiheet = RS.GetRows()
kaikki = int(RS.RecordCount)
Con.Close

yht = 1
if pvm(2, 0) = "-1" then id(1) = pvm(0, 0) else id(1) = pvm(2, 0)
paivat(1) = pvm(1, 0)
kuka(1) = pvm(3, 0)
for i = 1 to total - 1
	loyty = false
	for j = 1 to yht
		if id(j) = pvm(2, i) then loyty = true
		if id(j) = pvm(0, i) then loyty = true
	next
	if not loyty then 
		yht = yht + 1
		paivat(yht) = pvm(1, i)
		kuka(yht) = pvm(3, i)
		if pvm(2, i) = "-1" then id(yht) = pvm(0, i) else id(yht) = pvm(2, i)
	end if
next

function getField(idnum, field)
	temp = ""
	for j = 0 to kaikki - 1
		if aiheet(0, j) = idnum then temp = aiheet(field, j)
	next
	getField = temp
end function

%>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<tr>
	<td width="10%">&nbsp;</td>
	<td width="80%">

<table width="100%" border=0 cellpadding=4 cellspacing=0>
<tr>
	<td><b>kuka</b></td>
	<td><b>aihe</b></td>
	<td><b>vast</b></td>
	<td><b>uusin</b></td>
</tr>
<%
for i = 1 to yht
%>
<tr>
	<td class="paikka"><%=showUser(getField(id(i), 1))%></td>
	<td><a href="messageframes.asp?id=<%=id(i)%>" class="pile"><%=Server.HTMLEncode(getField(id(i), 2))%></a></td>
	<td>
	<%=getField(id(i), 3)%>
	</td>
	<td><%=aika(paivat(i))%><%if getField(id(i), 3) > 0 then %> - <%=showUser(kuka(i)) %><%end if %></td>
</tr>
<%
next
%>
</table>

	</td>
	<td class="seuraava" valign="top"><a href="post.asp" class="seuraava" target="main">uus&nbsp;viesti</a></td>
	<td width="10%">&nbsp;</td>
</tr>
</table>

</body>
</html>
