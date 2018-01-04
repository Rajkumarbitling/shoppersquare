<%-- 
    Document   : login
    Created on : 19 Jul, 2017, 2:00:02 PM
    Author     : Rajkumar
--%>

<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean",
            "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
       request.setAttribute("error","Invalid Username or Password");
RequestDispatcher rd=request.getRequestDispatcher("/signin.jsp");            
rd.include(request, response);
    }
%>
