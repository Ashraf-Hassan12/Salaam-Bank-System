<?php 
require("conn.php");
$sql = "call find_name_sp($_POST[acc])";
$ress  =$conn->query($sql);

$r = $ress->fetch_array();

echo $r[0];

?>