<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("name");    
    String pwd = request.getParameter("password");
    String name;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from staff where staff_id='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("main.jsp?name="+userid);
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>