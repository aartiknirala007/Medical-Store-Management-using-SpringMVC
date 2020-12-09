<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
<jsp:include page="navbar1.jsp" />
  
    
 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h1>
            Welcome : ${user} to Kajal Medical Store 
                
        </h1>
    </c:if>
    <h1>You can perform all the work of the Reception here</h1>
    
 
  
</body>
</html>