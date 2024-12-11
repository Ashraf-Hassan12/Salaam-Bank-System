<?php 
require("conn.php");
extract($_POST);
$sql = "call search_sp('$text','$action')";
$ress = $conn->query($sql);

if($ress->num_rows > 0){
    while($row = $ress->fetch_array()){
    	?>
       <li class="list-data" id="<?php echo $row[0] ?>"><?php echo $row[1] ?></li>

    	<?php
    }
}else{
	echo "<div style='padding:0px' class='alert alert-danger'>Not Found</div>";
}
?>

<style type="text/css">
	.list-data{
		border: 1px solid;
	}
	.list-data:hover{
		background: #f2f2f2;
		cursor: pointer;
	}
</style>