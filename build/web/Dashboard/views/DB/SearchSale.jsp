 <%@page import="com.inventory.dao.UserDao,com.inventory.bean.User"%>
                        <%
                    String code=request.getParameter("code");
                    User u=UserDao.getRecordByPurchaseCode(code);
                        %>
                        
                        <jsp:include page="../sales.jsp" >
                            <jsp:param name="param" value="u" />
                        </jsp:include>