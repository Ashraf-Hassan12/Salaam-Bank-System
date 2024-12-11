  <?php 
require("conn.php");
require("function.php");
 $sql = gen_sql($_POST);
$ress = $conn->query($sql);

$msg = $ress->fetch_array();
echo $msg[0];

?>