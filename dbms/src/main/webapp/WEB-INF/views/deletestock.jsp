<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 
<html>
<body>
<jsp:include page="navbar.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Select the batch to be deleted</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/inventory/deletestock" >
    
    	
    	 <div class="form__group">
			<select name ="batch_number" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the batch number from the list</option>
				<c:forEach items="${batch}" var="sell" varStatus = "loop">
					<option value="${sell.getBatch_number()}" >${sell.getBatch_number()}</option>
				</c:forEach>
			</select>
        </div>
        
       
        
        
        <button class="btn" type="submit">Delete</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	