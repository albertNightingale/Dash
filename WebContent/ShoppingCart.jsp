<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Shopping Cart</title>
  	    
  	    <% 
  	    	Client client = (Client)(session.getAttribute("client")); 
  	    %>
  	    
  </head>
  
  <body>
	<div class="background">
		<div class="top-divisions">
			<div class="back-to-homepage"> <!--     Division 1       -->
				<a href="Homepage.jsp">
					<img id="logo" src="photos/logo-icon.png" alt="photos/Unavailable.png" width="50" height="50"> <!-- image of homepage-->
				</a>
			</div>

			<div class="shopping-cart-directory"> <!--       Division 2        -->
				<a href="ShoppingCart.jsp">
					<img id="cart" src="photos/Shoppingcart.png" alt="photos/Unavailable.png" width="50" height="50">
				</a>
			</div>

			<div class="past-orders-directory"> <!--       Division 3        -->
				<a href="PastOrder.jsp">
					<img id="past-order" src="photos/Pastorders.png" alt="photos/Unavailable.png" width="50" height="50">
				</a>
			</div>
		</div>

		<div class="shopping-cart">
        <%
        		
        	Product p = null; 
        	int q = 0; 
        	        	
        	if ((request.getParameter("quantity") != null && !request.getParameter("quantity").equals("")) && session.getAttribute("product-being-opened")!= null) 
        	{
	        	p = (Product)(session.getAttribute("product-being-opened")); 
	        	q = Integer.parseInt(request.getParameter("quantity")); 
        	}
        	else if (session.getAttribute("product-being-opened")!= null) 
        	{   // the most recent searched product being added
	        	p = (Product)(session.getAttribute("product-being-opened"));    
        	} 
        
        	// System.out.println("p: " + p.getName() + "q: " + q); 
			if (client.isloggedin())
				if (p != null && q >= 1)
				{
					client.addtoshoppingcart(p, q); 
				}	
				else
					try { out.write("<h1>You have not added anything to your shopping cart yet. </h1>"); } 
					catch(Exception e){}
			else
				try {
					out.write("<h1>You need to Log in Before you go to shopping cart</h1>");
					out.write("<h1>You may go back to the homepage and log in again</h1>");
				} catch(Exception e){}
			
        
		    for (int i = 0; i < client.getshoppingcart().size(); i ++)
			{
		        out.write(
					"<div class=\"product-in-list\">" +
						"<div class=\"image-area\">" +
							"<img src=\"photos/Unavailable.png\" alt=\"\">" +
						"</div>" +
						"<div class=\"productprofile\">" + 
							"<a href=\"ProductPage.jsp\"> " + client.getshoppingcart().get(i).getName() + " </a>" +
							"<p>" + "Product ID: " + client.getshoppingcart().get(i).getProductId() + "</p>" + 
							"<p>" + "Product Unit Price: " + client.getshoppingcart().get(i).getUnitPrice() + "</p>" + 
							"<p>" + "Product manufactorers: " + client.getshoppingcart().get(i).getManufacturer() + "</p>" + 
							"<p>" + "Quantities: " + client.getquantities().get(i) + "</p>" + 
						"</div>" +
					"</div>");
			}
        %>
	        <button id="check-out" type="button" name="button">Check Out</button>
	        <script type="text/javascript">
	          document.getElementById("check-out").addEventListener("click", function(){
	            window.location.href = "CheckOut1.jsp";
	          });
	        </script>
		</div>
	</div>
</body>

</html>
