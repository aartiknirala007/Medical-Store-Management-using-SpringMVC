<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html lang="en">
	
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/dbms/inventory/">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="/dbms/inventory/newseller">Seller</a></li>
       <li><a href="/dbms/inventory/newmedicine">Medicine</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Stock<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/dbms/inventory/newstock">New Stock</a></li>
          <li><a href="/dbms/inventory/updatestock">Update stock</a></li>
          <li><a href="/dbms/inventory/deletestock">Delete Stock</a></li>
        </ul>
      </li>
      <li><a href="/dbms/inventory/outofstock">Expired Medicine</a></li>
      <li><a href="/dbms/inventory/viewstock">View stock</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  


</body>
</html>