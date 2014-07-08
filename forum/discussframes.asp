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
<head><title>pulinat</title>
<frameset rows="170,*" bordercolor="#009900" border="0" frameborder="0">
	<frame marginheight="3" marginwidth="5" frameborder="no" scrolling="auto" src="messagelist.asp">
	<frame name="message" marginwidth="0" marginheight="0" frameborder="no" scrolling="auto" src="message.asp?id=<%=addm%>">
</frameset>
</html>

