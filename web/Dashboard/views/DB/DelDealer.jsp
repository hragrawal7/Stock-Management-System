<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
UserDao.deletedealer(u);
response.sendRedirect("../Dealership.jsp");
%>