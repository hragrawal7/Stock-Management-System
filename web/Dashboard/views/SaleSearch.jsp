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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <%  
        String s=request.getParameter("val");
        String p_id,p_name,p_category,p_company,p_quantity,p_unit,p_price;
        int id;
        if(s==null || s.trim().equals("")){
        //out.print("Please enter AccountID");  
        }else{
        //int id=Integer.parseInt(s);
        //out.print(id);  
        try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root","");  
        PreparedStatement ps=con.prepareStatement("select * from product where p_id=?");  
        //ps.setInt(1,id);
        ps.setString(1, s);
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){ 
        p_id=rs.getString(2);
        p_name=rs.getString(3);
        p_category=rs.getString(4);
        p_company=rs.getString(5);
        p_quantity=rs.getString(6);
        p_unit=rs.getString(7);
        p_price=rs.getString(8);
        %>
        <div class="">
            
            <div class="container">
                <form class="form-inline" method="post" action="addToCart.jsp">
                    <label><h1>Sales</h1></label>
                    <table>
                        <tr>
                            <td>


                                <div class="form-group">
                                    <label for="p_id">Product Code :</label><br>
                                    <input type="text" name="p_id" value="<% out.print(p_id);%>" class="form-control" id="p_id" readonly>
                                </div><br>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="p_name">Product Name: </label><br>
                                    <input type="text" name="p_name" value="<% out.print(p_name);%>" class="form-control" id="p_name" readonly>
                                </div><br>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="p_category">Category :</label><br>
                                    <input type="text" name="p_category" value="<% out.print(p_category);%>" class="form-control" id="p_category" readonly>
                                </div><br>
                            </td>

                            
                        </tr>
                        <tr>
                              <td>
                                <div class="form-group">
                                    <label for="p_company">Company:</label><br>
                                    <input type="text" name="p_company" value="<% out.print(p_company);%>" class="form-control" id="p_company" readonly>
                                </div><br>
                            </td>
                            
                            <td>
                                <div class="form-group">
                                    <label for="p_unit">Unit:</label><br>
                                    <input type="text" name="p_unit" value="<% out.print(p_unit);%>" class="form-control" id="p_unit" readonly>
                                </div><br>
                            </td>
                            <td>
                                <div class="form-group">
                                    <label for="p_price">Per Unit Price: </label><br>
                                    <input type="text" name="p_price" value="<% out.print(p_price);%>" class="form-control" id="p_price" readonly>
                                </div><br>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <div class="form-group">
                                    <label for="p_quantity">Quantity:</label><br>
                                    <input type="number" name="p_quantity"  class="form-control" id="p_quantity" placeholder="Enter Quantity" required="You have to enter some value">
                                </div><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="btn">
                                    <button class="btn btn-vimeo">Add Product</button>
                                </div>

                            </td>
                        </tr>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
     
        
        <% 
        }
        con.close();  
        }catch(Exception e){e.printStackTrace();}  
        }  
        %>  

    </body>
</html>
<%
    }
%>
