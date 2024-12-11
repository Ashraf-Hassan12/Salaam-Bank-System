<?php
session_start();
extract($_POST);
require("conn.php");
$sql = "call login_sp('$user','$pass')";
$ress =$conn->query($sql);
$r = $ress->fetch_array();
if($r['error']){
header("location: ../index.php?error=$r[0]");	
}else{
	foreach ($r as $name => $value) {
		$_SESSION[$name] = $value;
}
header("location: ../home.php");
}
?>