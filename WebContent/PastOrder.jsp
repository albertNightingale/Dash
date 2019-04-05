<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Past Order</title>
    <% 
		Client client = (Client)(session.getAttribute("client")); 
		System.out.println("Number 1: " + client.getcustomer().getOrders().get_element(1));  	
		System.out.println("Number 2: " + client.getcustomer().getOrders().get_element(2));  
	%>
  </head>

  <body>
    <div class="background">
      <div class="top-divisions">
        <div class="back-to-homepage"> <!--     Division 1       -->
          <a href="Homepage.jsp">
            <img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
          </a>
        </div>

        <div class="shopping-cart-directory"> <!--       Division 2        -->
          <a href="ShoppingCart.jsp">
            <img id="cart" src="photos/Shoppingcart.png"
            alt="photos/Unavailable.png"
            width="50" height="50">
          </a>
        </div>

        <div class="past-orders-directory"> <!--       Division 3        -->
          <a href="PastOrder.jsp">
            <img id="past-order" src="photos/Pastorders.png"
            alt="Unavailable.png"
            width="50" height="50">
          </a>
        </div>
      </div>

		<div class="past-order">
		<%
			String productsinfo;
			for (int i = 1; i < client.getcustomer().getOrders().get_size() + 1; i ++)
	        {
				productsinfo = "";
				System.out.println(client.getcustomer().getOrders().get_element(i).getProduct());

				for (int j = 0; j < client.getcustomer().getOrders().get_element(i).getProduct().size(); j++)
				{
					productsinfo += "<a href=\"ProductPage.jsp\">" + 
								client.getcustomer().getOrders().get_element(i).getProduct().get(j).getName() + "</a>" + "<br>"
								+ "Quantities: " + client.getcustomer().getOrders().get_element(i).getQuantity().get(j);
				}
				
	            out.write(
	                  "<div class=\"productintro1\">" +
	                    "<div class=\"order-date\">" +
	                      "Ordered Date: " + client.getcustomer().getOrders().get_element(i).getOrderDate() +
	                    "</div>" + 
	                    "<div class=\"products\">" + productsinfo + 
	                     "</div>" +
	                  "</div>");
	        }
		%> 
		</div>
    </div>
  </body>
</html>
