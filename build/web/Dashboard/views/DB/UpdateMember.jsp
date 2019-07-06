<%@page import="com.inventory.dao.UserDao"%>
<jsp:useBean id="u" class="com.inventory.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i=UserDao.updateMember(u);
if(i>0){
response.sendRedirect("../MemberList.jsp");
}else{
out.println("unable to connect database");
}
%>