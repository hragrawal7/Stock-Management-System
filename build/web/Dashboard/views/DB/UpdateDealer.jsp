<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UserDao.updatedealer(u);
response.sendRedirect("../Dealership.jsp");
%>
