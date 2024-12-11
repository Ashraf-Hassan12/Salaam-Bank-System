<div class="row">
	<div  class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
                                <div class="basic-form">
    <form class="form_data report" method="post" action="tools/all_report.php">
        <input type="hidden" name="sp" value="rp_cust_sp">
                  <div class="row">   
                  <div class="col-3">  
<div class="form-group">
<label>Choose Branch</label>
<select name="a" class="form-control">
                                               <option selected="" value="%">choose One</option>
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

                  </div>  
                                    <div class="col-3">               
                                        <div class="form-group">
                                            <label>From</label>
                                            <input name="b" type="date" class="form-control" placeholder="Enter Account type" >
                                        </div>
                                    </div>
                                    <div class="col-3">  
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input type="date" class="form-control" name="c">
                                        </div>
                                  </div>
                                      <div class="col-3">  
                                        <button style="margin-top: 30px" type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                    </div>
                                    </form>
                                    <div style="margin-top: 5px" class="response">
                                    	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
</div>