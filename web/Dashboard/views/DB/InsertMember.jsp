<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = UserDao.saveMember(u);
//UserDao.sendMail(u.getEmail());
    if (i > 0) {
        out.println("<script>alert('Successfully Inserted!!!');window.location.href='../MemberShip.jsp'</script>");
    } else {
        out.println("<script>alert('This member id is already registered');window.location.href='../MemberShip.jsp'</script>");
    }
%>
