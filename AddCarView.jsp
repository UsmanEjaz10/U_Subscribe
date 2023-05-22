<%

response.setHeader("Cache-control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
response.setDateHeader("Expires", -1);

String type = (String)session.getAttribute("type");
   
    if (type == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

   if(type.equals("user"))
    {
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "user-login");
      rd.forward(request, response);
    }
    else if(type.equals("admin"))
    {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>input Form 1.0</title>
    <!--Custom stylesheet imported (forms.css)-->
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <style>

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

.AddCar {
    
    background-color: #555555;
    
    font-size: 18px;
    border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.3);
    box-shadow: 2px 2px 15px #333333;
    color: #fff;
    padding-top: 5px;
    margin-top: 40px;
    align-content: center;
}

.main {
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  }

  input[type=text], input[type=number] {
  width: 30%;
  padding: 15px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

label{
    font-family: sans-serif;
    font-size: 18px;
    text-align: center;
    display:inline-block;
    width: 10%;
}

.split-image{
    height: 40%;
    width: 30%;
    position: absolute;
  top: 70%;
  left: 70%;
  transform: translate(-50%, -50%);
  text-align: center;
  border-radius: 2%;
  border-color: black;
  box-shadow: black;
}

.centered{

    background-repeat: no-repeat;
    border-color: black;
    background-position: 50%;
    background-size: contain;
    
}
body{
      background-image: url("images/ViewCar.jpeg");
      background-repeat: no-repeat;
      background-size: cover;
    }


    </style>

</head>
<body>
    <h3>Car-Subscription</h3>
    <!--Navigation Bar-->
    <div class="pill-nav">
        <a href="Homepage.jsp">Home</a>
        <a class="active" href="#">Add Car</a>
        <a href="Admin_ViewCar.jsp">View Cars</a>
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
    </div>
    <!--/Navigation Bar-->
    <div class = "main">
            <form class = "AddCar" method = "post"  action="AddCar">
                <div class = "container">
                    <h2 style="text-align: center;">Add Car</h2>
                    
                <hr>
                <!--Car_id Box--> 
                <label>Car_id : </label>
                <input type="text" name = "car_id" placeholder="Enter car_id" id="car_id" required>
                <br><br>
                <!-- Model Box-->
                <label>Car Model : </label>
                <input type="text" name = "model" placeholder="Enter car model" id="model" required>
                <br><br>
                <!--Version Box-->
                <label>Version : </label>
                <input type="text" name="version" placeholder="Enter car version" id="version" required>
                <br><br>
                 <!--color Box--> 
                 <label>Color :  </label>
                 <input type="text" name = "color" placeholder="Enter car color" id="color" required>
                 <br><br>
                 <!--Year Box-->
                 <label>Model Year : </label>
                 <input type="text" name = "year" placeholder="Enter car model year" id="year" required>
                 <br><br> 
                 <!--Price/Hour box-->
                <label>Price/Hour : </label>
                 <input type="text"  id="url-image" name="price" placeholder="Add rental price per hour">
                <br><br>
                 <input type="reset" value="Reset" name="reset" id="reset" style="text-align: center; font-size: medium; margin-left: 27%;">
                 <input type="submit" value="Enter" name="add" id="add" style="text-align: center; font-size: medium; margin-left: 1%;">
                
                 <br><br>
                </div>
                <div class="split-image">
                    <div class="centered" id="image-box">
                        <input type="file" accept="image/*" name="car-image" id="file" style="display:none" onchange="loadFile(event)">
                        <label for="file" style="cursor:pointer; margin-top: 200px;"><img src="images/icons8-upload-16.png"></label><br>
                        <span style="text-align: center;">Upload Car image</span>
                        
                    
                    </div>
                </div>
                </form>
        
    </div>

    <script>
        
        function loadFile(event){
            var image = document.getElementById("file").value;
            document.getElementById("image-box").style.backgroundImage = "url(" +URL.createObjectURL(event.target.files[0]) + ")";
            // document.getElementById("url-image").value = "url(" +URL.createObjectURL(event.target.files[0]) + ")";
            
            
        }
    </script>

   </body>
</html>

<%  }   %>

