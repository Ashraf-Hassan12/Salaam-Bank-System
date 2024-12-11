<?php 
require("conn.php");
extract($_POST);
$sql = "call deposit_sp('$a','','$b','$c','$d','$e','$f','$g')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

$msg = $ress->fetch_array();
echo $msg[0];
?>