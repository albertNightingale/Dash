<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%
	  	Client client = (Client)(session.getAttribute("client")); 
    	double totalprice = 0.0; 
    %>
    
    <%!
    	public String getshiptype(HttpServletRequest request)
    	{
    		String shiptype = request.getParameter("shipment-type");
    		    		
    		if (shiptype == null)
    			return "Rush Shipping: Ship in 5 days ------------------ $ 2.99"; 
    		else if (shiptype.equals("Overnight Shipping: $ 4.99"))
    			return "Overnight Shipping: Ship in 1 days ------------------ $ 4.99"; 
    		else if (shiptype.equals("Rush Shipping: $ 2.99"))
    			return "Rush Shipping: Ship in 5 days ------------------ $ 2.99"; 
    		else
    			return "Standard Shipping: Ship in 10 days ------------------ $ 1.99"; 
    	}
    %>
	
	</head>
	
	
	<body>
		<div class="background">
			<div class="back-to-homepage">
				<img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
			</div>
	      	
	      	<div class="check-out-2">
        		<h3 id="Order Summary">Order Summary</h3>
        		<br>
        		<form action="OrderSuccess.jsp" method="post">
					<%
						double price = 0; 
						for (int i = 0; i < client.getshoppingcart().size(); i ++) {
							price = client.getquantities().get(i)*client.getshoppingcart().get(i).getUnitPrice();
							out.write("Item: " + client.getshoppingcart().get(i).getName() + " Quantity: " + client.getquantities().get(i) + 
							" Price: $" + client.getshoppingcart().get(i).getUnitPrice() + " Total price: $" + price + "<br>"); 
							totalprice += price; 
						}
						
	            		String output = getshiptype(request);
	            		session.setAttribute("shipment-type", output);
						if (output.contains("2.99"))
							totalprice += 2.99;
						else if (output.contains("4.99"))
							totalprice += 4.99;
						else
							totalprice += 1.99;
					%>
		            <br>
	            	Shipping: <%= output %>
	            	<%System.out.println("Price after shipment cost: " + totalprice); %>
	            	<br>
	           		Tax: $ <%= totalprice * 0.09 %>
	            	<br>
	            	_____________________________________________________________
	            	<br>
	            	<%
	            		totalprice *= 1.09; 
	            		session.setAttribute("order-total-price", totalprice);	
	            	%>
					Order Total: <%= totalprice %>
					
	            	<input type="submit" name="place order" value="Place Your Order">
        		</form>
      		</div>
		</div>
	</body>
</html>