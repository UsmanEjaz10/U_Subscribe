<% 
response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);
session.setAttribute("login", "yes");
String pass_verification = (String)session.getAttribute("invalid_password");
String record_verification = (String)session.getAttribute("no_record");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Login Form 1.0</title>
    <!--Custom stylesheet imported (forms.css)-->
    <link rel="stylesheet" href="form.css" type="text/css">
    <script src="valid.js"></script>
    
    
</head>
<body>
    
    <div class = "main">
        <div class = "Register">
            <h2>Login form 1.0</h2>
            <form id = "register" method = "post" action="UserLogin">
                <%
                     if(pass_verification == null){}
                     else if(pass_verification.equals("invalid"))
                     {

                     
                %>
                <p style="color:red; text-align: center;">Invalid Username or password.</p>
                <% } %>
                <%
                     if(record_verification == null){}
                     else if(record_verification.equals("invalid"))
                     {
                %>
                <p style="color:red; text-align: center;">No user data found.</p>
                <% } %>
                <hr>
               <!--User Name Box--> 
                <label>Username : </label>
                <input type="text" name = "username" placeholder="Enter valid username" required>
                <br><br>
                <!--Password Box-->
                <label>Password: </label>
                <input type="password" name = "password" placeholder="Enter password" required>
                <br><br>
                <div class="loader">
                <input type="submit" value="Login" name="submit" id="submit">
                </div>
                <br>
                <p>Don't have an account?
                    <a href="Sign_up.jsp" style="color:lightblue">SignUp</a>
                </p>
            </form>
        </div><!--End of register-->
    </div><!--End main screen-->
</body>
</html>
<!--action = "backend.java"-->
