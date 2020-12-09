
	
	
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>

<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Update the details</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/update_profile" >
        <div class="form__group">
            <input type="text" value="${username}" name="username" class="form__input" readonly required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" value="${user.getName()}" name="name" class="form__input" required maxlength="50"/>
        </div>
        
       
     	
        
         <div class="form__group">
            <input type="number" value="${user.getSalary()}" name="salary" class="form__input" required min="0" max="10000000000"/>
        </div>
        
        <div class="form__group">
        	<input value="${user.getJoining_date()}" class="form__input" type="text" onfocus="(this.type='date')"  required  name="joining_date"> 
        </div>
        
        <div class="form__group">
            <input type="text" value="${user.getAddress()}" name="address" class="form__input"  maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" value="${user.getMail()}" name="mail" class="form__input"  maxlength="50"/>
        </div>
        
       
        
        <button class="btn" type="submit">Update</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	