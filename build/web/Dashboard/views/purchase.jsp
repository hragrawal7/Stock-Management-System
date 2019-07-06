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
        <link rel="stylesheet" href="style.css" type="text/css">

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

        <%
            if(request.getParameter("msg")!=null)
            {
                String msg = request.getParameter("msg");
                out.print("<script>alert('"+msg+"');</script>");
            }
        %>



        <!-- Main content -->
        <section class="content" style="width:80%;">
            <div class="panel panel-primary">
                <div class="container">
                    <b><h2>Product Purchase</h2></b>
                    <div>                       
                        <form class="form-inline" action="DB/InsertPurchase.jsp" method="post">
                            <table width="80%">
                                <tr>
                                    <td>
                                        <%@page import="java.sql.*"%>
                                        <%@page import="com.inventory.dao.UserDao, com.inventory.bean.*, java.util.*"%>
                                        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

                                        <%                                            List<User> list = UserDao.getAllRecords();
                                            request.setAttribute("list", list);
                                        %>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="category">Dealer Id:</label><br>
                                                <select class="form-control" id="dealer_id" NAME="dealer_id" required>
                                                    <c:forEach var="u" items="${list}">
                                                        <option>${u.dealer_id}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="p_id">Product Code:</label><br>
                                                <input type="code" class="form-control" id="p_id" NAME="p_id" placeholder="Enter Product Code" pattern="^[a-zA-Z][a-zA-z0-9]+$" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="p_name">Product Name :</label><br>
                                                <input type="text" name="p_name" class="form-control" id="p_name" placeholder="Enter Product Name" required>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="p_category">Product Category :</label><br>
                                                <input type="text" name="p_category" class="form-control" id="p_category" placeholder="Enter Category" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="p_category">Company Name :</label><br>
                                                <input type="text" name="p_company" class="form-control" id="p_company" placeholder="Enter Company Name" required>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="p_unit">Unit:</label><br>
                                                <input type="text" name="p_unit" class="form-control" id="p_unit" placeholder="Enter Unit" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">

                                                <label for="p_quantity">Quantity:</label><br>
                                                <input type="number" name="p_quantity" class="form-control" id="p_quantity" placeholder="Enter Quantity" pattern="^[0-9]+$" required>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="per_unit_price">Per Unit Price: </label><br>
                                                <input type="number" name="per_unit_price" class="form-control" id="per_unit_price" placeholder="Enter Per_Unit_Price" pattern="^[0-9]+$" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="purchase_date">Purchase Date</label><br>
                                                <input type="date" name="purchase_date" class="form-control" id="purchase_date" required>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="form-group col-md-offset-3" style="width:20%;">
                                            <div class="col-md-12">
                                                <button class="btn btn-danger btn-block">Submit</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br>
                        </form>
                    </div>
                </div>
            </div>
        </section>
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
<% }%>
