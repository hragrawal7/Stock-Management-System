<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.stock.SaleItem"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.jsp");
%>
<h1>You are not logged in</h1><br/>
<a href="index.jsp">Please Login</a>
<%} else {

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
    PreparedStatement ps = con.prepareStatement("select * from bill where bill_id=?");
    ps.setString(1, request.getParameter("bill_id"));
    ResultSet rs = ps.executeQuery();
    if (!rs.next()) {
        out.println("Something is wrong!!");
    } else {
%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

        <style>
            @import url(http://fonts.googleapis.com/css?family=Bree+Serif);
            body, h1, h2, h3, h4, h5, h6{
                font-family: 'Bree Serif', serif;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <form action="#" method="post">
                <div class="row">
                    <div class="col-xs-6">
                        <h1>
                            <a>
                                <img src="../../Image/logo2.png" width="170" height="150" alt="" class="img-circle">
                            </a>
                        </h1>
                    </div>
                    <div class="col-xs-6 text-right">
                        <h1>Slip</h1>
                        <h1><small>BILL NO.: <%=rs.getString("bill_id")%></small>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5">
                    </div>
                    <div class="col-xs-5 col-xs-offset-2 text-right">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>To :
                                    <%
                                        String customer = null;
                                        PreparedStatement ps2 = con.prepareStatement("select * from membership where member_id=?");
                                        ps2.setString(1, rs.getString("member_id"));
                                        ResultSet rs2 = ps2.executeQuery();
                                        if (rs2.next()) {
                                            customer = rs2.getString("name");
                                        } else {
                                            customer = rs.getString("member_id");
                                        }
                                    %>
                                    <a href="#" style="text-decoration: none;"><%=customer%> </a>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / end client details section -->
                <%
                %>


                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>S.No.</th>
                            <th>Product Code</th>
                            <th>Category</th>
                            <th>Product Name</th>
                            <th>Company Name</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                            <th>Per<br>Unit<br>Price(Rs.)</th>
                            <th>Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int a = 1;

                            PreparedStatement ps1 = con.prepareStatement("SELECT sale.p_id,sale.p_quantity,product.p_name,product.p_category,product.p_company,product.p_unit,product.p_price FROM product,sale WHERE sale.p_id=product.p_id AND sale.bill_id=?");
                            ps1.setString(1, rs.getString("bill_id"));
                            ResultSet rs1 = ps1.executeQuery();
                            while (rs1.next()) {
                        %>

                        <tr>
                            <td><% out.print(a++);%></td>
                            <td><%=rs1.getString("p_id")%></td>
                            <td><%=rs1.getString("p_category")%></td>
                            <td><%=rs1.getString("p_name")%></td>
                            <td><%=rs1.getString("p_company")%></td>
                            <td><%=rs1.getString("p_quantity")%></td>
                            <td><%=rs1.getString("p_unit")%></td>
                            <td><%=rs1.getString("p_price")%></td>
                            <td><%  out.println(Float.parseFloat(rs1.getString("p_quantity")) * Float.parseFloat(rs1.getString("p_price")));%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <div class="row text-right">
                    <div class="col-xs-2 col-xs-offset-8">
                        <p>
                            <strong>
                                Sub Total : <br>
                                Discount : <br>
                                <br>
                                Total : <br>
                                Date : <br>
                            </strong>
                        </p>
                    </div>
                    <div class="col-xs-2">
                        <strong>
                            <input type="text" name="total_amt" disabled value="<%=rs.getString("total_amt")%>"> <br>
                            <input type="text" name="discount" disabled value="<%=rs.getString("discount")%>"> <br>
                            <input type="text" name="final_amt" disabled value="<%=rs.getString("final_amt")%>"> <br>
                            <input type="text" name="date" disabled value="<%=rs.getString("date")%>"> <br>
                            <br>
                        </strong>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

<%    }
    }
%>
