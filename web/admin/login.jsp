<%--
 * Copyright (c) 2010, Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software
 * except in compliance with the terms of the license at:
 * http://developer.sun.com/berkeley_license.html

 * author: Rajkumar
--%>


<!-- login -->
	<div class="login">
		<div class="container">
			<h2>Admin Login</h2>
		
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				<form method="post" action="<c:url value='j_security_check'/>">
					<input type="text" name="j_username" placeholder="User Name" required=" " >
					<input type="password" name="j_password" placeholder="Password" required=" " >
					
					<input type="submit" value="Login">
				</form>
			</div>
			<h4>If you don't belong here</h4>
			<p>go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div>
	</div>
<!-- //login -->