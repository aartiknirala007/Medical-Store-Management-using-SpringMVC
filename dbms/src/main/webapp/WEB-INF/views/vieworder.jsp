<!DOCTYPE html>
<html lang="en">
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <jsp:include page="navbar1.jsp" />
<head>
	<title></title>
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
       
        <h1 class="user__title">Click on Order Id for detail</h1>
    </header>
    
    <form class="form" method="post" action="/dbms/reception/vieworder" >
        <div class="form__group">
            <input type="text" placeholder="Search by Order Id" name="name" class="form__input"  maxlength="50"/>
        </div>
        <div class="form__group">
            <input type="text" placeholder="Search by Customer Id" name="name1" class="form__input"  maxlength="50"/>
        </div>
        <div class="form__group">
            <input type="text" placeholder="Search by Reception Manager" name="name2" class="form__input"  maxlength="50"/>
        </div>
        
        
        <button class="btn" type="submit">Submit</button>
    </form>
</div>
					<div class="table">

						<div class="row header">
							<div class="cell">
								Order Id
							</div>
							<div class="cell">
								Order Date
							</div>
							<div class="cell">
								Customer Id
							</div>
							<div class="cell">
								Reception Manager
							</div>
							<div class="cell">
								Amount
							</div>
							<div class="cell">
								Cancelled
							</div>
							
							
						</div>
						<c:forEach items="${med}" var="med" varStatus = "loop">
						<div class="row">
							<div class="cell" data-title="Order Id">
								<a href="/dbms/reception/vieworder/${med.getOrder_id()}">${med.getOrder_id()}</a>
							
							</div>
							<div class="cell" data-title="Order Date">
								${med.getOrder_date()}
							
							</div>
							<div class="cell" data-title="Customer Id">
								${med.getCustomer_id()}
							
							</div>
							<div class="cell" data-title="Reception Manager">
								${med.getReception()}
							
							</div>
							<div class="cell" data-title="Amount">
								${med.getAmount()}
							
							</div>
							<div class="cell" data-title="Cancelled">
								${med.getCancelled()}
							
							</div>
							
							
						</div>
						</c:forEach>

					</div>
			</div>
		</div>
	


	



</body>
</html>