<%-- 
    Document   : addToCart
    Created on : 2 Mar, 2019, 5:41:56 PM
    Author     : SHWETA AGARWAL
--%>

<%@page import="com.inventory.dao.UserDao.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.inventory.dao.UserDao"%>
<%@page import="java.util.*"%>
<%@page import="com.stock.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList cart;
            if (session.getAttribute("c") == null) {
                cart = new ArrayList();
            } else {
                cart = (ArrayList) session.getAttribute("c");
            }

            UserDao ud = new UserDao();
            Connection con = ud.getConnection();
            PreparedStatement ps = con.prepareStatement("select p_quantity from product where p_id=?");
            ps.setString(1, request.getParameter("p_id"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int quantity_db = rs.getInt("p_quantity");
                int quantity_req = 0;
                SaleItem item = null;
                int index = -1;
                for (int i = 0; i < cart.size(); i++) {
                    SaleItem x = (SaleItem) cart.get(i);
                    if (x.getP_id().equals(request.getParameter("p_id"))) {
                        index = i;
                        break;
                    }
                }
                if (index != -1) {
                    item = (SaleItem) cart.get(index);
                    quantity_req =item.getP_quantity() + Integer.parseInt(request.getParameter("p_quantity"));
                } else {
                    item = new SaleItem();
                    item.setP_id(request.getParameter("p_id"));
                    quantity_req = Integer.parseInt(request.getParameter("p_quantity"));
                }
                if (quantity_db >= quantity_req) {
                    if (index != -1) {
                        cart.remove(index);
                    }
                    item.setP_quantity(quantity_req);
                    cart.add(item);
                    session.setAttribute("c", cart);
                    response.sendRedirect("sales.jsp");
                } else {
                    response.sendRedirect("sales.jsp?ErrorMsg=Not Enough Quantity Available in Store!!");
                }
            }
        %>
    </body>
</html>
