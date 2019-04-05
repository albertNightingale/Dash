<%@ page import = "User.*, Modules.*, IO.*, ADT.*, javax.servlet.http.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Log In</title>
  </head>


  <body>
    <div class="background">
      <div class="Title">
        <h1>Welcome! Please Log In!</h1>
      </div>
      
      <div class="back-to-homepage">
        <a href="Homepage.jsp">
          <img id="logo" src="photos/logo-icon.png" alt="" width="50" height="50"> 
        </a>
      </div>
		

      <div class="log-in">
      
      
        <form action=Homepage.jsp method="get" id="log-in-field">
          Enter Your Username: <input type="text" name="username" value="">
          <br>
          Enter Your Password: <input type="password" name="password" value="">
          <br>
          <input type="submit" id = "submit" value="Log In"> 
        </form>
        
        
      </div>
      <div class="sign-up">
          <a href="/Users/albertliu/Desktop/JSP/Project/SignUp.html">Still don't have an account?</a> <!--TODO this will lead to sign up page-->
      </div>
    </div>
  </body>
</html>
