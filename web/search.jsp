<%-- 
    Document   : search
    Created on : 21 Sep, 2017, 8:44:58 AM
    Author     : Rajkumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body ng-app="myModule">
        <div>
            <input type="search" ng-model="searchText.name" placeholder="search products"/>
            <table>
                <thead>
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Description</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="product in affablebean | filter : searchText">
                        <td>{{product.id}}</td>
                        <td>{{product.name}}</td>
                        <td>{{product.price}}</td>
                        <td>{{product.description}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
