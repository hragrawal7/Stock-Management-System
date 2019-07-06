<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String s = request.getParameter("p_id");
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
                out.print(p_price);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>