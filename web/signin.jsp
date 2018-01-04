<%-- 
    Document   : login
    Created on : 19 Jul, 2017, 1:46:35 PM
    Author     : Rajkumar
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/ShopperSquare/css/affablebean.css">
        <link rel="shortcut icon" href="/ShopperSquare/img/favicon.ico">
        <link href="/ShopperSquare/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="/ShopperSquare/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="/ShopperSquare/css/skdslider.css" rel="stylesheet" type="text/css"/>
        <link href="/ShopperSquare/css/style.css" rel="stylesheet" type="text/css"/>

        <script src="/ShopperSquare/js/jquery-1.4.2.js" type="text/javascript"></script>
        <script src="/ShopperSquare/js/jquery-ui-1.8.4.custom.min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/easing.js" type="text/javascript"></script>
        <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.validate.js" type="text/javascript"></script>
        <script src="../../js/minicart.min.js" type="text/javascript"></script>
        <script src="../../js/move-top.js" type="text/javascript"></script>
        <script src="../../js/responsiveslides.min.js" type="text/javascript"></script>
        <script src="../../js/skdslider.min.js" type="text/javascript"></script>
        <script src="../../js/localization/messages_cs.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('a.categoryButton').hover(
                        function () {
                            $(this).animate({backgroundColor: '#b2d2d2'})
                        },
                        function () {
                            $(this).animate({backgroundColor: '#d3ede8'})
                        }
                );

                $('div.categoryBox').hover(over, out);

                function over() {
                    var span = this.getElementsByTagName('span');
                    $(span[0]).animate({opacity: 0.3});
                    $(span[1]).animate({color: 'white'});

                }

                function out() {
                    var span = this.getElementsByTagName('span');
                    $(span[0]).animate({opacity: 0.7});
                    $(span[1]).animate({color: '#444'});
                }
            });
        </script>

        <title>Shoppers Square</title>
    </head>

    <body>
        <div id="head">
            <!-- header -->
            <div class="agileits_header">
                <div class="container">
                    <div class="w3l_offers">
                        <p>SALE UP TO 70% OFF. USE CODE "SALE70%" . <a href="category.jsp">SHOP NOW</a></p>
                    </div>
                    <div class="agile-login">
                        <ul>
                            <li><a href="signup.jsp"> Create Account </a></li>
                            <li><a href="signin.jsp">Login</a></li>
                            <li><a href="contact.html">Help</a></li>
                            <li><div id="widgetBar">



                                    <%-- checkout widget --%>
                                    <div class="headerWidget">

                                        <%-- tests for the following:
                                             * if cart exists and is not empty
                                             * if the servlet path does not contain '/checkout'
                                             * if the requested view is not checkout
                                             * if the servlet path does not contain '/cart'
                                             * if the requested view is not cart
                                             * if the checkout view is returned with order failure message flagged
                                             * if the checkout view is returned with server-side validation errors detected
                                        
                                             <c:if test="${!empty sessionScope.cart}">
                                                 CART EXISTS AND IS NOT NULL
                                             </c:if>
                                                 <BR>
                                             <c:if test="${sessionScope.cart.numberOfItems != 0}">
                                                 NUMBER OF ITEMS IN CART IS NOT 0
                                             </c:if>
                                                 <BR>
                                             <c:if test="${fn:contains(pageContext.request.servletPath,'/checkout')}">
                                                 SERVLET PATH CONTAINS '/checkout'
                                             </c:if>
                                                 <BR>
                                             <c:if test="${requestScope['javax.servlet.forward.servlet_path'] ne '/checkout'}">
                                                 REQUEST IS NOT CHECKOUT
                                             </c:if>
                                                 <BR>
                                             <c:if test="${requestScope.validationErrorFlag ne true}">
                                                 VALIDATION ERROR IS NOT FLAGGED
                                             </c:if>
                                                 <BR>
                                             <c:if test="${requestScope.orderFailureFlag ne true}">
                                                 ORDER FAILURE ERROR IS NOT FLAGGED
                                             </c:if> --%>

                                        <c:if test="${!empty cart && cart.numberOfItems != 0 &&

                                                      !fn:contains(pageContext.request.servletPath,'/checkout') &&
                                                      requestScope['javax.servlet.forward.servlet_path'] ne '/checkout' &&

                                                      !fn:contains(pageContext.request.servletPath,'/cart') &&
                                                      requestScope['javax.servlet.forward.servlet_path'] ne '/cart' &&

                                                      validationErrorFlag ne true &&
                                                      orderFailureFlag ne true}">

                                              <a href="<c:url value='checkout'/>" class="bubble">
                                                  proceed to checkout &#x279f;
                                              </a>
                                        </c:if>
                                    </div>

                                    <%-- shopping cart widget --%>
                                    <div class="headerWidget" id="viewCart">

                                        <img src="/ShopperSquare/img/cart.gif" alt="shopping cart icon" id="cart">

                                        <%-- If 'numberOfItems' property doesn't exist, or if number of items
                                             in cart is 0, output '0', otherwise output 'numberOfItems' --%>
                                        <span class="horizontalMargin">
                                            <c:choose>
                                                <c:when test="${cart.numberOfItems == null}">
                                                    0
                                                </c:when>
                                                <c:otherwise>
                                                    ${cart.numberOfItems}
                                                </c:otherwise>
                                            </c:choose>

                                            <%-- Handle singular/plural forms of 'item' --%>
                                            <c:choose>
                                                <c:when test="${cart.numberOfItems == 1}">
                                                    item
                                                </c:when>
                                                <c:when test="${cart.numberOfItems == 2 ||
                                                                cart.numberOfItems == 3 ||
                                                                cart.numberOfItems == 4}">
                                                        items
                                                </c:when>
                                                <c:otherwise>
                                                    items
                                                </c:otherwise>
                                            </c:choose>
                                        </span>

                                        <c:if test="${!empty cart && cart.numberOfItems != 0 &&

                                                      !fn:contains(pageContext.request.servletPath,'/cart') &&
                                                      requestScope['javax.servlet.forward.servlet_path'] ne '/cart'}">

                                              <a href="<c:url value='viewCart'/>" class="bubble">
                                                  view cart
                                              </a>
                                        </c:if>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!--<div class="product_list_header">  
                    <c:if test="${!empty cart && cart.numberOfItems != 0 &&

                                  !fn:contains(pageContext.request.servletPath,'/checkout') &&
                                  requestScope['javax.servlet.forward.servlet_path'] ne '/checkout' &&

                                  !fn:contains(pageContext.request.servletPath,'/cart') &&
                                  requestScope['javax.servlet.forward.servlet_path'] ne '/cart' &&

                                  validationErrorFlag ne true &&
                                  orderFailureFlag ne true}"> 
                                              
                         <a href="<c:url value='checkout'/>" class="bubble">
                        proceed to checkout &#x279f;
                      </a>
                    </c:if>
                  
                        </div>-->
                    <div class="clearfix"> </div>
                </div>

                </li>
                </ul>

            </div>

            <div class="logo_products">
                <div class="container">
                    <div class="w3ls_logo_products_left1">
                        <ul class="phone_email">
                            <li><i class="fa fa-phone" aria-hidden="true"></i>Order online or call us : (+0123) 234 567</li>

                        </ul>
                    </div>
                    <div class="w3ls_logo_products_left">
                        <h1><a href="index.jsp">Shopper Square</a></h1>
                    </div>
                    <div class="w3l_search">
                        <form action="#" method="post">
                            <input type="search" name="Search" placeholder="Search for a Product..." required="">
                            <button type="submit" class="btn btn-default search" aria-label="Left Align">
                                <i class="fa fa-search" aria-hidden="true"> </i>
                            </button>
                            <div class="clearfix"></div>
                        </form>
                    </div>

                    <div class="clearfix"> </div>
                </div>
            </div>


            <!-- //header -->

            <!-- breadcrumbs -->
            <div class="breadcrumbs">
                <div class="container">
                    <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                        <li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
                        <li class="active">Signin Page</li>
                    </ol>
                </div>
            </div>
            <!-- //breadcrumbs -->
            <!-- login -->
            <div class="login">

                <div class="container">
                    <h2>Login Form</h2>

                    <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">

                        <form method="post" action="login.jsp">
                            <%
                                 String login_msg = (String) request.getAttribute("error");
                                 if (login_msg != null) {%>
                            <div class="clearfix"></div>
                            <span class="alert alert-danger col-md-12"><%=login_msg%></span>
                            <% }
                            %>
                            
                            <%
                                        String signup_msg = (String) request.getAttribute("success");
                                        if (signup_msg != null) {%>
                            <div class="clearfix"></div>
                            <span class="alert alert-success col-md-12"><%=signup_msg%></span>
                            <% }
                            %>
                            <input type="text" name="uname" placeholder="User Name" required=" " >
                            <input type="password" name="pass" placeholder="Password" required=" " >

                            <input type="submit" value="Login">
                        </form>
                    </div>
                    <h4>For New People</h4>
                    <p><a href="signup.jsp">Register Here</a> (Or) go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
                </div>
            </div>
            <!-- //login -->
            <!-- //footer -->
            <div class="footer">
                <div class="container">
                    <div class="w3_footer_grids">
                        <div class="col-md-3 w3_footer_grid">
                            <h3>Contact</h3>

                            <ul class="address">
                                <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>1234k Avenue, 4th block, <span>New York City.</span></li>
                                <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">info@example.com</a></li>
                                <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
                            </ul>
                        </div>
                        <div class="col-md-3 w3_footer_grid">
                            <h3>Information</h3>
                            <ul class="info"> 
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="about.html">About Us</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="contact.html">Contact Us</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="short-codes.html">Short Codes</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="faq.html">FAQ's</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="products.html">Special Products</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 w3_footer_grid">
                            <h3>Category</h3>
                            <ul class="info"> 
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="groceries.html">Groceries</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="household.html">Household</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="personalcare.html">Personal Care</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="packagedfoods.html">Packaged Foods</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="beverages.html">Beverages</a></li>
                            </ul>
                        </div>
                        <div class="col-md-3 w3_footer_grid">
                            <h3>Profile</h3>
                            <ul class="info"> 
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="products.html">Store</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="checkout.html">My Cart</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="signin.jsp">Login</a></li>
                                <li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="signup.jsp">Create Account</a></li>
                            </ul>


                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>

                <div class="footer-copy">

                    <div class="container">
                        <p>© 2017 Super Market. All rights reserved | Design by Rajkumar</p>
                    </div>
                </div>

            </div>	
            <div class="footer-botm">
                <div class="container">
                    <div class="w3layouts-foot">
                        <ul>
                            <li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                            <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                            <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                    <div class="payment-w3ls">	
                        <img src="images/card.png" alt=" " class="img-responsive">
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- //footer -->	
            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>
            <!-- top-header and slider -->
            <!-- here stars scrolling icon -->
            <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
            </script>
            <!-- //here ends scrolling icon -->
            <script src="js/minicart.min.js"></script>
            <script>
            // Mini Cart
            paypal.minicart.render({
                action: '#'
            });

            if (~window.location.search.indexOf('reset=true')) {
                paypal.minicart.reset();
            }
            </script>
            <!-- main slider-banner -->
            <script src="js/skdslider.min.js"></script>
            <link href="css/skdslider.css" rel="stylesheet">
            <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery('#demo1').skdslider({'delay': 5000, 'animationSpeed': 2000, 'showNextPrev': true, 'showPlayButton': true, 'autoSlide': true, 'animationType': 'fading'});

                jQuery('#responsive').change(function () {
                    $('#responsive_wrapper').width(jQuery(this).val());
                });

            });
            </script>	
            <!-- //main slider-banner --> 

    </body>
</html>