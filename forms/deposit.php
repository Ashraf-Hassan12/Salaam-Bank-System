<?php session_start();
?>
<div class="row">
	<div style="margin: auto;" class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
                                <div class="basic-form">
          <form class="form_data" method="post" action="tools/deposit.php">
                                      
                                        <div class="form-group">
                                            <label>Account No</label>
                                            <input name="a" type="text" class="form-control find_name" placeholder="Enter Branch Name" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Customer Name</label>
                                            <input  type="text" class="form-control set_name" readonly="" placeholder="Enter Branch Tell" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Amount</label>
                                            <input name="b" type="text" class="form-control" placeholder="Enter Amount" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Amount In Words</label>
                                            <input name="c" type="text" class="form-control" placeholder="Enter Amount In Words" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Description</label>
                                            <input name="d" type="text" class="form-control" placeholder="Enter Description" required="">
                                        </div>
                                          <div class="form-group">
                                            <label>Deposit By</label>
                                            <input name="e" type="text" class="form-control" placeholder="Enter Deposit By" required="">
                                        </div>
                                         <input type="hidden" name="f" value="<?php echo $_SESSION['user_id'] ?>">
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input type="date" class="form-control" name="g">
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