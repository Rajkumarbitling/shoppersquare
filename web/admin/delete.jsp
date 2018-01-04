<%-- 
    Document   : Delete
    Created on : 2 Sep, 2017, 3:02:17 PM
    Author     : Rajkumar
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.includehelp.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Delete</title>
	</head>
	
	<body>
            <jsp:include page="addproduct.jsp"></jsp:include>
		<%
		String value = request.getParameter("id");
		String split[] =value.split("~");
		String id = split[0];

		Operations opObject = new Operations();
		String message = opObject.deleteUser(id);
		if(message!=null){%>
		<div class="clearfix"></div>
		<span class="alert alert-success col-md-4"><%=message%></span>
		<%}%>
	</body>
</html>
