<?php
header('Content-Type: text:html; charset=utf-8');
date_default_timezone_set('Europe/Moscow');
session_start();
if (!isset($_SESSION['session_username']))
{
    echo '<script>window.location.href = "login.php"</script>';
   // header('location:login.php');
}
require ('../development_mode_control.php');

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Dastyle - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script src="ck/ckeditor.js"></script>

    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!--Form Wizard-->
    <link rel="stylesheet" href="../plugins/jquery-steps/jquery.steps.css">

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/jquery-ui.min.css" rel="stylesheet">
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
    <link href="../plugins/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
</head>

<body class="dark-sidenav">
<!-- Left Sidenav -->
<?php
if (isset($_POST['save_post']))
{
    $cat_id = $_POST['cat_id'];
    $theme = $_POST['theme'];
    $text =$_POST['text'];
    $postdate = $_POST['postdate'];

    $file = $_FILES['image']['tmp_name'] ;
    $image = addslashes(file_get_contents($_FILES['image']['tmp_name'])) ;
    $image_name = addslashes($_FILES['image']['name']) ;
    move_uploaded_file($_FILES["image"]["tmp_name"], "postimages/".$_FILES["image"]["name"]) ;
    $location = "postimages/".$_FILES['image']['name'] ;

    if ($DB->query("INSERT INTO posts (id, cat_id,title,posttext,postdate, location) VALUES (?,?,?,?,?,?)",
        array(null,$cat_id,$theme,$text,$postdate,$location)))
    {
        echo "SUCCES INFORMATION!!";

        echo '<script>window.location.href = "posts.php"</script>';
       // header("location:posts.php");
    }
}


?>
<header>
    <div class="left-sidenav">
        <!-- LOGO -->
        <div class="brand">
            <a href="" class="logo">
                <h3 style="color: white; margin: 20px;">Блог</h3>
            </a>
        </div>
        <!--end logo-->
        <div class="menu-content h-100" data-simplebar>
            <ul class="metismenu left-sidenav-menu">
                <li class="menu-label mt-0"><?php echo  $_SESSION['session_username'];?></li>
                <li>
                    <a href="index.php"> <i data-feather="home" class="align-self-center menu-icon"></i><span>Главное меню</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                </li>
                <hr class="hr-dashed hr-menu">

            </ul>
        </div>

        <footer class="footer text-center text-sm-left">
            &copy; 2020 Dastyle <span class="d-none d-sm-inline-block float-right">Crafted with <i class="mdi mdi-heart text-danger"></i> by Mannatthemes</span>
        </footer>
    </div>
</header>
<!-- end left-sidenav-->


<div class="page-wrapper mb-3">
    <!-- Top Bar Start -->
    <div class="topbar">
        <!-- Navbar -->
        <nav class="navbar-custom text-center">
            <h2 class="p-3">Добавить пост</h2>
        </nav>
        <!-- end navbar-->
    </div>
    <div class="container">
        <form class="mt-5" method="post" enctype="multipart/form-data" >
            <div class="form-row">
                <?php
               $result = $DB->query("SELECT * FROM categories");

              echo  '<div class="col-md-3 mb-3"> 
                    <label for="validationDefault04">Категории</label> 
                    <select class="custom-select" name="cat_id" id="">' ;
                 foreach ($result as $row):
                    ?>
                        <option value="<?php echo $row['id']?>"><?php echo $row['catname']?></option>
                        <?php endforeach;?>
                    </select>

                </div>
                <div class="col-md-6 mb-3">
                    <label for="validationDefault02">Тема категории</label>
                    <input type="text" name="theme" class="form-control" id="validationDefault02"  >
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="validationDefault03">Фото</label>
                    <input type="file" name="image" class="form-control" id="validationDefault03" >
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationDefault04">Дата</label>
                    <input type="date" name="postdate" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Статья к теме</label>
                <textarea class="form-control" name="text" id="editor1" rows="30"></textarea>
            </div>
            <a href="posts.php"  class="btn btn-danger">Назад</a>
            <button class="btn btn-primary"  type="submit" name="save_post">Сохранить</button>
        </form>
    </div><!--end row--><!--end fieldset-->
    <!-- Top Bar End -->
</div>
<!-- end page-wrapper -->

<script>
    // Replace the <textarea id="editor1"> with a CKEditor 4
    // instance, using default configuration.
    CKEDITOR.replace( 'editor1' );
</script>



<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/metismenu.min.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/simplebar.min.js"></script>
<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/moment.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>

<script src="../plugins/jquery-steps/jquery.steps.min.js"></script>
<script src="assets/pages/jquery.form-wizard.init.js"></script>

<!-- App js -->
<script src="assets/js/app.js"></script>

</body>

</html>