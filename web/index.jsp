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

<c:set var='view' value='/index' scope='session' />


<%-- HTML markup starts below --%>
<!-- main-slider -->
		<ul id="demo1">
			<li>
				<img src="img/11.jpg" alt="" />
				<!--Slider Description example-->
				<div class="slide-desc">
					<h3>Buy Rice Products Are Now On Line With Us</h3>
				</div>
			</li>
			<li>
				<img src="img/22.jpg" alt="" />
				  <div class="slide-desc">
					<h3>Whole Spices Products Are Now On Line With Us</h3>
				</div>
			</li>
			
			<li>
				<img src="img/44.jpg" alt="" />
				<div class="slide-desc">
					<h3>Whole Spices Products Are Now On Line With Us</h3>
				</div>
			</li>
		</ul>
	<!-- //main-slider -->
        <div class="custom">



   
<c:forEach var="category" items="${categories}">
<div class="view view-third">
                     <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${category.name}" />
                    <div class="mask">
                        <h2>${category.name}</h2>
                        <p>${category.description}</p>
                        <a class="info" href="<c:url value='category?${category.id}' />">Shop Now</a>
                    </div>
                </div>
				</c:forEach>
				

        </div>