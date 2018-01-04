<%-- 
    Document   : success
    Created on : 19 Jul, 2017, 2:02:54 PM
    Author     : Rajkumar
--%>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="signin.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
