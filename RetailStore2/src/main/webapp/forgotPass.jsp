<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <section class="container">
        <div class="login-container">
            <div class="circle circle-one"></div>
            <div class="form-container">
                <h1 class="opacity2">FORGOT PASSWORD</h1>
                <!-- Step 1: Enter Username and Mobile Number -->
                <form action="forgotpassword1" method="post">
                    <input type="text" placeholder="USERNAME" name="email" required/>
                    <input type="tel" placeholder="MOBILE NUMBER" name="mobile" required/>
                    <button type="submit">NEXT</button>
                        
                </form>
                <div class="register-forget opacity">
                    <a href="Login.jsp">Back to Login</a>
                </div>
            </div>
            <div class="circle circle-two"></div>
        </div>
        <div class="theme-btn-container"></div>
    </section>
</body>
</html>