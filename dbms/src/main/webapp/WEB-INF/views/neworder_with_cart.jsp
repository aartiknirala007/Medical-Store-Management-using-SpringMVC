<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach items="${cartofuser}" var="cart" >
<p>${cart.getMedicine_name()}     ${cart.getQuantity()}</p>
</c:forEach>


	<form:form method="post" modelAttribute="cart1" action="/dbms/reception/neworder">
		<table>
		
		
		<tr><td>
		Customer : ${customer}</td><td>
		<form:input  type="hidden" path="customer" value="${customer}" />  
		</tr>
		
		
		<tr><td>
		Medicine's Name</td>
		<td><form:select path="medicine_name">
			<c:forEach items="${medicine}" var="med" >
				<form:option value="${med.getName()}" >${med.getName()}</form:option>
			</c:forEach>
		</form:select></td>
		</tr>
		
		
		
		<tr><td>
		Quantity</td><td>
		<form:input path="quantity" type="int" /> </td><!-- bind to user.name-->
		<td><form:errors path="quantity" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form>
	<a href="/dbms/reception/delete_cart">Click here to empty the cart</a>
	<a href="/dbms/reception/order">Click here to place the order</a>
	
	
	 --%>
	 
	 
	 
	 
	 
	 
	 
	
	
	
<%-- 	
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar1.jsp" />
<c:forEach items="${cartofuser}" var="cart" >
<p >${cart.getMedicine_name()}     ${cart.getQuantity()}</p>
</c:forEach>

<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter the details for new stock</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/reception/neworder" >
    
   		 <div class="form__group">
            <input   name="customer" class="form__input" value="${customer}" readonly/>
        </div>
        
         <div class="form__group">
			<select name ="medicine_name" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the medicine</option>
				<c:forEach items="${medicine}" var="sell" varStatus = "loop">
					<option value="${sell.getName()}" >${sell.getName()}</option>
				</c:forEach>
			</select>
        </div>
        
        
         <div class="form__group">
            <input type="number" placeholder="Quantity" name="quantity" class="form__input" required  min="0" max="10000000000"/>
        </div>
        
       
        
       
        
        <button class="btn" type="submit">Add to stock</button>
    </form>
</div>
<div class="user">
<a href="/dbms/reception/delete_cart" class="btn" >Click here to empty the cart</a>
	<a href="/dbms/reception/order" class="btn">Click here to place the order</a>
</div>
<h2 class="error"> ${error} </h2>
</body>
</html> --%>
	
	
	
	<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar1.jsp" />
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
	<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
	
	
	
		<div class="container-table100">
			
			<div class="wrap-table100">
	
					<div class="table">

						<div class="row header">
							<div class="cell">
								Medicine Name
							</div>
							<div class="cell">
								Batch Number
							</div>
							<div class="cell">
								Quantity
							</div>
							<div class="cell">
								Available
							</div>
							
							
						</div>
						<c:forEach items="${cartofuser}" var="med" varStatus="loop">
						<div class="row">
							<div class="cell" data-title="Medicine Name">
								${med.getMedicine_name()}
							</div>
							<div class="cell" data-title="Batch Number">
								${med.getBatch_number()}
							</div>
							<div class="cell" data-title="Quantity">
								${med.getQuantity()}
							</div>
							<div class="cell" data-title="Available">
								${med.getAvailable()}
							</div>
						</div>
						</c:forEach>

					</div>
					<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter the details for new stock</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/reception/neworder" >
    
   		 <div class="form__group">
            <input   name="customer" class="form__input" value="${customer}" readonly/>
        </div>
        
         <div class="form__group">
			<select name ="medicine_name" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the medicine</option>
				<c:forEach items="${medicine}" var="sell" varStatus = "loop">
					<option value="${sell.getName()}" >${sell.getName()}</option>
				</c:forEach>
			</select>
        </div>
        
        
         <div class="form__group">
            <input type="number" placeholder="Quantity" name="quantity" class="form__input" required  min="0" max="10000000000"/>
        </div>
        
       
        
       
        
        <button class="btn" type="submit">Add to cart</button>
    </form>
    <h2 class="error"> ${error} </h2>
</div>
<div class="user">
<a href="/dbms/reception/delete_cart" class="btn" >Click here to empty the cart</a>
	<a href="/dbms/reception/order" class="btn">Click here to place the order</a>
</div>
			</div>
		</div>
	


	



</body>
</html>
	
	