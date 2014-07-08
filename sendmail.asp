<html>
<head>
    <title>ASPSend mail example</title>
</head>

<body bgcolor="#000000" background="pics/tausta3.jpg" bgproperties="fixed">

<%
'Getting (Requesting) the Session variables from Form on previous page
Session("FromName") = Request("FromName")
Session("FromAddress") = Request("FromAddress")
Session("Subject") = Request("Subject")
Session("BodyText") = Request("BodyText")

Set Mailer = Server.CreateObject("SMTPsvg.Mailer")

    'Setting variables
    Mailer.FromName = Session("FromName")
    Mailer.FromAddress = Session("FromAddress")
    Mailer.RemoteHost = "smtpgw.activeisp.com"
    Mailer.AddRecipient "anqqa", "webmaster@anqqa.com"
    Mailer.Subject = Session("Subject")
    Mailer.BodyText = Session("BodyText")

'Checking if mail sendt ok, if not display error message
if Mailer.SendMail then %>
<div align="center">
<table width="100%" cellpadding="0" cellspacing="5" border="0">
<tr>
	<td width="10%" rowspan="7">&nbsp;</td>
	<td>
jees.
<p>
<a href="javascript:history.go(-2)">takas</a>
	</td>
	<td width="10%" rowspan="7">&nbsp;</td>
</tr>
</table>
</div>
<%
else
Response.Write "reisille meni. syy: " & Mailer.Response
end if

'Abandoning session variables
Session.Abandon
%>

</body>
</html>