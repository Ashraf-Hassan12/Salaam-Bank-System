<?php 
require("conn.php");
extract($_POST);
$sql = "call withdraw_sp('$a','$b','$c','$d','$f','$g')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

$msg = $ress->fetch_array();
echo $msg[0];
?>