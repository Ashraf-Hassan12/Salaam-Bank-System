<div class="row">
	<div style="margin: auto;" class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
                                <div class="basic-form">
          <form class="form_data" method="post" action="tools/save_all.php">
                                      <input type="hidden" name="sp" value="account_type_sp">
                                        <div class="form-group">
                                            <label>Account Type</label>
                                            <input name="a" type="text" class="form-control" placeholder="Enter Account type" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input type="date" class="form-control" name="b">
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