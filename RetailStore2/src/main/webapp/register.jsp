<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="com.dto.MessageDisplay" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="register.css" />
  </head>
  <body>
  <centre>
    <section class="container">
      <div class="registration-container">
        <div class="form-container">
          <h1>REGISTER</h1>
          <% MessageDisplay m=(MessageDisplay)session.getAttribute("msg");
                    	if(m!=null){
                    %>
                    		<div class="alert <%=m.getCssClass()%>" role="alert">
  							<%=m.getContent() %>
							</div>
                    <% 
                   	 session.removeAttribute("msg");
                    	}
                    	
                    %>
                   
          <form action="registeradmin" method="post" name="myform" >
            <input type="text" placeholder="Full Name" name="fname" required />
            <input
              type="text"
              placeholder="Mobile Number"
              name="mobile"
              required
            />
            <input type="text" placeholder="Email" name="email" required />
            <input
              type="password"
              placeholder="Password"
              name="password"
              required
            />
            <button type="submit" onclick="return validateform();">
              REGISTER
            </button>
          </form>
          <div class="login-link">
            <p>Already have an account? <a href="Login.jsp">Login here</a></p>
          </div>
        </div>
      </div>
    </section>
    </centre>
    <script>
      function validateform() {
        let mobile = document.myform.mobile.value;
        let password = document.myform.password.value;
        let x = document.myform.email.value;
        let atposition = x.indexOf("@");
        let dotposition = x.lastIndexOf(".");
        if (
          atposition < 1 ||
          dotposition < atposition + 2 ||
          dotposition + 2 >= x.length
        ) {
          alert(
            "Please enter a valid e-mail address \n atpostion:" +
              atposition +
              "\n dotposition:" +
              dotposition
          );
          return false;
        }
        if (password.length < 6) {
          alert("Password must be at least 6 characters long.");
          return false;
        }
        if (mobile.length != 10) {
          alert("Mobile number must be 10 digit.");
          return false;
        }
      }
    </script>
    
  </body>
</html>
