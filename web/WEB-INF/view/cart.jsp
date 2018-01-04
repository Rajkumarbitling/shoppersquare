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
<c:set var="view" value="/cart" scope="session"/>


<%-- HTML markup starts below --%>

<div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p>Your shopping cart contains ${cart.numberOfItems} items.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p>Your shopping cart contains ${cart.numberOfItems} item.</p>
        </c:when>
        <c:otherwise>
            <p>Your shopping cart is empty</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

            <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url>

            <a href="${url}" class="bubble hMargin">clear cart</a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <c:url var="url" value="${value}"/>
        <a href="${url}" class="bubble hMargin">continue shopping</a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="<c:url value='checkout'/>" class="bubble hMargin">proceed to checkout &#x279f;</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

        <h4 id="subtotal">subtotal:
            <fmt:formatNumber type="currency" currencySymbol="&#8377; " value="${cart.subtotal}"/>
        </h4>

        <div class="top-brands">
            <div class="container">
                <div class="agile_top_brand_left_grid_pos">
                    <img src="img/offer.png" alt=" " class="img-responsive">
                </div><h2>Cart</h2>
                <div style="width: -moz-available" class="grid_3 grid_5">

                    <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

                        

          <c:set var="product" value="${cartItem.product}"/>
                           <div class="agile_top_brands_grids">

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
                                                    <h4><fmt:formatNumber type="currency" currencySymbol="&#8377; " value="${cartItem.total}"/>
                                                        <br>
                                                        <span class="smallText">(
                                                            <fmt:formatNumber type="currency" currencySymbol="&#8377; " value="${product.price}"/>
                                                            / <fmt:message key="unit"/> )</span>
                                                    </h4>
                                                </div>
                                                <div class="snipcart-details top_brand_home_details">
                                                    <form action="<c:url value='updateCart'/>" method="post">
                                                        <input type="hidden"
                                                               name="productId"
                                                               value="${product.id}">
                                                        <input type="text"
                                                               maxlength="2"
                                                               size="2"
                                                               value="${cartItem.quantity}"
                                                               name="quantity"
                                                               style="margin:5px">
                                                        <input class="button"
                                                               type="submit"
                                                               name="submit"
                                                               value="Update">
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

    </c:if>
</div>