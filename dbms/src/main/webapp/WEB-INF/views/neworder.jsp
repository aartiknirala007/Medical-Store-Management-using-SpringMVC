
	
	
	
	
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar1.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter the details for new stock</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/reception/neworder" >
    
     <div class="form__group">
			<select name ="customer" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the customer</option>
				<c:forEach items="${customer}" var="cust" varStatus = "loop">
					<option value="${cust.getCustomer_id()}">${cust.getName()} (${cust.getCustomer_id()})</option>
				</c:forEach>
			</select>
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
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	