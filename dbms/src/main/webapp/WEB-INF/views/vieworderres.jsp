


<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar1.jsp" />
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
</head>

<body>
	
	
	
		<div class="container-table100">
			<div class="wrap-table100">
			<h2>Order Id : ${user.getOrder_id()} </h2>
			<h2>Order Date : ${user.getOrder_date()} </h2>
			<h2>Order Amount : ${user.getAmount()} </h2>
			<h2>Customer_id : ${user.getCustomer_id()} </h2><br/><br/>
					<div class="table">

						<div class="row header">
							
							<div class="cell">
								Batch Number
							</div>
							
							
							<div class="cell">
								Quantity
							</div>
							
							
							
						</div>
						<c:forEach items="${med}" var="emp" varStatus = "loop">
						<div class="row">
							
							<div class="cell" data-title="Batch Number">
								${emp.getBatch_number()}
							</div>
							
							<div class="cell" data-title="Quantity">
								${emp.getQuantity()}
							</div>
							
						</div>
						</c:forEach>

					</div>
			</div>
		</div>



	



</body>
</html>