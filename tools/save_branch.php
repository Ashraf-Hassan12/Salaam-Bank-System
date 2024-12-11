<?php 
require("conn.php");
extract($_POST);
$sql = "call branch_sp('$a','$b','$c','$d','$e','$f')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

$msg = $ress->fetch_array();
echo $msg[0];
?>