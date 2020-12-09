<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter details for the new seller</h1>
    </header>
    
    <form class="form" method="post" action="newseller" >
        <div class="form__group">
            <input type="text" placeholder="Name" name="name" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Registration number"   name="regno" class="form__input" required maxlength="50" />
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Location" name="location" class="form__input" maxlength="50"/>
        </div>
        
         <div class="form__group">
            <input type="number" placeholder="Phone number" name="phone_number" class="form__input"  max="10000000000"/>
        </div>
        
        <button class="btn" type="submit">Register</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
