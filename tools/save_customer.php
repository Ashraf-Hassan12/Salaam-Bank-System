<?php 
require("conn.php");

$pathh = "../uploads/";
$image = $pathh . basename($_FILES['k']['name']);
$segnature = $pathh . basename($_FILES['n']['name']);
extract($_POST);


$sql = "call customer_sp('$a','$b','$c','$d','$e','$f','$g','$h','$i','$j','$image','$l','$m','$segnature','$o','$p')";
$ress = $conn->query($sql);
if(!$ress){
	echo $conn->error;
}

move_uploaded_file($_FILES['k']['tmp_name'],$image);
move_uploaded_file($_FILES['n']['tmp_name'],$segnature);
$msg = $ress->fetch_array();
echo $msg[0];
?>