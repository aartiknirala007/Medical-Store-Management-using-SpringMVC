<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<form:form method="post" modelAttribute="user" action="newcustomer">
		<table><tr><td>
		Customer_id</td><td>
		<form:input path="customer_id" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="customer_id" /></td></tr>
		
		<tr><td>
		Customer Name</td><td>
		<form:input path="name" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="name" /></td></tr>
		
		<tr><td> Customer Type</td>
		<td>
		<form:input path="type" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="type" /></td></tr>
		
		<tr><td>Date of birth</td>
		<td>
		<form:input path="dob" type="date" /> </td><!-- bind to user.name-->
		<td><form:errors path="dob" /></td></tr>
		
		<tr><td>Address</td>
		<td>
		<form:input path="address" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="address" /></td></tr>
		
		<tr><td>Date of birth</td>
		<td>
		<form:input path="phone" type="long" /> </td><!-- bind to user.name-->
		<td><form:errors path="phone" /></td></tr>
		
		<tr><td>Additional Detail</td>
		<td>
		<form:input path="detail" type="text" /> </td><!-- bind to user.name-->
		<td><form:errors path="detail" /></td></tr>
		
		<tr>
			<td></td>
			<td><input type="submit" value="Submit" /></td>
			</tr>
		<tr><td>${error}</td></tr>
		</table>
	</form:form> --%>
	
	
	
	
	
	
	
	
	
	
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar1.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter details for the new customer</h1>
    </header>
    
    <form class="form" method="post" action="newcustomer" >
        <div class="form__group">
            <input type="text" placeholder="Customer Id" name="customer_id" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Customer Name"   name="name" class="form__input" required maxlength="50" />
        </div>
        
          <div class="form__group">
        	<input placeholder="Date of Birth" class="form__input" type="text" onfocus="(this.type='date')" required  name="dob"> 
        </div>
        
         <div class="form__group">
            <input type="text" placeholder="Address"   name="address" class="form__input"  maxlength="50" />
        </div>
        
        <div class="form__group">
            <input type="number" placeholder="Phone number" name="phone" class="form__input" required min="0" max="100000000000"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Additional Detail" name="detail" class="form__input" maxlength="50"/>
        </div>
        
         
        
        <button class="btn" type="submit">Register</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	