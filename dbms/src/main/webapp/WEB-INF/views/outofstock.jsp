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
<h1>Medicine which are out of stock are :-</h1>


		
			<c:forEach items="${med}" var="med" varStatus = "loop">
				
				<p>${med.getName()} ${ med.getExpiry()} ${med.getBatch_number()}  ${med.getQuantity()} }</p>
				
			</c:forEach>
	
		<a href="/dbms/inventory/">Click here to go back to home</a>
		<a href="/dbms/inventory/delete_expired">Click here to delete these stocks</a>
</body>
</html> --%>



<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">



	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
	<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />	

</head>

<body>
	
	<jsp:include page="navbar.jsp" />
	<div >
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Medicine name
							</div>
							<div class="cell">
								Batch Number
							</div>
							<div class="cell">
								Expiry Date
							</div>
							<div class="cell">
								Quantity
							</div>
							
							
						</div>
						<c:forEach items="${med}" var="med" varStatus = "loop">
						<div class="row">
							<div class="cell" data-title="Medicine Name">
								${med.getName()}
							</div>
							<div class="cell" data-title="Batch Number">
								${med.getBatch_number()}
							</div>
							<div class="cell" data-title="Expiry Date">
								${med.getExpiry()}
							</div>
							<div class="cell" data-title="Quantity">
								${med.getQuantity()}
							</div>
							
						</div>
						</c:forEach>
		</div>
			<div class="user">
<a href="/dbms/inventory/delete_expired" class="btn">Click here to delete these stocks</a>
</div>
					</div>
	
		</div>
	</div>

	



</body>
</html>