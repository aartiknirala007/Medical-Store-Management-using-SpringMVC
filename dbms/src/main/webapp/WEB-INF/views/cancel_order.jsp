<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/dbms/reception/cancel_order" method="post">
<p> Order_id : <input type="number" name ="name"> </p>
<input type="submit" value="submit" />
</form>


</body>
</html> --%>



<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar1.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter the Order Id to be deleted</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/reception/cancel_order" >
        <div class="form__group">
            <input type="number" placeholder="Order Id" name="name" class="form__input" required maxlength="50"/>
        </div>
       
        
         
        
        <button class="btn" type="submit">Submit</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	