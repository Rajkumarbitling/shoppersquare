<%--
    Document   : Edit
    Created on : 2 Sep, 2017, 2:46:16 PM
    Author     : Rajkumar
--%>




<%@page import="java.util.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit Product</title>
		<link href="/ShopperSquare/css/bootstrap.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	</head>

	<body>

	<%
	String values = request.getParameter("values");
	String split1[] = values.split("~");
	String id = split1[0];
	String name =split1[1];
	String price = split1[2];
	String description = split1[3];
        String category_id = split1[4];
        String last_update = split1[5];
	%>
	<div class="container">
		<div class="panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">CRUD OPERATIONS IN JSP with Bootstrap Design</h3>
			</div>
			<div class="panel-body">
				<form action="update.jsp" class="form-horizontal" method="post">
				<div class="form-group col-md-6">
					<label class="control-label" for=UserID>Product ID</label>
					Product ID CANNOT BE MODIFIED
					<input type="text" id="id" class="form-control" name="id" placeholder="ENTER PRODUCT ID" readonly required="required" value="<%=id%>">
				</div>
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label for="name" class="control-label">Product name</label>
					<input type="name" id="name" value ="<%=name%>"class="form-control" name="name" placeholder="ENTER PRODUCT NAME" required="required">
				</div>
                                   <div class="clearfix"></div>
                                <div class="form-group col-md-6">
					<label for="price" class="control-label">Product price</label>
					<input type="BigDecimal" id="price" value ="<%=price%>"class="form-control" name="price" placeholder="ENTER PRODUCT price" required="required">
				</div>
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label for="description" class="control-label">description</label>
					<input type="description" id="description" class="form-control" name="description" placeholder="ENTER description" value ="<%=description %>" required="required">
				</div>
				
                                <div class="clearfix"></div>
				<div class="form-group col-md-6">
					<label for="category_id" class="control-label">Category</label>
					<select id="price" required="required" class="form-control" name="category_id" value="<%=category_id%>">
						<option value="">Select</option>
						<option value="1">Dairy</option>
						<option value="2">Meat</option>
						<option value="3">Bakery</option>
						<option value="4">Fruit & Veg</option>
					</select>
                                 <div class="form-group col-md-6">
					<label for="last_update" class="control-label">last_update</label>
					<input type="date" id="dateProcessedRow" class="form-control" name="last_update" placeholder="ENTER DATE" value="<%=last_update%>" required="required">
				</div>               
				</div>
				<div class="clearfix"></div>
				<div class="form-group col-md-6">
					<button class="btn btn-success">UPDATE</button>
				</div>
				</form>
			</div>
		</div>
                                  <script>

    </script>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	</body>
</html>
