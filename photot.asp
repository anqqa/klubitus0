<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>photot</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
<!--
body { 
	scrollbar-face-color: #00BBBB; 
	scrollbar-shadow-color: #000000; 
	scrollbar-highlight-color: #000000; 
	scrollbar-3dlight-color: #000000; 
	scrollbar-darkshadow-color: #000000; 
	scrollbar-track-color: #002222; 
	scrollbar-arrow-color: #FFFFFF; 
}
-->
</style>
<script language="javascript">
<!--
function ikkuna(pileet, numero, yhteensa){
	eval("window.open('photo.asp?pileet=" + pileet + "&num=" + numero + "&yht=" + yhteensa + "', 'pileet','toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,status=no,resizable=0,width=650,height=690')");
}
//-->
</script>
<%
sivu = request.querystring("sivu")
if (sivu = "") then sivu = 1

lev = 5
function bileet(nimi, pileet, yhteensa)
	response.write("<tr><td class='kuukausi' colspan='" & lev & "'>" & nimi & "</td></tr>" & chr(13))
	kor = cint(yhteensa / lev)
	if (yhteensa mod 5 > 0) and (yhteensa mod 5 < 3) then kor = kor + 1
	for y = 1 to kor
		response.write("<tr>" & chr(13))
		for x = 1 to lev
			if (((y - 1) * lev + x) <= yhteensa) then
				response.write("<td>")
				response.write("<a href=""javascript:ikkuna('" & pileet &"', " & ((y - 1) * lev + x) & ", " & yhteensa & ")""><img src='photot/mini/" & pileet & ((y - 1) * lev + x) & ".gif' border='0'></a>")
				response.write("</td>" & chr(13))
			end if
		next
		response.write("</tr>" & chr(13))
	next
end function
%>
</head>

<body bgcolor="#000000" text="#FFFFFF" background="pics/tausta6.jpg" bgproperties="fixed">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td width="10%" rowspan="150">&nbsp;</td>
	<td width="80%">
<br>
<%
dim pileita(7, 3)
pileita(1, 1) = "hype + illusions (2000/2001)"
pileita(1, 2) = "hypeillusions"
pileita(1, 3) = 21
pileita(2, 1) = "sundissential (16.12.2000)"
pileita(2, 2) = "sundissential"
pileita(2, 3) = 43
pileita(3, 1) = "elements 8 (25.11.2000)"
pileita(3, 2) = "elements8"
pileita(3, 3) = 50
pileita(4, 1) = "suuri naamiaisjuhla (10.11.2000)"
pileita(4, 2) = "naamiaiset"
pileita(4, 3) = 27
pileita(5, 1) = "elements 7 (4.11.2000)"
pileita(5, 2) = "elements"
pileita(5, 3) = 38
pileita(6, 1) = "labyrinth 2000 (1.4.2000)"
pileita(6, 2) = "gatecrasher"
pileita(6, 3) = 26
pileita(7, 1) = "armin van buuren"
pileita(7, 2) = "armin"
pileita(7, 3) = 4
response.write("<a href=""photot.asp?sivu=1"">" & replace(pileita(1, 1), " ", "&nbsp;") & "</a>")
for a = 2 to 7
	response.write(" | <a href=""photot.asp?sivu=" & a & """>" & replace(pileita(a, 1), " ", "&nbsp;") & "</a>")
next
%>
<table width="100%" cellpadding="0" cellspacing="10" border="0">
<%
bileet pileita(sivu, 1), pileita(sivu, 2), pileita(sivu, 3)
select case pileita(sivu, 2)
	case "elements8"
		response.write("<tr><td colspan='" & lev & "'><a href=""mpg/elements81.mpg"" target=""new"">video&nbsp;1</a> | <a href=""mpg/elements82.mpg"" target=""new"">video&nbsp;2</a> | <a href=""mpg/elements83.mpg"" target=""new"">video&nbsp;3</a> | <a href=""mpg/elements84.mpg"" target=""new"">video&nbsp;4</a> | <a href=""mpg/elements85.mpg"" target=""new"">video&nbsp;5</a> | <a href=""mpg/elements86.mpg"" target=""new"">video&nbsp;6</a> | <a href=""mpg/elements87.mpg"" target=""new"">video&nbsp;7</a></td></tr>")
	case "elements"
		response.write("<tr><td colspan='" & lev & "'><a href=""mpg/elements71.mpg"" target=""new"">video&nbsp;1</a> | <a href=""mpg/elements72.mpg"" target=""new"">video&nbsp;2</a> | <a href=""mpg/elements73.mpg"" target=""new"">video&nbsp;3</a> | <a href=""mpg/elements74.mpg"" target=""new"">video&nbsp;4</a> | <a href=""mpg/elements75.mpg"" target=""new"">video&nbsp;5</a></td></tr>")
end select
%>
</table>
	
	</td>
	<td width="10%" rowspan="150">&nbsp;</td>
</tr>
<tr>
	
</tr>
</table>

</body>
</html>
