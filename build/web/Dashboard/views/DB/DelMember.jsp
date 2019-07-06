<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
UserDao.deleteMember(u);
response.sendRedirect("../MemberList.jsp");
%>