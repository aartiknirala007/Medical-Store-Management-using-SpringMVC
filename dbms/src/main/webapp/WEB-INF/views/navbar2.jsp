<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/dbms/admin/">Home</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="/dbms/admin/newemployee">Employee</a></li>
       <li><a href="/dbms/admin/viewemployee">View Employee</a></li>
      <li><a href="/dbms/reception/">Reception</a></li>
      <li><a href="/dbms/inventory/">Inventory</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/j_spring_security_logout" />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
  
<div class="container">
  
</div>

</body>
</html>