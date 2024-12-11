  <?php 
require("conn.php");
require("function.php");
 $sql = gen_sql($_POST);
$ress = $conn->query($sql);
if($ress->num_rows == 0){
    echo "<div class='alert alert-warning'> Not Found</div>";
    return false;
}
  ?>

  <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Data Table</h4>
                                <div class="table-responsive">
<table id="datatable" class="table table-striped table-bordered zero-configuration">
            <?php table_row($ress) ?>                        
</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    <link href="../plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
                <script src="../plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="../plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="../plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

    <script type="text/javascript">
           $(function() {
            $('#datatable').DataTable({
                pageLength: 10,
                //"ajax": './assets/demo/data/table_data.json',
                /*"columns": [
                    { "data": "name" },
                    { "data": "office" },
                    { "data": "extn" },
                    { "data": "start_date" },
                    { "data": "salary" }
                ]*/
            });
        })
    </script>