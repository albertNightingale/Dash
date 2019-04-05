<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  	<meta charset="utf-8">
    <title>Check Out Page</title>
  </head>

  <body>
    <div class="background">
		<div class="back-to-homepage">
			<img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
		</div>

		<br>
		<div class="check-out-1">
			<div class="user-information-confirmation">
				<span>1. User Information</span>
				<br>
				<form method="post">
					Name: 
					<br>
					<input type="text" name="full name" value="">
            		<br>
            		Address: 
            		<br>
            		<input type="text" name="address" value="">
            		<br>
          		</form>
        	</div>

        	<div class="payment-method">
          		<span>2. Payment Method</span>
          		<br>
          		<form method="post">
            		Card Number: 
            		<br>
            		<input type="text" name="card number" value="Card Number">
          		</form>
        	</div>

	        <div class="shipping">
	          <span>3. Shipping</span>
	          <br>
	          <form action="CheckOut2.jsp" method="post">
	            <input type="radio" name="shipment-type" value="Overnight Shipping: $ 4.99"> Overnight Shipping: $4.99
	            <br>
	            <input type="radio" name="shipment-type" value="Rush Shipping: $ 2.99"> Rush Shipping: $2.99
	            <br>
	            <input type="radio" name="shipment-type" value="Standard Shipping: $ 1.99"> Standard Shipping: $1.99
	            <br>
	            <input type="submit" name="next-page" value="Next">
	          </form>
	        </div>
		</div>
    </div>
  </body>
</html>
