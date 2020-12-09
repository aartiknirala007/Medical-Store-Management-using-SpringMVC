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
<jsp:include page="navbar.jsp" />
<form action="/dbms/inventory/viewstock" method="post">
<p> Medicine Name : <input type="text" name ="name" value="${name}"> </p>
<input type="submit" value="submit" />
</form>

<c:forEach items="${med}" var="med" varStatus = "loop">
				<a href="/dbms/inventory/viewmedicine/${med.getName()}">${med.getName()}</a><br>
				
							</c:forEach>
</body>
</html> 



 --%>
 
 
 


<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar.jsp" />
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
	<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Click on medicine for detail</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/inventory/viewstock" >
        <div class="form__group">
            <input type="text" placeholder="Medicine Name" name="name" class="form__input" required maxlength="50"/>
        </div>
        
        
        <button class="btn" type="submit">Submit</button>
    </form>
</div>
					<div class="table">

						<div class="row header">
							<div class="cell">
								Medicine Name
							</div>
							
							
						</div>
						<c:forEach items="${med}" var="med" varStatus = "loop">
						<div class="row">
							<div class="cell" data-title="Name">
								<a href="/dbms/inventory/viewmedicine/${med.getName()}">${med.getName()}</a>
							
							</div>
						</div>
						</c:forEach>

					</div>
			</div>
		</div>
	


	



</body>
</html>