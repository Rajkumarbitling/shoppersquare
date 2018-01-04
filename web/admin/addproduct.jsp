<%-- 
    Document   : addproduct
    Created on : 30 Aug, 2017, 8:13:26 PM
    Author     : Rajkumar
--%>

<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" import="com.includehelp.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Product Console</title>
        <link href="/ShopperSquare/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title align-center">Product Console</h3>
                </div>
                <div class="panel-body">
                    <form action="action.jsp" class="form-horizontal" method="post">

                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="id" class="control-label">PRODUCT ID</label>
                            <input type="id" id="id" class="form-control" name="id" placeholder="ENTER PRODUCT ID" required="required">
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="name" class="control-label">PRODUCT NAME</label>
                            <input type="name" id="name" class="form-control" name="name" placeholder="ENTER PRODUCT NAME" required="required">
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="price" class="control-label">PRODUCT PRICE</label>
                            <input type="price" id="price" class="form-control" name="price" placeholder="ENTER PRODUCT PRICE" required="required">
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="description" class="control-label">DESCRIPTION</label>
                            <input type="description" id="description" class="form-control" name="description" placeholder="ENTER DESCRIPTION" required="required">
                        </div>

                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="category_id" class="control-label">CATEGORY</label>
                            <select id="department" required="required" class="form-control" name="category_id">
                                <option value="">Select Category</option>
                                <option value="1">Dairy</option>
                                <option value="2">Meats</option>
                                <option value="3">Bakery</option>
                                <option value="4">Fruit & Veg</option>
                            </select>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <label for="last_update" class="control-label">DATE</label>
                            <input type="date" id="datetime" class="form-control" name="last_update" placeholder="ENTER DATE" required="required">
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-md-6">
                            <button class="btn btn-success">ADD</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%
            Operations opObject = new Operations();

            List<UserPOJO> list = new ArrayList();

            list = opObject.getListUsers();
            System.out.println(list.size());
            if (!(list.isEmpty())) {
        %>
        <table class="table bordered">
            <thead><tr><th></th><th>ID</th><th>NAME</th><th>PRICE</th><th>DESCRIPTION</th><th>CATEGORY_ID</th><th>LAST_UPDATE</th></tr></thead>
                        <% for (UserPOJO p : list) {%>
            <tr><td><input type="radio" name="rdValues" id="rdId" value="<%=p.getid() + "~" + p.getname() + "~" + p.getprice() + "~" + p.getdescription() + "~" + p.getcategory_id() + "~" + p.getlast_update()%>"></td><td><%=p.getid()%></td><td><%=p.getname()%></td><td><%=p.getprice()%></td><td><%=p.getdescription()%></td><td><%=p.getcategory_id()%></td><td><%=p.getlast_update()%></td></tr>
                    <% }%>
        </table>

        <button class="btn btn-primary" name="edit" value="edit" onclick="editThis()">EDIT</button>
        <button class ="btn btn-primary" name="delete" value="delete" onclick="deleteThis()">DELETE</button>

        <%}
        %>
        <script>
            function editThis() {
                var edit;
                edit = document.getElementsByName("rdValues");

                var selVal = "";
                for (var c = 0; c < edit.length; c++) {
                    if (edit[c].checked == true) {
                        selVal += edit[c].value;
                        break;
                    }
                }

                window.location.href = "edit.jsp?values=" + selVal;
            }
            function deleteThis() {

                var values;
                values = document.getElementsByName("rdValues");
                var selVal = "";
                for (var c = 0; c < values.length; c++) {
                    if (values[c].checked == true) {
                        selVal += values[c].value;
                        break;
                    }
                }
                window.location.href = "delete.jsp?id=" + selVal;

            }
        </script>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>