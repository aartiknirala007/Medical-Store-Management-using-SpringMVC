	
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar2.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter details for the new employee</h1>
    </header>
    
    <form class="form" method="post" action="newemployee" >
        <div class="form__group">
            <input type="text" placeholder="Username" name="username" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Employee Name" name="name" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="password" placeholder="Password"   name="password" class="form__input" required maxlength="50" />
        </div>
        
        <div class="form__group">
            <input type="password" placeholder="Confirm Password" name="mpassword" class="form__input" required maxlength="50"/>
        </div>
        
         <div class="form__group">
            <input type="number" placeholder="Salary" name="salary" class="form__input" required min="0" max="10000000000"/>
        </div>
        
        <div class="form__group">
        	<input placeholder="Joining Date" class="form__input" type="text" onfocus="(this.type='date')"  required  name="joining_date"> 
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Address" name="address" class="form__input"  maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Contact Details" name="mail" class="form__input"  maxlength="50"/>
        </div>
        
        <div class="radio__group">
        	<div class="radiobutton">
           <input type="radio"  name="role" value="ROLE_INVENTORY" checked="checked"> Inventory</div>
           <div class="radiobutton"> 
           <input type="radio"  name="role" value="ROLE_RECEPRION"> Reception</div>
        </div>
        
        <button class="btn" type="submit">Register</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	