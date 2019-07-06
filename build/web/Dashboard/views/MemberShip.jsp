<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.jsp");
%>

<%} else {

%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Stock Management System</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="../../plugins/iCheck/flat/blue.css">
        <!-- Morris chart -->
        <link rel="stylesheet" href="../../plugins/morris/morris.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="../../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <link rel="stylesheet" href="style.css" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
        function fill(v){
           
            //v=document.getElementById('sell').value;
                    // alert(v.value);
          if(v===null)
             alert("please select one field!");
           else if(v.value==="p")
           {
               //alert("ghusa");
            document.getElementById('abc').value="700";
        }
            else if(v.value==='s')
           
           document.getElementById('abc').value="800";
            else if(v.value==='g')
           document.getElementById('abc').value="1500";
        }
       
    </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../main.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>A</b>PL</span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>Admin</b>Panel</span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                </a> 
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                </a>

                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->

                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../../Image/logo.png" class="user-image" alt="User Image">
                                    <span class="hidden-xs">Grocery Shop</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="../../Image/logo.png" class="img-circle" alt="User Image">

                                        <p>
                                            <i style="font-size: 18px"><%=session.getAttribute("userid")%></i><br>
                                           
                                        </p>
                                    </li>

                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="#" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="../../logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->

                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../Image/logo.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Grocery Shop</p>

                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-shopping-basket"></i> <span>Sales</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="sales.jsp"><i class="fa fa-circle-o"></i> Product Sales</a></li>
                                <li><a href="history.jsp"><i class="fa fa-circle-o"></i> History</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Purchase</span>
                                <i class="fa fa-angle-left pull-right"></i>                                                       
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="purchase.jsp"><i class="fa fa-circle-o"></i> Product Purchase</a></li>
                                <li><a href="ProductList.jsp"><i class="fa fa-circle-o"></i> Product List</a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span>Membership</span>
                                <i class="fa fa-angle-left pull-right"></i>                                                       
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="MemberShip.jsp"><i class="fa fa-circle-o"></i> Add New</a></li>
                                <li><a href="MemberList.jsp"><i class="fa fa-circle-o"></i> Membership Info</a></li>
                            </ul>
                        </li>
                    </li><li class="treeview">
                    <a href="#">
                        <i class="fa fa-users"></i>
                        <span>Staff</span>
                        <i class="fa fa-angle-left pull-right"></i>                                                       
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="Staff.jsp"><i class="fa fa-circle-o"></i>Details Of Staff</a></li>

                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-users"></i>
                        <span>Supplier</span>
                        <i class="fa fa-angle-left pull-right"></i>                                                       
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="Dealership.jsp"><i class="fa fa-circle-o"></i>Details Of Supplier</a></li>

                    </ul>
                </li>
            </ul>

                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="../../main.jsp"><i class="fa fa-dashboard"></i>Home</a></li>

                    </ol>
                </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <main>
                <div class="panel panel-primary">
                <div class="container">
                    <h1>Member</h1>
                    <form class="form-inline" action="DB/InsertMember.jsp" method="post">
                        <table>
                            <tr>
                                <td>
                                        <div class="form-group">
                                            <label for="member_id">Member Id</label><br>
                                            <input type="text" name="member_id" class="form-control" id="member_id" placeholder="Enter Your Id" pattern="[A-Za-z].+" required>
                                        </div><br>
                                        </td>
                                        <td>

                                            <div class="form-group">
                                                <label for="name">Name</label><br>
                                                <input type="text" name="name" class="form-control" id="name" placeholder="Enter Name" required>
                                            </div><br>
                                        </td>
                                        <td>
                                            <label for="gender">Gender</label><br>
                                            <select class="form-control" name="gender" id="sel1">
                                                <option>Select</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                            </select><br>
                                        </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-group">
                                        <label for="email">Email</label><br>
                                        <input type="text" name="email" class="form-control" id="email" placeholder="Enter email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
                                    </div><br>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="mobile">Mobile No.</label><br>
                                        <input type="text" name="mobile_no" class="form-control" id="mobile" placeholder="Enter Mobile No" pattern="[1-9][0-9]{9}" required>
                                    </div><br>
                                </td>
                                
                            </tr>
                            <tr> 
                                <td>
                                    <div class="form-group">
                                        <label for="address">Parmanent Address</label><br>
                                        <textarea class="form-control" name="per_address" rows="4" id="address" required></textarea>
                                    </div><br>
                                </td>
                                
                           </tr>
                            <tr> 
                               
                                <td>

                                    <label for="">Category</label><br>
                                    <select onchange="fill(this)" class="form-control" name="category" id="sel1">
                                        <option value="null">Select</option>
                                        <option value="p"> Premium</option>
                                        <option value="s">Silver</option>
                                        <option value="g">Gold</option>
                                    </select>
                                    <br>  
                                </td>
                                 <td>

                                    <div class="form-group">
                                        <label for="abc">Payment Amount</label><br>
                                        <input type="text" readonly="" name="payment" class="form-control" placeholder="Enter Payment" id="abc" required>
                                    </div><br>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <label for="mobile">Date</label><br>
                                        <input type="date" name="date" class="form-control" id="mobile" required>
                                    </div><br>
                                            
                                        </td>
                            </tr>
                          

                            <tr>
                                <td>
                                    <br>
                                 <div class="btn">
                                        <button class="btn btn-primary">Submit</button>
                                 </div>
                                    <br>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
                </div>
                
                <!-- </fieldset>-->
                &nbsp;
                <br>
                <br>

            </main>

            <footer></footer>&nbsp;

            <!--
            <div class="mydiv">

                <a href="sales_final.jsp"><button><b>GET FINAL COPY FOR PRINT</b></button></a>

            </div>
            <!-- ./col -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">

        </div>
       
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>

    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="../../plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="../../plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="../../plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="../../dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
<% } %>
