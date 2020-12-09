<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter details for the new medicine</h1>
    </header>
    
    <form class="form" method="post" action="newmedicine" >
        <div class="form__group">
            <input type="text" placeholder="Medicine Name" name="name" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Company"   name="company" class="form__input" required maxlength="50" />
        </div>
        
        <div class="form__group">
            <input type="text" placeholder="Additional information" name="detail" class="form__input" maxlength="50"/>
        </div>
        
         
        
        <button class="btn" type="submit">Register</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	