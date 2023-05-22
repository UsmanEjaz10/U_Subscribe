<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>input Form 1.0</title>
    <!--Custom stylesheet imported (forms.css)-->
    <link rel="stylesheet" href="form.css" type="text/css">
    
    <script src="valid.js"></script>

</head>
<body>

    
    <div class = "main">
        <div class = "Register">
            <h2>Signup form 1.0</h2>
            <span id="exception" style = "color:red; text-align: center;"></span>
            <form id = "register" method = "post" onsubmit="return val()" action="SignUp">
               <!--First Name Box--> 
                <label>First Name : </label>
                <input type="text" name = "f_name" placeholder="Enter your First Name" id="f_name" required>
                <br><br>
                <!--Last Name Box-->
                <label>Last Name : </label>
                <input type="text" name = "l_name" placeholder="Enter your Last name" id="l_name" required>
                <br><br>
                <!--Age Box-->
                <label>Age :</label>
                <input type="text" name="age" placeholder="How old are you?" id="age" onkeypress="return format_checker(event)" onkeyup="return leave()" required>
                <br><br>
                <!--Email Box-->
                <label>Email : </label>
                <input type="email" name="email" placeholder="valid email address" id="email" required onkeypress="return valid_email2(val)">
                <br><br>
                 <!--User Name Box--> 
                 <label>Username : </label>
                 <input type="text" name = "username" placeholder="Enter valid username" id="username" required>
                 <br><br>
                 <!--Password Box-->
                 <label>Password: </label>
                 <input type="password" name = "password" placeholder="Enter password" id="password" required>
                 <br><br> 
                 <!--Confirm Password Box-->
                 <label> Confirm Password: </label>
                 <input type="password" name = "confirm_password" placeholder="Confrim password" id="confirm_password" required>
                 <br><br>
                 <!--Phone number Box-->
                 <label>Phone no: </label>
                 <input type="text" name = "phone_num" placeholder="Enter phone number" id="phone_num" onkeypress="return format_checker(event)" onkeyup="return leave()">
                 <br><br> 
                
                <input type="submit" value="Signup" name="submit" id="submit">
                
                <p>Already have an account?
                    <a href="UserLogin.jsp" style="color:lightblue">Login</a>
                </p>

                
            </form>
        </div><!--End of register-->
    </div><!--End main screen-->
</body>
</html>
<!--action = "backend.java"-->
