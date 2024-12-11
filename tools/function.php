<?php
function get_company($col){
	require("conn.php");
$sql = "select $col from company_info";
$ress = $conn->query($sql);
$r = $ress->fetch_array();
return $r[0];	

}

function gen_sql($post){
	$sql = "call ";
	$c = count($post);
	$i = 0;

	foreach($post as $name => $val){
		$i++;
		if($i == 1){
			$sql .= $val ."(";
		}else if($i == $c){
			$sql .= "'".$val."')";
		}else{
			$sql .= "'".$val."',";
		}
	}
	return $sql;
}
function table_row($ress){
	$columname = $ress->fetch_fields();
	?>
<thead>
	<tr>
		<?php 
   foreach($columname as $key){
		?>
      <th><?php echo $key->name ?></th>

      <?php 
  }
  ?>
	</tr>
</thead>

<tbody>
	<?php 
	while($row = $ress->fetch_assoc()){
	?>
	<tr>
		<?php 
   foreach($row as $key => $val){
		?>
		<td><?php echo $val ?></td>
   <?php 
}
?>
	</tr>
	<?php 
}
?>
</tbody>

	<?php
}
?>