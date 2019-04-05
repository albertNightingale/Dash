<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Order Success</title>
    
    <%
    	Client client = (Client)(session.getAttribute("client"));
    	client.placeOrder(session.getAttribute("shipment-type").toString()); 
		System.out.println("Number 1: " + client.getcustomer().getOrders().get_element(1));  	
		System.out.println("Number 2: " + client.getcustomer().getOrders().get_element(2));  	
    %>
    
    <%!
    	public void removeorder()
    	{
	    	User.removedata("p", User.getorders().get_element(User.getorders().get_size()));  	
    	}
    %>
 </head>

 <body>
    <div class="background">
		<div class="back-to-homepage">
			<img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
		</div>

		<div class="order-confirmation">
			<h1>Success! Your Order has been placed!</h1>
			<br>
		</div>

		<div class="cancel-order">
			<button type="button" name="button" onclick="removeorder()">Cancel Your Order</button>
		</div>
      
		<div class="back-to-homepage">
			<form action="Homepage.jsp" method="post">
				<input type="submit" name="return-to-homepage" value="return to homepage">
			</form>
		</div>
	</div>
</body>
</html>
