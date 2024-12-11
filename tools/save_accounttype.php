<?php 
require("conn.php");
extract($_POST);
$sql = "call account_type_sp('$a','$b')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

$msg = $ress->fetch_array();
echo $msg[0];
?>