<!-- #INCLUDE FILE="discussfuncs.asp" -->
<%
id	= TRIM( Request( "id" ) )
IF id = "-1" THEN id = ""
%>

<html>
<head>
<title>viesti framet</title>
</head>
<frameset rows="30,*" bordercolor="#009900" border="0" frameborder="0">
	<frame marginheight="3" marginwidth="5" frameborder="no" scrolling="no" src="messagereply.asp?id=<%=id %>">
	<frame name="message" marginwidth="0" marginheight="0" frameborder="no" scrolling="auto" src="message.asp?id=<%=id %>">
</frameset>
</html>
