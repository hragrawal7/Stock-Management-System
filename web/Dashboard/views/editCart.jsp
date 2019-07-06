<%@page import="com.stock.SaleItem"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    if (session.getAttribute("c") != null) {
        ArrayList<SaleItem> cart = (ArrayList<SaleItem>) session.getAttribute("c");

        String p_id = request.getParameter("id");
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getP_id().equals(p_id)) {
                cart.remove(i);
                break;
            }
        }
        session.setAttribute("c", cart);
    }
    response.sendRedirect("sales.jsp");
%>