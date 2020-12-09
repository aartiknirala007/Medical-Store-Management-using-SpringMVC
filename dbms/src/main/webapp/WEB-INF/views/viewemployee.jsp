<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar2.jsp" />
<head>
	<title>Table V02</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->

	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
<!--===============================================================================================-->
</head>

<body>
	
	
	<div >
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								Full Name
							</div>
							<div class="cell">
								Joining Date
							</div>
							<div class="cell">
								Username
							</div>
							<div class="cell">
								Address
							</div>
							<div class="cell">
								Salary
							</div>
							<div class="cell">
								Contact
							</div>
							
							
						</div>
						<c:forEach items="${employee}" var="emp" varStatus = "loop">
						<div class="row">
							<div class="cell" data-title="Full Name">
								${emp.getName()}
							</div>
							<div class="cell" data-title="Joining Date">
								${emp.getJoining_date()}
							</div>
							<div class="cell" data-title="Username">
								${emp.getUsername()}
							</div>
							<div class="cell" data-title="Address">
								${emp.getAddress()}
							</div>
							<div class="cell" data-title="Salary">
								${emp.getSalary()}
							</div>
							<div class="cell" data-title="Contact">
								${emp.getMail()}
							</div>
						</div>
						</c:forEach>

					</div>
			</div>
		</div>
	</div>


	



</body>
</html>