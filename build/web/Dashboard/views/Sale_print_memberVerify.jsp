<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory", "root", "");
PreparedStatement ps = con.prepareStatement(" SELECT * from membership where member_id=?");
ps.setString(1,request.getParameter("member_id"));
ResultSet rs = ps.executeQuery();
if(rs.next())
{
    response.sendRedirect("Sale_print_member.jsp?member_id="+request.getParameter("member_id")+
            "&category="+rs.getString("category"));
}
else
{
    response.sendRedirect("sales.jsp?ErrorMsg=Customer with this member_ID does not Exist!!");
}
%>