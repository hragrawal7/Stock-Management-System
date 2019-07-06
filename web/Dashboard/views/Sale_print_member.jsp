<%@page import="com.stock.SaleItem"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.jsp");
%>
<h1>You are not logged in</h1><br/>
<a href="index.jsp">Please Login</a>
<%} else {

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
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>            
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/inventory"
                           user="root"  password=""/>
        <div class="container">
            <form action="DB/InsertBill.jsp" method="post">
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
                        <sql:query dataSource="${dbsource}" var="res">
                            SELECT bill_id FROM bill ORDER BY bill_id DESC LIMIT 1
                        </sql:query>
                        <h1><small>BILL NO.: 
                                <c:forEach var="row" items="${res.rows}">
                                    <c:out value="${row.bill_id + 1}"/>
                                    <input type="hidden" value="${row.bill_id + 1}" name="bill_id"/>
                                </c:forEach>
                            </small>
                        </h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-5">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>From: <a href="#"><%=session.getAttribute("userid")%></a></h4>
                            </div>

                        </div>
                    </div>
                    <div class="col-xs-5 col-xs-offset-2 text-right">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <sql:query dataSource="${dbsource}" var="result">
                                    SELECT * from membership where member_id=?;
                                    <sql:param value="${param.member_id}" />
                                </sql:query>
                                <h4>To : 
                                    <a href="#">
                                        <c:forEach var="row" items="${result.rows}">
                                            <input type="hidden" value="${param.member_id}" name="member_id"/>
                                            <input type="text" value="${row.name}" name="name" disabled/>
                                        </c:forEach>
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / end client details section -->

                <%
                    if (session.getAttribute("c") != null) {
                        ArrayList<SaleItem> cart = (ArrayList<SaleItem>) session.getAttribute("c");

                        String p_id, p_name, p_category, p_company, p_unit;
                        int p_quantity, p_price;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
                        PreparedStatement ps = con.prepareStatement("select * from product where p_id=?");
                %>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>S.No.</th>
                            <th>Code</th>
                            <th>Category</th>
                            <th>Product Name</th>
                            <th>Company Name</th>
                            <th>Quantity</th>
                            <th>Unit</th>
                            <th>Per<br>Unit<br>Price(TK)</th>
                            <th>Total Price</th>


                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int a = 1;
                            float subtotal = 0.0f;
                            float discount = 0.0f;
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

                                    subtotal += p_quantity * p_price;
                        %>

                        <tr>
                            <td><% out.print(a++); %></td>
                            <td><% out.print(p_id); %></td>
                            <td><% out.print(p_category); %></td>
                            <td><% out.print(p_name); %></td>
                            <td><% out.print(p_company);%></td>
                            <td><% out.print(p_quantity); %></td>
                            <td><% out.print(p_unit); %></td>
                            <td><% out.print(p_price); %></td>
                            <td><% out.print(p_quantity * p_price);%></td>
                        </tr>
                        <%
                                }
                            }
                            String per = null;
                            String category = request.getParameter("category");
                            if (category.equals("Premium")) {
                                per = "5%";
                                discount = (float) (subtotal * 0.05);
                            } else if (category.equals("Silver")) {
                                per = "10%";
                                discount = (float) (subtotal * 0.10);
                            } else {
                                per = "15%";
                                discount = (float) (subtotal * 0.15);
                            }
                        %>
                    </tbody>
                </table>
                <div class="row text-right">
                    <div class="col-xs-2 col-xs-offset-8">
                        <p>
                            <strong>
                                Sub Total : <br>
                                Discount ( <% out.print(per);%> ) : <br>
                                ( <%=category%> ) <br>
                                Total : <br>
                                Date : <br>
                            </strong>
                        </p>
                    </div>
                    <div class="col-xs-2">
                        <strong>
                            <input type="text" name="total_amt" value="<%=subtotal%>"> <br>
                            <input type="text" name="discount" value="<%=discount%>"> <br>
                            <input type="text" name="final_amt" value="<%=subtotal - discount%>"> <br>
                            <input type="text" name="date" id="mydate"> <br>
                            <script>
                                var today = new Date();
                                var dd = today.getDate();
                                var mm = today.getMonth() + 1; //January is 0!

                                var yyyy = today.getFullYear();
                                if (dd < 10) {
                                    dd = '0' + dd;
                                }
                                if (mm < 10) {
                                    mm = '0' + mm;
                                }
                                var today = yyyy + '-' + mm + '-' + dd;
                                document.getElementById("mydate").value = today;
                            </script>
                            <br>
                        </strong>
                    </div>
                </div>
                <input type="submit" class="pull-right btn btn-primary" style="width:14%; " value="Confirm"/>
            </form>
        </div>
    </body>
</html>

<% }
    }%>
