<html>

    <body>
        
        <form action="DB/InsertSale.jsp">
        <table>
            <tr>
                <td>
                    <p>Code</p><br>
                    <input type="text" name="code">
                </td>
                <td>
                    <p>Category</p><br>
                    <input type="text" name="category">
                </td>
            </tr>
            <tr>
                <td>
                    <p>Product Name</p><br>
                    <input type="text" name="product_name">
                </td>
                <td>
                    <p>Quantity</p><br>
                    <input type="text" name="quantity">
                </td>
            </tr>
            <tr>
                <td>
                    <p>Unit</p><br>
                    <input type="text" name="unit">
                </td>
                <td>
                    <p>Per Unit Price</p><br>
                    <input type="text" name="per_unit_price">
                </td>
            </tr>
            <tr>
               
                <td>
                    <p>Date</p><br>
                    <input type="date" name="date">
                </td>
            <tr>
                <td><input type="submit" name="" value="submit"></td>
            </tr>
            </tr>
        </table>
        </form>
        
        
        
        <%@page import="java.sql.*"%>
        <%@page import="com.inventory.dao.UserDao, com.inventory.bean.*, java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<%
List<User> list=UserDao.getAllSaleRecords();
request.setAttribute("list",list);
//int a=1;
%>
            <div class="panel panel-primary">
                <div class="container">
                    <legend><h2>Items Details</h2></legend>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>SL. No.</th>
                                <th>Code Number</th>
                                <th>Category</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Unit</th>
                                <th>Per Unit Price(TK)</th>
                                <th>Total Price</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${list}">
                            <tr>
                                     
                                <td>1</td>
                                <td>${u.code}</td>
                                <td>${u.category}</td>
                                <td>${u.product_name}</td>
                                <td>${u.quantity}</td>
                                <td>${u.unit}</td>
                                <td>${u.per_unit_price}</td>
                                <td>${u.total_price}</td>
                                <td>${u.date}</td>
                                <td>
                                    <a href="#" class="btn btn-success btn-sm btn-icon icon-left" role="button">
                                        <i class="entypo-pencil"></i>
                                        Edit
                                    </a>
                                    <a href="#"  class="btn btn-danger btn-sm btn-icon icon-left" role="button">
                                        <i class="entypo-cancel"></i>
                                        Delete
                                    </a>
                                </td>
                            </tr>
                           </c:forEach>
                            

                        </tbody>
                    </table>
                </div>
            </div>
        
    </body>
</html>