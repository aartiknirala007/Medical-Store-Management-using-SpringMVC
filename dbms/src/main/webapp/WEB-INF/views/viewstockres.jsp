


<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar.jsp" />
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
</head>

<body>
	
	
	
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Name
							</div>
							<div class="cell">
								Batch Number
							</div>
							<div class="cell">
								Inventory Manager
							</div>
							<div class="cell">
								Expiry
							</div>
							<div class="cell">
								Quantity
							</div>
							
							<div class="cell">
								MRP
							</div>
							<div class="cell">
								Cost
							</div>
							
						</div>
						<c:forEach items="${med}" var="emp" varStatus = "loop">
						<div class="row">
							<div class="cell" data-title="Name">
								${emp.getName()}
							</div>
							<div class="cell" data-title="Batch Number">
								${emp.getBatch_number()}
							</div>
							<div class="cell" data-title="Inventory Manager">
								${emp.getManager()}
							</div>
							<div class="cell" data-title="Expiry">
								${emp.getExpiry()}
							</div>
							<div class="cell" data-title="Quantity">
								${emp.getQuantity()}
							</div>
							<div class="cell" data-title="MRP">
								${emp.getPrice()}
							</div>
							<div class="cell" data-title="Cost">
								${emp.getCost()}
							</div>
						</div>
						</c:forEach>

					</div>
			</div>
		</div>
	</div>


	



</body>
</html>