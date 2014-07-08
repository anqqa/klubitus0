<%
dbPath = "g:\activewebroot\00113\u00113814\klubi\forum\discuss.mdb"
messagesApage = 5

''''''''''''''''''''
' Define Constants  
''''''''''''''''''''
adOpenStatic = 3
adLockOptimistic = 3


'''''''''''''''''''''''''''
' Declare Global Variables 
'''''''''''''''''''''''''''
set Con = server.createobject("adodb.connection")


SUB readyDBCon
	IF Con = "" THEN
		Set Con = Server.CreateObject( "adodb.Connection" )
		Con.Open "PROVIDER=MICROSOFT.JET.OLEDB.4.0;DATA SOURCE=" & dbPath
	END IF
END SUB



FUNCTION showUser( theEmail )
	whereA = INSTR( theEmail, "@" )
	showUser = Server.HTMLEncode( LEFT( theEmail, whereA - 1 ) )
END FUNCTION



FUNCTION formatOutput( theText )
	theText = Server.HTMLEncode( theText )
	theText = REPLACE( theText, vbNewline & vbNewline, "<p>" )
	theText = REPLACE( theText, vbNewline, "<br>" )
	formatOutput = theText
END FUNCTION

function aika(pvm)
	aika = datepart("d", pvm) & "." & datepart("m", pvm) & "." & datepart("yyyy", pvm) & " / " & datepart("h", pvm) & ":" & datepart("m", pvm)
end function

sub showError( errorMessage, backpage )
	%>
	<html>
	<head><title>onkelma</title></head>
	<body bgcolor="lightyellow">
	<center>
	<table width="400" border=0 cellpadding=4 cellspacing=0>
	<tr>
		<td>
		<font face="Arial" size="4" color="red"><b>
		viestiss‰ oli m‰t‰‰:</b></font>
		<p><font face="Arial" size="3" color="blue"><b>
		<%=errorMessage%>. paina nappia alhaalta ni korjautuu</b></font>
		<form method="post" action="<%=backpage%>">
		<%
		for each thing in Request.Form
		%>
		<input name="<%=thing%>" type="hidden" value="<%=Server.HTMLEncode( Request( thing ) )%>">
		<%
		next
		%>
		<input type="submit" value="Back">
		</form>

		</td>
	</tr>
	</table>
	</body>
	</head>
	<%
	Response.End
end sub
%>
