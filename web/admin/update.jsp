<%-- 
    Document   : Update
    Created on : 2 Sep, 2017, 2:55:07 PM
    Author     : Rajkumar
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.includehelp.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update</title>
    </head>

    <body>
        <jsp:include page="addproduct.jsp"></jsp:include>

        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String Price = request.getParameter("price");
            String description = request.getParameter("description");
            int category_id = Integer.parseInt(request.getParameter("category_id"));
            Date last_update = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("last_update"));

            Double p1 = Double.valueOf(Price);
            BigDecimal price = BigDecimal.valueOf(p1);

            UserPOJO uObject = new UserPOJO();
            uObject.setid(id);
            uObject.setname(name);
            uObject.setdescription(description);
            uObject.setprice(price);
            uObject.setcategory_id(category_id);
            uObject.setlast_update(last_update);

            Operations opObject = new Operations();
                    String message = opObject.Update(uObject);%>

        <%if (message != null) {%>
        <div class="clearfix"></div>
        <div class="alert alert-success col-md-4">
            <%=message%></div>

        <%}%>

    </body>
</html>
