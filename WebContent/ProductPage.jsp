<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Product Profile</title>
    
    <%
		Product product = (Product)(session.getAttribute("Product-To-Be-Searched"));
 		session.setAttribute("product-being-opened", product);  
	%>     
	
  </head>

  <body>
    <div class="background">
		<div class="back-to-homepage">
			<a href="Homepage.jsp">
				<img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
			</a>
		</div>
	
		<div class="product-image">
			<img src="photos/Unavailable.png" alt="">      <!-- image of the product-->
		</div>
	      
		<div class="product-description">
 	
	        Product Name: <%=product.getName()%>          Manufacturer: <%=product.getManufacturer()%>
	        <br>
	        Product ID: <%=product.getProductId()%>
	        <br>
	        Price: <%=product.getUnitPrice()%>
	        <br>
	        Description: <%=product.getDescription()%> 
		</div>
	
		<div class="shopping-cart">
			<form class="put-in-shopping-cart" action="ShoppingCart.jsp" method="post">
				Quantity: <input type="text" name="quantity" value="">
				<input type="submit" name="put-shopping-cart" value="Place-In-Shopping-Cart">
			</form>
		</div>
	</div>
  </body>
</html>
