<%@ page import = "User.*, Modules.*, IO.*, ADT.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Homepage</title>

  </head>

  <body>
    <div class="background">
      <h1>WELCOME</h1>

      <div class="back-to-homepage">
        <a href="Homepage.jsp">
          <img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> <!-- image of homepage-->
        </a>
      </div>

      <div class="selection-board">
        <div class="search-bar">
          <form action="SearchPage.jsp" method="get">
          	
          	<h4>Search Type</h4>
			<select name="way-to-search">
				<option value="primary">Choose</option>
				<option value="primary">Name</option>
				<option value="secondary">ID</option>
			</select>
			
            <input type="search" id="site-search" name="search-for-product" aria-label="Search through site content" value="">
			
			<input type="submit" name="search" value="Search">
			
          </form>
        </div>
        
        <%
        	Server server = (Server)(session.getAttribute("server"));
            Client client = (Client)(session.getAttribute("client"));
        %>

		<%!
          	public void decide(Client client, Server server, HttpSession session, HttpServletRequest request, HttpServletResponse response)
          	{
				if (!client.isloggedin() && !server.isloggedin())
				{
					String uname = (String)(request.getParameter("username"));
					String pass = (String)(request.getParameter("password"));
					int cidx = Client.verifyLogInInformationCustomer(uname, pass);
					boolean isemp = Server.verifyLogInInformationEmployee(uname, pass);
				
					if (cidx != -1) {
						client.login(uname, pass, cidx);
					}
				  	else if (isemp) {
				  		server.login(uname, pass); 
				  	}
				  	else 
				  	{
				  		if (uname != null && pass != null)
				  		{
				  			try{request.getRequestDispatcher("LogIn.jsp").forward(request, response); }
					  		catch(Exception e){}
				  		}
				  		else
				  			return;
				  	}
				}
          	}
	  	%>

		<%	
           	decide(client, server, session, request, response);
           	
            if (client.isloggedin()) // user has already logged in
            { 
              	out.write(             
              	"<div class=\"back-to-homepage\"> " +
                     " <a href=\"ShoppingCart.jsp\">" +
              			"<img id=\"logo\" src=\"photos/Shoppingcart.png\" alt=\"\" width=\"50\" height=\"50\"> " +
            		 "</a>" + 
          		"</div>"); 
            }
            else if (server.isloggedin())  // employee has already logged in
            {
              	out.write(             
              	"<div class=\"back-to-employee-homepage\"> " +
                        " <a href=\"EmployeeHomePage.jsp\">" +
                 			"<img id=\"logo\" src=\"photos/Employee.png\" alt=\"\" width=\"50\" height=\"50\"> " +
               		    " </a>" + 
             	"</div>"); 
            }
            else  // in guest mode 
            {
            	out.write(
	            "<div class=\"log-in\">" +
	                    "<form action=\"LogIn.jsp\" method=\"post\">" +
	                       "<input type=\"submit\" name=\"Log In\" value=\"Log In\">" +
	                    "</form>" + 
	            "</div>"); 
            }
            
           	// session.setAttribute("client",client);
           	// session.setAttribute("server",server);
    	%>
      </div>
    </div>
  </body>
</html>
