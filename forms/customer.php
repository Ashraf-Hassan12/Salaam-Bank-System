<?php 
session_start();

?>
<div class="row">
	<div style="margin: auto;" class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
<form class="form_data" method="post" action="tools/save_customer.php" enctype="multipart/form-data">
                                      
                                        <div class="form-group">
                                            <label>Customer Name</label>
                                            <input name="a" type="text" class="form-control" placeholder="Enter Name" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Customer Tell</label>
                                            <input name="b" type="text" class="form-control" placeholder="Enter  Tell" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Customer Address</label>
                                            <input name="c" type="text" class="form-control" placeholder="Enter  Address" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Document No</label>
                                            <input name="d" type="text" class="form-control" placeholder="Enter Document No" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Document Type</label>
                                           <select name="e" class="form-control">
                                               <option selected="" disabled="">choose One</option>
                                               <option value="Passport">Passport</option>
                                               <option value="id">Id</option>
                                               <option value="W Gobalka">W Gobalka</option>
                                           </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Masulka 1aad</label>
                                            <input type="text" class="form-control" name="f" placeholder="Enter Masul 1">
                                        </div>
                                          <div class="form-group">
                                            <label>Telka Masulka 1aad</label>
                                            <input type="text" class="form-control" name="g" placeholder="Enter Telka Masul 1">
                                        </div>
                                    <div class="form-group">
                                            <label>Nuuca Masulka 1aad</label>
                                            <input type="text" class="form-control" name="h" placeholder="Enter Nuuca Masul 1">
                                        </div>
                                        <div class="form-group">
                                            <label>Masulka 2aad</label>
                                            <input type="text" class="form-control" name="i" placeholder="Enter Magaca Masul 2">
                                        </div>
                                          <div class="form-group">
                                            <label>Telka Masulka 2aad</label>
                                            <input type="text" class="form-control" name="j" placeholder="Enter Telka Masul 2">
                                        </div>

                                         

                                          <div class="form-group">
                                            <label>Image</label>
                                            <input type="file" class="form-control" name="k" >
                                        </div>
<input type="hidden" name="l" value="<?php echo $_SESSION['user_id'] ?>">

<div class="form-group">
                                            <label>Account Type</label>
                                           <select name="m" class="form-control">
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
                                            <input type="file" class="form-control" name="n" >
                                        </div>
<div class="form-group">
<label>Choose Branch</label>
<select name="o" class="form-control">
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
                                            <input type="date" class="form-control" name="p" >
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