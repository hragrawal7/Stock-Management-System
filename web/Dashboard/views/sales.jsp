<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("../../index.jsp");
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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script>src = "https://code.jquery.com/jquery-2.2.4.min.js"integrity = "sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="crossorigin = "anonymous" ></script>


        <link rel="stylesheet" href="style.css" type="text/css">
        <script>
                    function confirmGo(m, u) {
                        if (confirm(m)) {
                            window.location = u;
                        }
                    }
        </script>

        <script>
            var request;
            function sendInfo()
            {
                var v = document.vinform.t1.value;
                var url = "SaleSearch.jsp?val=" + v;

                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    document.getElementById('amit').innerHTML = val;
                }
            }


            var r;
            function checkMemberID()
            {
                var member_id = document.getElementById("member_id").value;
                var url = "CheckMembership.jsp?member_id=" + member_id;

                if (window.XMLHttpRequest) {
                    r = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    r = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    r.onreadystatechange = function () {
                        if (r.readyState === 4) {
                            var val = r.responseText;
                            document.getElementById('memberInfo').innerHTML = val;
                        }
                    };
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
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
                        <form action="#" class="form-inline" name="vinform">
                            <table>
                                <tr>
                                    <td>
                                        <div class="form-group"><br>
                                            <label for="p_id">Product Code :</label>
                                            <input type="text" name="t1" onkeyup="sendInfo()" class="form-control" placeholder="Enter code">
                                        </div>

                                    </td>
                                </tr>
                            </table>
                            <br>
                        </form>

                        <!-- Start of sale form -->
                        <div id="amit">

                        </div>

                        <!-- end of sale -->
                    </div>
                </div>
            </main>


            &nbsp; <!--end of 1st part -->
            <br>


            <!--            <div class="container">
                            <legend><b>CALCULATOR</b></legend>
                            <form name="Calc" class="form-inline">
            
                                <table border=6>
                                    <tr>
                                        <td align=right>
                                            <input type="text"   name="Input" size="35"  style=" text-align: justify">
                                            <br>
                                        </td>
                                    </tr>
                                    <td>
            
                                        <input type="button" NAME="one"   VALUE="  1  " OnClick="Calc.Input.value += '1'">
                                        <input type="button" NAME="two"   VALUE="  2  " OnCLick="Calc.Input.value += '2'">
                                        <input type="button" NAME="three" VALUE="  3  " OnClick="Calc.Input.value += '3'">
                                        <input type="button" NAME="times" VALUE="  -  " OnClick="Calc.Input.value += ' - '">
                                        <input type="button" NAME="r_paren" VALUE="  )  " OnClick="Calc.Input.value += ' ) '">
                                        <br>
            
                                        <input type="button" NAME="four"  VALUE="  4  " OnClick="Calc.Input.value += '4'">
                                        <input type="button" NAME="five"  VALUE="  5  " OnCLick="Calc.Input.value += '5'">
                                        <input type="button" NAME="six"   VALUE="  6  " OnClick="Calc.Input.value += '6'">
                                        <input type="button" NAME="minus" VALUE="  X  " OnClick="Calc.Input.value += ' * '">
                                        <input type="button" NAME="l_paren" VALUE="  (  " OnClick="Calc.Input.value += ' ( '">
                                        <br>
            
                                        <input type="button" NAME="seven" VALUE="  7  " OnClick="Calc.Input.value += '7'">
                                        <input type="button" NAME="eight" VALUE="  8  " OnCLick="Calc.Input.value += '8'">
                                        <input type="button" NAME="nine"  VALUE="  9  " OnClick="Calc.Input.value += '9'">
                                        <input type="button" NAME="plus"  VALUE="  /  " OnClick="Calc.Input.value += ' / '">
                                        <input type="button" NAME="clear"VALUE="  C  " OnClick="Calc.Input.value = ''">
                                        <br>
            
                                        <input type="button" NAME="point" STYLE="font-size:110%" VALUE="  .  " OnClick="Calc.Input.value += '.'">
                                        <input type="button" NAME="zero"  VALUE="  0  " OnClick="Calc.Input.value += '0'">
                                        <input type="button" NAME="Equals"  VALUE="  =  " OnClick="Calc.Input.value = eval(Calc.Input.value)">
                                        <input type="button" NAME="div"   VALUE="  +  " OnClick="Calc.Input.value += ' + '">
                                    </td>
                                </table>
                            </form>
                        </div>-->

            <br>

            <%@ page import="java.io.*,java.util.*,java.sql.*"%>
            <%@ page import="com.stock.*"%>

            <%
                if (request.getParameter("ErrorMsg") != null) {
            %>
            <script>
                alert('<%=request.getParameter("ErrorMsg")%>');
            </script>
            <%
                }

                if (session.getAttribute("c") != null) {
                    ArrayList cart = (ArrayList) session.getAttribute("c");
            %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>            

            <%
                String p_id, p_name, p_category, p_company, p_unit;
                int p_quantity, p_price;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
                PreparedStatement ps = con.prepareStatement("select * from product where p_id=?");
            %>


            <div class="panel panel-primary" style="overflow: auto">
                <div class="container">
                    <legend><h2>Items Details</h2></legend>

                    <table class="table table-hover">

                        <tr>
                            <th>SL.</th>
                            <th>Code</th>
                            <th>Category</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                            <th>Per<br>Unit<br>Price(Rs)</th>
                            <th>Action</th>
                        </tr>
                        <%
                            int a = 1;
                            for (int i = 0; i < cart.size(); i++) {

                                SaleItem item = (SaleItem) cart.get(i);
                                ps.setString(1, item.getP_id());

                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    p_id = rs.getString(2);
                                    p_name = rs.getString(3);
                                    p_category = rs.getString(4);
                                    p_company = rs.getString(5);
                                    p_unit = rs.getString(7);
                                    p_price = rs.getInt(8);

                                    p_quantity = item.getP_quantity();
                        %>

                        <tr>
                            <td><% out.print(a++); %></td>
                            <td><% out.print(p_id); %></td>
                            <td><% out.print(p_category); %></td>
                            <td><% out.print(p_name); %></td>
                            <td><% out.print(p_quantity); %></td>
                            <td><% out.print(p_unit); %></td>
                            <td><% out.print(p_price);%></td>
                            <td>
                                <a href="javascript:confirmGo('Sure to delete this record?','editCart.jsp?id=<c:out value="<%=p_id%>"/>')"  class="btn btn-danger btn-sm btn-icon icon-left" role="button">
                                    <i class="entypo-cancel"></i>
                                    Delete
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
            </div>
            <%
                }
            %>
            <div class="panel panel-primary">
                <div class="container">

                    <div class="form-inline">
                        <div class="form-group"> <br><br>

                            <legend><b>Customer Info</b></legend>

                            <div class="col-sm-12">
                                <h3>The customer has any membership? </h3>
                                <div class="form-group">
                                    <select id="member" name="member" class="form-control">
                                        <option>Select</option>
                                        <option value="1">Yes</option>
                                        <option value="2">No</option>
                                    </select>
                                </div><br>
                                <form action="Sale_print_walk.jsp">
                                    <div id="parentPermission1">

                                        <table>
                                            &nbsp;

                                            <tr><td>Name Of Walking Customer:
                                                    <input type="text" name="name" class="form-control" placeholder="Enter Name" required>
                                                </td>
                                                <td>
                                                    <div class="btn">
                                                        <button class="btn btn-vimeo">Proceed</button>
                                                    </div>

                                                </td>

                                            </tr>


                                        </table>

                                    </div>
                                </form>
                            </div>
                            <form action="Sale_print_memberVerify.jsp">
                                <div id="parentPermission">
                                    <table>
                                        &nbsp;
                                        <tr><td>User ID.:  <input type="text" name="member_id" class="form-control" placeholder="Enter User Id" required ></td>
                                            <td>
                                                <div class="btn">
                                                    <button class="btn btn-vimeo" >Proceed</button>
                                                </div>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <br>
            </div>

            </main>

            <footer></footer>&nbsp;
            <br>
            <br>
            <br>

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

<script>
    $(document).ready(function () {
        toggleFields(); //call this first so we start out with the correct visibility depending on the selected form values
        //this will call our toggleFields function every time the selection value of our underAge field changes
        $("#member").change(function () {
            toggleFields();
        });

    });
//this toggles the visibility of our parent permission fields depending on the current selected value of the underAge field
    function toggleFields() {
        if ($("#member").val() <= 1) {
            $("#parentPermission").show();
            $("#parentPermission1").hide();
        } else if ($("#member").val() <= 2) {
            $("#parentPermission1").show();
            $("#parentPermission").hide();
        } else {
            $("#parentPermission").hide();
            $("#parentPermission1").hide();

        }
    }
</script>
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
