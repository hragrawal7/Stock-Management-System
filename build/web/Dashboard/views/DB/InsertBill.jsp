<%@page import="com.inventory.dao.UserDao"%>
<%@page import="java.sql.*"%>
<%@page import="com.stock.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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


        <%

            if (session.getAttribute("c") != null) {
                ArrayList<SaleItem> cart = (ArrayList<SaleItem>) session.getAttribute("c");

                int bill_id = Integer.parseInt(request.getParameter("bill_id"));

                String member_id = request.getParameter("member_id");
                String date = request.getParameter("date");
                String total_amt = request.getParameter("total_amt");
                String discount = request.getParameter("discount");
                String final_amt = request.getParameter("final_amt");

                Connection con = UserDao.getConnection();
                PreparedStatement ps1 = con.prepareStatement("insert into bill(member_id,date,total_amt,discount,final_amt) values(?,?,?,?,?)");
                ps1.setString(1, member_id);
                ps1.setString(2, date);
                ps1.setString(3, total_amt);
                ps1.setString(4, discount);
                ps1.setString(5, final_amt);
                int status = ps1.executeUpdate();

                if (status > 0) {
//                    out.println("Bill Inserted Successfully!");
                    ps1 = con.prepareStatement("insert into sale(p_id,p_quantity,bill_id) values(?,?,?)");

                    PreparedStatement ps2 = con.prepareStatement("select p_quantity from product where p_id=?");
                    PreparedStatement ps3 = con.prepareStatement("update product set p_quantity=? where p_id=?");

                    ps1.setInt(3, bill_id);
                    for (SaleItem item : cart) {
                        //adding to sale table
                        ps1.setString(1, item.getP_id());
                        ps1.setInt(2, item.getP_quantity());
                        ps1.executeUpdate(); //1

                        //fetching quantity form db
                        int quantity_db = 0;
                        ps2.setString(1, item.getP_id());
                        ResultSet rs = ps2.executeQuery(); //2
                        if (rs.next()) {
                            quantity_db = rs.getInt("p_quantity");
                        }
                        //updating the quantity in db
                        int quantity_new = quantity_db - item.getP_quantity();
                        ps3.setInt(1, quantity_new);
                        ps3.setString(2, item.getP_id());
                        ps3.executeUpdate(); //3
                    }
                    session.removeAttribute("c");
                    System.out.println("Success!");

        %>
        <div style="margin-top: 15%;margin-left: 35%;">
            <h1>Completed Successfuly!</h1>
            <div class="col-md-offset-1 col-md-3">
                <form action="../sales.jsp">
                    <input type="submit" class="pull-right btn btn-primary btn-block " value="Click to Continue"/>
                </form>
            </div>
        </div>
        <%     } else {
                    out.println("Cannot insert into bill table");
                }
            } else {
                response.sendRedirect("../sales.jsp?ErrorMsg=Cart is Empty");
            }
        %>
    </body>
