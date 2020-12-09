<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>Custom Login Page</title>

<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
}
</style>
</head>
<body onload='document.loginForm.j_username.focus();'>
	<h3>Custom Login Page</h3>

	<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
		}
	%>

	<form name='loginForm' action="<c:url value='login' />" method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td><input name="submit" type="submit" value="submit" /></td>
				<td><input name="reset" type="reset" /></td>
			</tr>
		</table>

	</form>
</body>
</html> --%>



<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	font-size:16px;
}
</style>
<body onload='document.loginForm.j_username.focus();'>

<div class="user">
<%
		String errorString = (String) request.getAttribute("error");
		if (errorString != null && errorString.trim().equals("true")) {
			out.println("<span class=\"errorblock\">Incorrect login name or password. Please try again");
		}
	%>
    <header class="user__header">
       
        <h1 class="user__title">Enter the Login Credentials</h1>
    </header>
    
    
	
    <form class="form" method="post" name="loginForm" action="<c:url value='login' />" >
    
    	
        <div class="form__group">
            <input type="text" placeholder="Username" name="username" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="password" placeholder="Password"   name="password" class="form__input"  maxlength="50" />
        </div>
       
        
        
        <button class="btn" type="submit">Login</button>
    </form>
</div>


</body>
</html>