<?php session_start();
?>
<div class="row">
	<div style="margin: auto;" class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
                                <div class="basic-form">
          <form class="form_data" method="post" action="tools/save_account.php">
                                      
                                        <div class="form-group">
                                            <label>Customer Name</label>
                                            <input  type="text" class="form-control search-info" action="customer" placeholder="Enter Branch Name" required="">

                                            <ul class="hide">

                                                <li></li>
                                            </ul>
                                            <input type="hidden" name="a">
                                            <style type="text/css">
                                                .hide{
                                                    display: none;
                                                }
                                            </style>
                                        </div>
                                         <div class="form-group">
                                            <label>Choose Account type</label>
                                            <select class="form-control" name="b">
                                                <option selected="" disabled="">choose One</option>
                                               <?php 
require("../tools/conn.php");
$sql = "select id,name from account_type";
$ress = $conn->query($sql);
while($r = $ress->fetch_array()){
?>

<option value="<?php echo $r['id'] ?>"><?php echo $r['name'] ?></option>

<?php 
}
?>
                                            </select>
                                        </div>
                                 <div class="form-group">
                                            <label>Segnature</label>
                                            <input type="file" class="form-control" name="c" >
                                        </div>

                                        <input type="hidden" name="d" value="<?php echo $_SESSION['user_id'] ?>">
                                        <div class="form-group">
<label>Choose Branch</label>
<select name="e" class="form-control">
                                               <option selected="" disabled="">choose One</option>
                                               <?php 
require("../tools/conn.php");
$sql = "select id,name from branch";
$ress = $conn->query($sql);
while($r = $ress->fetch_array()){
?>

<option value="<?php echo $r['id'] ?>"><?php echo $r['name'] ?></option>

<?php 
}
?>
                                           </select>
 </div>
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input type="date" class="form-control" name="f">
                                        </div>
                                  
                                      
                                        <button type="submit" class="btn btn-primary btn-block">Save</button>
                                    </form>
                                    <div style="margin-top: 5px" class="response">
                                    	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</div>