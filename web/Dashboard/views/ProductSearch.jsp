<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.jsp");
%>

<%} else {

%>

<%@ page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" href="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <%            String s = request.getParameter("p_id");
            String p_id, p_category, p_name, p_company, p_unit, p_price;
            int id;
            if (s == null || s.trim().equals("")) {
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
                    PreparedStatement ps = con.prepareStatement("select * from product where p_id=?");
                    ps.setString(1, s);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        p_id = rs.getString(2);
                        p_name = rs.getString(3);
                        p_category = rs.getString(4);
                        p_company = rs.getString(5);
                        p_unit = rs.getString(7);
                        p_price = rs.getString(8);
        %>
        <form class="form-inline">
            <table width="20%">
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="p_name">Product Name :</label><br>
                            <input type="text" name="p_name" value="<% out.print(p_name);%>" class="form-control" id="p_name">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="p_category">Product Category :</label><br>
                            <input type="text" name="p_category" value="<% out.print(p_category);%>" class="form-control" id="p_category" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="p_quantity">Quantity:</label><br>
                            <input type="text" name="quantity" class="form-control" id="customer id" placeholder="Enter Quantity">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="customer id">Unit:</label><br>
                            <input type="text" name="unit" value="<% out.print(p_unit);%>" class="form-control" id="customer id" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="customer id">Per Unit Price: </label><br>
                            <input type="text" name="per_unit_price" value="<% out.print(p_price);%>" class="form-control" id="customer id" placeholder="Enter  per unit price">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="customer id">Total Price: </label><br>
                            <input type="text" name="total_price" class="form-control" id="customer id" placeholder="Enter Total Price">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="customer id">Date: </label><br>
                            <input type="date" name="date" class="form-control">
                        </div>
                    </td><br>
                </tr>
                <tr>
                    <td>
                        <div class="btn">
                            <button style="margin-left:150px;" class="btn btn-vimeo">Add Product</button>
                        </div>
                    </td>
                </tr>
            </table>
        </form>


        <%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>  

    </body>
</html>
<%
    }
%>
