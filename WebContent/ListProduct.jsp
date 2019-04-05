<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title> List Product </title>
  </head>
  <body>
    <div class="background">
      <h1>List Product</h1>
      <div class="back-to-employee-homepage">
        <a href="EmployeeHomePage.html">
          <img id="logo" src="photos/Employee.png" alt="" width="50" height="50"> <!-- image of homepage-->
        </a>
      </div>

      <div class="search-bars">
        <form class="" action="search.html" method="post">
          <input type="search" name="employee-search" value="">
          <input type="submit" name="Submit" value="Search">
        </form>
      </div>

      <div class="list-session">
        <script type="text/javascript">
          // A loop that runs through all the products that is in that array.
          // this loop will write the html
          for (var i = 0; i < 10; i ++)
          {
            document.write(
                    "<div class=\"productintro1\">" +
                      "<div class=\"image-area\">" +
                        "<img src=\"/Users/albertliu/Desktop/JSP/Project/photos/Unavailable.png\" alt=\"\">" +
                      "</div>" +
                      "<div class=\"productname\">" +
                        "<form class=\"\" action=\"ProductPage\" method=\"post\">" +
                          "<a href=\"ProductPage.html\">Product Name</a>" +
                        "</form>" +
                      "</div>" +
                    "</div>");
          }
        </script>
      </div>
    </div>
  </body>
</html>
