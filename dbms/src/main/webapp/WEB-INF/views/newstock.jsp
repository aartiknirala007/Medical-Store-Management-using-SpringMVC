	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
 <script>
	$(function() {
		var dates = $( "#textbox1id , #textbox2id" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			minDate : 0,
			maxDate : "+3Y",
			onSelect: function( selectedDate ) {
				var option = this.id == "textbox1id" ? "minDate" : "maxDate",
					instance = $( this ).data( "datepicker" );
					date = $.datepicker.parseDate(
						instance.settings.dateFormat ||
						$.datepicker._defaults.dateFormat,
						selectedDate, instance.settings );
				dates.not( this ).datepicker( "option", option, date );
			}
		});
	});
</script>
<html>
<body>
<jsp:include page="navbar.jsp" />
<div class="user">
    <header class="user__header">
       
        <h1 class="user__title">Enter the details for new stock</h1>
    </header>
    
    <form class="form" method="post" action="newstock" >
        <div class="form__group">
            <input type="text" placeholder="Batch number" name="batch_number" class="form__input" required maxlength="50"/>
        </div>
        
        <div class="form__group">
        	<input placeholder="Expiry Date" class="form__input" type="text" onfocus="(this.type='date')" required   name="expiry"> 
        </div>
        
        <div class="form__group">
            <input type="number" placeholder="Cost price" name="cost" class="form__input" required step="any" min="0" max="100000000"/>
        </div>
        
        <div class="form__group">
            <input type="number" placeholder="MRP" name="price" class="form__input" required step="any" min="0" max="100000000000"/>
        </div>
        
         <div class="form__group">
            <input type="number" placeholder="Quantity" name="quantity" class="form__input" required  min="1" max="10000000000"/>
        </div>
        
        <div class="form__group">
			<select name ="seller_reg" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the seller</option>
				<c:forEach items="${seller}" var="sell" varStatus = "loop">
					<option value="${sell.getRegno()}" >${sell.getName()}</option>
				</c:forEach>
			</select>
        </div>
        
        <div class="form__group">
			<select name ="name" class="form__input" required>
			 	<option  class="form__input" value="" disabled selected>Select the medicine</option>
				<c:forEach items="${medname}" var="sell" varStatus = "loop">
					<option value="${sell.getName()}" >${sell.getName()}</option>
				</c:forEach>
			</select>
        </div>
        
        <button class="btn" type="submit">Add to stock</button>
    </form>
</div>

<h2 class="error"> ${error} </h2>
</body>
</html>
	
	
	
	
	
	