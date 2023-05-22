<%@ page language = "java" import = "java.sql.*" %>


<%
    if (session == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

    String type = (String)session.getAttribute("type");
   if(type.equals("user"))
    {
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "user-login");
      rd.forward(request, response);
    }
    else if(type.equals("admin"))
    {
      
    String id = request.getParameter("update");

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UpdateCar-Admin</title>
    <link rel="stylesheet" href="NavigationBar.css">
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
      
        input[type=text] {
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

      input[type="text"]{
        color:black;

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
    <div class="pill-nav">
        <a href="Homepage.jsp">Home</a>
        <a  href="AddCarView.jsp">Add Car</a>
        <a href="Admin_ViewCar.jsp">View Cars</a>
        <a class=active href="#">Update Car</a> 
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
    </div>

    <div class = "main">
      <form class = "AddCar" method = "post"  action="UpdateCar">
          <div class = "container">
              <h2 style="text-align: center;">Update Car</h2>
              
          <hr>

<%
                  

  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://127.0.0.1/pharma";
  Connection con=DriverManager.getConnection(url, "root", "");

  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery("select * from car_records where car_id = '" + id + "'");
  while(rs.next())
  {
    String car_id = rs.getString("car_id");
    String c_model = rs.getString("model");
    String version = rs.getString("version");
    String color = rs.getString("color");
    String year = rs.getString("year");
    String price = rs.getString("price");
    String availability = rs.getString("availability");
    session.setAttribute("updateid", car_id);
    
%>


          <!--Car_id Box--> 
          <label>Car_id : </label>
          <input type="text" name = "car_id" id="car_id" value="<%=car_id%>">
          <br><br>
          <!-- Model Box-->
          <label>Car Model : </label>
          <input type="text" name = "model" id="model" value="<%=c_model%>">
          <br><br>
          <!--Version Box-->
          <label>Version : </label>
          <input type="text" name="version" id="version" value="<%=version%>">
          <br><br>
          <!--Availability Box-->
          <label>Status : </label>
          <input type="text" name="availability" id="version" value="<%=availability%>">
          <br><br>
           <!--color Box--> 
           <label>Color :  </label>
           <input type="text" name = "color" id="color" value="<%=color%>">
           <br><br>
           <!--Year Box-->
           <label>Model Year : </label>
           <input type="text" name = "year" id="year" value="<%=year%>">
           <br><br> 
           <!--Image Box-->
          <label>Price : </label>
           <input type="text"  id="price" name="price" value="<%=price%>">
          <br><br>
           <input type="reset" value="Reset" name="reset" id="reset" style="text-align: center; font-size: medium; margin-left: 27%; background-color: black; color: white;">
           <input type="submit" value="Enter" name="add" id="add" style="text-align: center; font-size: medium; margin-left: 1%; background-color: black; color: white;">
          
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
       document.getElementById("url-image").value = image;
      
  }
</script>


</body>
</html>

<%

}

  } 
  else{
    RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
    request.setAttribute("error", "no-user");
    rd.forward(request, response);
  }

%>
