<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
    int i = UserDao.saveproduct(u);   
    int j = UserDao.savepurchase(u);
    if (i > 0 && j>0) {
        response.sendRedirect("../purchase.jsp?msg=Successfully Inserted");
    } else {
        response.sendRedirect("../purchase.jsp?msg=Error! This Product is already in Store");
    }
%>