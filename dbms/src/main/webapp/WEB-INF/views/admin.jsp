<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
<jsp:include page="navbar2.jsp" />
    
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user}
        </h2>
    </c:if>
    <h1>Welcome to the admin page</h1>
    <h1>You can perform all the work of the admin</h1>
    
</body>
</html>
