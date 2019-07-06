<%@page import="java.sql.*"%>
<%@page import="com.inventory.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (request.getParameter("date") != null) {
        Connection con = UserDao.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from bill where date = ?");
        ps.setString(1, request.getParameter("date"));
        ResultSet rs = ps.executeQuery();
        int a = 1;
        if (rs.next()) {
%>
<h3>Search Results : </h3>
<table class="table table-hover">
    <thead>
        <tr>
            <th>Sl No.</th>
            <th>Date</th>
            <th>Bill_ID</th>
            <th>Member ID</th>
            <th>Final Amount</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            do {
        %>
        <tr>
                <td><% out.print(a);
                    a++;%></td>
            <td><%=rs.getString("date")%></td>
            <td><%=rs.getString("bill_id")%></td>
            <td><%=rs.getString("member_id")%></td>
            <td><%=rs.getString("final_amt")%></td>
            <td>
                <a href="ViewBill.jsp?bill_id=<%=rs.getInt("bill_id")%>" class="btn btn-success btn-sm btn-icon icon-left" role="button">
                    <i class="entypo-pencil"></i>
                    View Details
                </a>
            </td>

        </tr>
        <%
            } while (rs.next());
        %>
    </tbody>
</table>
<%
        } else {
            out.println("<h4>No Records Found!!</h4>");
        }
    }
%>