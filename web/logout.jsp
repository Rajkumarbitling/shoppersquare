<%-- 
    Document   : logout
    Created on : 19 Jul, 2017, 2:03:52 PM
    Author     : Rajkumar
--%>

<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("signin.jsp");
%>
