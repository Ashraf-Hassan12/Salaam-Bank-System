<?php
require("tools/function.php");
$company = get_company('name');
?>

<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><?php echo $company ?></title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center"> <h4><?php echo $company ?></h4></a>
        
    <form action="tools/login.php" class="mt-5 mb-5 login-input" method="post">
                                    <div class="form-group">
                                        <input name="user" type="text" class="form-control" placeholder="Enter Username" required>
                                    </div>
                                    <div class="form-group">
                                        <input name="pass" type="password" class="form-control" placeholder=" Enter Password" required>
                                    </div>
                    <button class="btn login-form__btn submit w-100">Sign In</button>
                                </form>
                                <center style="color:red"><?php echo @$_GET['error'] ?></center>
                                <center class="mt-5 login-form__footer"> &copy <?php echo $company ?>powered by <a target="_blank" href="https://wa.me/252615260589?text= asc waxaa ka soo arkay systemka add usameseyn *<?php echo $company ?>*" class="text-primary">Abduqaadir</a></center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>





