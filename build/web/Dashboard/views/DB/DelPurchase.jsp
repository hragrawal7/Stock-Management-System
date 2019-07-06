<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    String msg = null;
    int i = UserDao.deletepurchase(u);
    if (i > 0) {
        msg = "Deleted Succesfully!";
    } else {
        msg = "Error! Couldn't Delete!";
    }
    response.sendRedirect("../ProductList.jsp?msg="+msg);
%>