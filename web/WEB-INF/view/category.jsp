<%--
 * Copyright (c) 2010, Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software
 * except in compliance with the terms of the license at:
 * http://developer.sun.com/berkeley_license.html

 * author: Rajkumar
--%>


<%-- Set session-scoped variable to track the view user is coming from.
     This is used by the language mechanism in the Controller so that
     users view the same page when switching between English and Czech. --%>
<c:set var="view" value="/category" scope="session" />


<%-- HTML markup starts below --%>

<div id="categoryLeftColumn">

    <c:forEach var="category" items="${categories}">

        <c:choose>
            <c:when test="${category.name == selectedCategory.name}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
                        ${category.name}
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='category?${category.id}'/>" class="categoryButton">
                    <span class="categoryText">
                        ${category.name}
                    </span>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>

</div>



    <div class="top-brandscat">
        <div class="container">
            <div class="agile_top_brand_left_grid_pos">
                <img src="img/offer.png" alt=" " class="img-responsive">
            </div><h2>${selectedCategory.name}</h2>
            <div class="grid_3 grid_5">
               

                            <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

                                <div class="agile_top_brands_grids">

                                    <div class="agile_top_brand_left_grid_pos">
                                        <img src="images/offer.png" alt=" " class="img-responsive">
                                    </div>

                                    <div class="hover14 column">
                                        <div class="agile_top_brand_left_grid">

                                            <div class="agile_top_brand_left_grid1">
                                                <figure>
                                                    <div class="snipcart-item block">
                                                        <div class="snipcart-thumb">
                                                            <img src="${initParam.productImagePath}${product.name}.png"
                                                                 alt="${product.name}">		
                                                            <p> ${product.name}
                                                                <br>
                                                                <span class="smallText"><fmt:message key='${product.name}Description'/></span></p>
                                                            <div class="stars">
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star blue-star" aria-hidden="true"></i>
                                                                <i class="fa fa-star gray-star" aria-hidden="true"></i>
                                                            </div>
                                                            <h4><fmt:formatNumber type="currency" currencySymbol="&#8377; " value="${product.price}"/></h4>
                                                        </div>
                                                        <div class="snipcart-details top_brand_home_details">
                                                            <%if(session.getAttribute("userid")==null){  %>
                                                            <form action="<c:url value='signin.jsp'/>" method="post"><input class="button"
                                                                        type="submit"
                                                                       name="submit"
                                                                       value="add to cart"></form>
                                                            <%} else{%>
                                                            <form action="<c:url value='addToCart'/>" method="post">
                                                                <input type="hidden"
                                                                       name="productId"
                                                                       value="${product.id}">
                                                                <input class="button"
                                                                        type="submit"
                                                                       name="submit"
                                                                       value="add to cart">
                                                                <% } %>
                                                                </form>
                                                                </br>
                                                                
                                                            <%if(session.getAttribute("userid")==null){  %>
                                                            <form action="<c:url value='signin.jsp'/>" method="post"><input class="button"
                                                                        type="submit"
                                                                       name="submit"
                                                                       value="Buy Now"></form>
                                                            <%} else{%>
                                                                <form action="<c:url value='buyNow'/>" method="post">
                                                                <input type="hidden"
                                                                       name="productId"
                                                                       value="${product.id}">
                                                                <input class="button"
                                                                        type="submit"
                                                                       name="submit"
                                                                       value="Buy Now">
                                                                <% } %>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </c:forEach>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>