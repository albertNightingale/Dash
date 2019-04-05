<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Search Page</title>
  </head>
  <body>
    <div class="background">
      <div class="back-to-homepage">
        <a href="Homepage.jsp">
          <img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
        </a>
      </div>
      
       <%
		Product product; 
       	String searchcontent = ""; 
		System.out.println("way-to-search: " + request.getParameter("way-to-search")); 
		System.out.println("search-for-product: " + request.getParameter("search-for-product"));
		System.out.println("search-on-searchpage: " + request.getParameter("search-on-searchpage"));

		if (request.getParameter("search-for-product") != null)
			searchcontent = request.getParameter("search-for-product");
		else
			searchcontent = request.getParameter("search-on-searchpage");
		
		if (request.getParameter("way-to-search").equals("secondary"))
		{
			product = User.secondaryProductSearch(searchcontent);
		}
		else 
		{
			product = User.primaryProductSearch(searchcontent);
		}

		if (product!=null)
		{
			session.setAttribute("Product-To-Be-Searched", product);
		}
      %>
      
      <div class="search-bar">
        <form action="SearchPage.jsp" method="get">
          	<select name="way-to-search">
				<option value="primary">Choose</option>
				<option value="primary">Name</option>
				<option value="secondary">ID</option>
			</select>
			<input type="search" id="site-search" name="search-on-searchpage" aria-label="Search through site content" 
			value=<%= searchcontent%>>
          <input type="submit" name="search" value="Search">
        </form>
      </div>

      <div class="search-results">
		
		<%	
			if (product != null)
			{
				out.write(                    
				"<div class=\"product-in-list\">" +
					"<div class=\"image-area\">" +
						"<img src=\"photos/Unavailable.png\" alt=\"\">" +
					"</div>" +
	         		"<div class=\"productprofile\">" + 
						"<a href=\"ProductPage.jsp\"> " + product.getName() + " </a>" +
		        		"<p>" + product.getProductId() + "</p>" + 
		        		"<p>" + product.getUnitPrice() + "</p>" + 
		        		"<p>" + product.getManufacturer() + "</p>" + 
		        	"</div>" +
				"</div>");
			}
			else
			{
				out.write("<h1>Your Product is not found!</h1>"); 
			}
		%>
      </div>
    </div>
  </body>
</html>
