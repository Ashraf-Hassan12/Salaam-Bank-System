<div class="row">
	<div style="margin: auto;" class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
         <h4 class="card-title"><?php echo $_POST['name'] ?></h4>
                                <div class="basic-form">
          <form class="form_data" method="post" action="tools/save_branch.php">
                                      
                                        <div class="form-group">
                                            <label>Branch Name</label>
                                            <input name="a" type="text" class="form-control" placeholder="Enter Branch Name" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Branch Tell</label>
                                            <input name="b" type="text" class="form-control" placeholder="Enter Branch Tell" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Branch Address</label>
                                            <input name="c" type="text" class="form-control" placeholder="Enter Branch Address" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Branch Admin</label>
                                            <input name="d" type="text" class="form-control" placeholder="Enter Branch Admin Name" required="">
                                        </div>
                                         <div class="form-group">
                                            <label>Branch Admin Tell</label>
                                            <input name="e" type="text" class="form-control" placeholder="Enter Branch Admin Tell" required="">
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