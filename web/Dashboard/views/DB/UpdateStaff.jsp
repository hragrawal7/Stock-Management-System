<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
    int i = UserDao.updateStaff(u);
    if (i > 0) {
%>
<script>
    alert('Updated Successfully!!!');
    window.location.href = '../../../main.jsp?';
</script>
<%
    session.setAttribute("userid",u.getStaff_id());
} else {
%>
<script>
    alert('Something is Wrong!');
</script>
<%
    }
%>