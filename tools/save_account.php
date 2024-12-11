<?php 
require("conn.php");

$pathh = "../uploads/";
$image = $pathh . basename($_FILES['c']['name']);

extract($_POST);


$sql = "call customer_account_sp('$a','$b','$image','$d','$e','$f')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

if($conn->error == 1054){
	echo $conn->error;
}

move_uploaded_file($_FILES['c']['tmp_name'],$image);

$msg = $ress->fetch_array();
echo $msg[0];
?>