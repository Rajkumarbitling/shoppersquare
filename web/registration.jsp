<%-- 
    Document   : registration
    Created on : 19 Jul, 2017, 1:55:07 PM
    Author     : Rajkumar
--%>


<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/affablebean",
            "root", "root");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");
    if (i > 0) {
        //session.setAttribute("userid", user);
        request.setAttribute("success", "Registration Successful Please Login!");
        RequestDispatcher rd = request.getRequestDispatcher("/signin.jsp");
        rd.include(request, response);
        // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        request.setAttribute("error", "Registration UnSuccessful due to an Error");
        RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
        rd.include(request, response);
    }
%>
