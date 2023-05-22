<%@ page language = "java" import = "java.sql.*" %>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Homepage</title>
    <link rel="stylesheet" href="NavigationBar.css">
    <style>
      * {
        box-sizing: border-box;
      }
      
     
      .column {
        float: left;
        width: 25%;
        padding: 0 10px;
      }
      
      .row {margin: 0 -5px;}
      
      /* Clear floats after the columns */
      .row:after {
        content: "";
        display: table;
        clear: both;
      }
      
      @media screen and (max-width: 600px) {
        .column {
          width: 100%;
          display: block;
          margin-bottom: 20px;
        }
      }
      
      .card {
        transition: transform 2s;
       height:400px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        padding: 16px;
        text-align: center;
        background-color: rgba(0,0,0,0.5);
        border-radius: 10px;
    border: 1px solid rgba(255,255,255,0.3);
    box-shadow: 2px 2px 15px rgba(0,0,0,0.3);
    color: #fff;
    padding-top: 5px;
    margin-top: 40px;
    align-content: center;

      }
      
      body{
    background: url("images/CarHome3.jpeg");
    background-repeat: no-repeat;
    background-size: cover;
    }

    #animate:hover{
          width:400px;
          cursor: pointer;
    }

    #animate{
      margin: 5px;
        width:200px;
        height: 400px;
        transition: width 2s;
    }
    
    .card:hover{
        transform: scale(1.05);
        margin:5px;
    }



      </style>
  
</head>
<body>


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
     Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://127.0.0.1/pharma";
     Connection con=DriverManager.getConnection(url, "root", "");
     Statement stmt = con.createStatement();
     String session_username = (String)session.getAttribute("username"); 
     ResultSet rs = stmt.executeQuery("select * from user_records where username = '" + session_username + "'");
     while(rs.next())
     {
        String f_name = rs.getString("firstname");
        String l_name = rs.getString("lastname");
     
     %>
  
    <div class="container">
        <h3>Car-Subscription  ----  <%= session_username%> (<%=f_name%> <%=l_name%>)</h3>
    </div> 
        <!--Navigation Bar-->
    <div class="pill-nav">
      <a class="active" href="#">Home</a>
      <a href="Admin_ViewCar.jsp">Listed Cars</a>
      <a href="RentCar.jsp">Selected</a>   
      <a href="About.jsp">About</a>
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
    
  </div>
  <!--/Navigation Bar-->
  <br><br>

  <!--Card display-->
  <div class="row">
    <div class="column">
      <a href = "Admin_ViewCar.jsp" style="color:white; text-decoration: none;" >
      <div class="card">
        <img class="card-img-top" src="images/Car_collection.jpeg" alt="Card image" style="width:100%; height: 150px;"> 
        <h3>Get your Cars</h3>
        <p>We present you the latest Cars available at the best price possible in just one click. </p>
        <h5>Join us</h5>
      </div>
    </a>
    </div>
  
    <div class="column">
      <a href = "About.jsp" style="color:white; text-decoration: none;" >
      <div class="card">
        <img class="card-img-top" src="images/AboutUs.jpeg" alt="Card image" style="width:100%; height:150px;"> 
        <h3>About Us</h3>
        <p>A car subscription service provides consumers with a vehicle in exchange for a monthly fee. Vehicle subscriptions often include registration.</p>
        <h5>Bravo!!!</h5>
      </div>
    </div>
    
    <div class="column">
      <a href = "#" style="color:white; text-decoration: none;" >
      <div class="card">
        <img class="card-img-top" src="images/Homepage.jpeg" alt="Card image" style="width:100%; height:150px;"> 
        <h3>Add your preferences</h3>
        <p>You will be able to add your preference cars, models and their versions so you can get an update if a newly listed car matches your standard.</p>
        <h5>Coming Soon...</h5>
      </div>
    </div>
    
    <div class="column">
      <div class="card">
        <img class="card-img-top" src="images/About.jpeg" alt="Card image" style="width:100%; height:150px;"> 
        <h3>Rent and Move </h3>
        <p>Get the mobile version for smart access to the services. New features and details. Negotiations will be included as well.</p>
        <h5>Coming Soon...</h5>
      </div>
    </div>
  </div>
<!--/Card Display-->  

</body>
</html>
<%
}
    }
    else if(type.equals("admin"))
    {
      int count_cars = 0;
      int rented = 0;
      int not_rented = 0;
      try{
        Class.forName("com.mysql.jdbc.Driver");
     String url = "jdbc:mysql://127.0.0.1/pharma";
     Connection con=DriverManager.getConnection(url, "root", "");
     Statement stmt = con.createStatement();
     String session_username = (String)session.getAttribute("username");
     String query = "select * from car_records";
     ResultSet rs = stmt.executeQuery(query);
     while(rs.next())
     {
      String available = rs.getString("availability");
      count_cars = count_cars + 1;
      if(available.equals("rented"))
      {
        rented = rented + 1;
      }
      else if(available.equals("not rented"))
      {
        not_rented = not_rented + 1;
      }
     }
      }
      catch(Exception e)
      {
        out.println(e);
      }
      float rent_percent = 100*(rented/count_cars);
      float not_rent_percent = 100*(not_rented/count_cars);
%>
  
    <div class="container">
        <h3>Car-Subscription</h3>
        
        <!--Navigation Bar-->
    <div class="pill-nav">
      <a class="active" href="#">Home</a>
      <a  href="AddCarView.jsp">Add Car</a>
      <a href="Admin_ViewCar.jsp">View Cars</a>
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
      <hr>
  </div>
  <!--/Navigation Bar-->

  <div style="display: flex; flex-wrap: wrap; align-items: center;">
    <div class="card" id ="animate">
      <img class="card-img-top" src="images/Car_collection.jpeg" alt="Card image" style="width: 170px; height:100px"> 
      <h3>Total Cars: <%=count_cars%></h3>
      <h4>Rented: <%=rented%></h4>
      <h4>Available: <%=not_rented%></h4>
      <p>Admin dashboard lets you know about the current cars in the database.</p>
    </div>
    <div class="card" id ="animate">
      <div style="background-image: conic-gradient(brown 25%, blue 13% , black 31%, yellow 11%, white 2%, darksalmon 18% );border-radius: 50%; height: 150px; text-align: center;"></div>
      <h3>All the database stats</h3>
      <h4>Graphs and Bar Summary</h4>
      <p>Just have a look at the most rented cars of the previous years. Better to know what your customers are looking for.</p>
    </div>
  
  <div class="card" id ="animate">
    <img class="card-img-top" src="images/maintainence.jpeg" alt="Card image" style="width: 170px; height:100px"> 
    <h3>Maintainence</h3>
    <h4>Set up a maintainence team!!</h4>
    <p>Take control of the team. Add, update or remove members from your inspection team.</p>
    <h4>Coming soon...</h4>
  </div>
  
  <div class="card" id ="animate">
    <img class="card-img-top" src="images/complaints.jpeg" alt="Card image" style="width: 170px; height:100px"> 
    <h3>Customer Complaints!!</h3>
    <h4>Our customers are our first priority.</h4>
    <p>View issues reported by our customers. Allows us to stay close to customers. Listen to the issues and try to solve them. </p>
    <h4>Coming soon...</h4>
  </div>
</div>
</div>

</body>
</html>

<%

  } 
  else{
    RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
    request.setAttribute("error", "no-user");
    rd.forward(request, response);
  }


%>
