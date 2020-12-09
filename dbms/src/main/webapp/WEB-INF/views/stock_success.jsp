<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar.jsp" />
<h1> New stock is successfully created</h1>
<p> Seller Name : ${user.batch_number }</p>
<p> Registration number : ${user.name }</p>
<a href="/dbms/inventory" >CLick here to go back to main page</a>
</body>
</html>