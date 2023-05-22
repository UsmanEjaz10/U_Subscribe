<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details Card</title>
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <%@ page language = "java" import = "java.sql.*" %>
    <style>
      body{
      background-image: url("images/ViewCar.jpeg");
      background-repeat: no-repeat;
      background-size: cover;
    }
    </style>
</head>
<body>
<%
    if (session == null) {
    
        RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
        request.setAttribute("error", "no-login");
        rd.forward(request, response);
        }
  
      String type = (String)session.getAttribute("type");
     if(type.equals("admin"))
      {
        RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
        request.setAttribute("error", "admin-login");
        rd.forward(request, response);
      }
      else if(type.equals("user"))
      {
        
        String id = request.getParameter("details");

%>
  
    <h3>Car-Subscription</h3>
  <!--Navigation Bar-->
  <div class="pill-nav">
    <a href="Homepage.jsp">Home</a>
    <a  href="Admin_ViewCar.jsp">Listed Cars</a>
    <a href="About.jsp">About</a>
    <a class="active" href="#">Car Details</a>
    <a href="Logout.jsp" style="text-align: right;">Logout</a>
</div>
  <!--/Navigation Bar-->
  <hr>
  <div style="text-align: center; align-items: center; ">
    <h3>Card display</h3>
  </div>
  <%
  try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://127.0.0.1/pharma";
      Connection con=DriverManager.getConnection(url, "root", "");
  
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery("select * from car_records where car_id = '" + id + "'" );
  
  while(rs.next()) {
   String car_id = rs.getString("car_id");
   String model = rs.getString("model");
   String version = rs.getString("version");
   String color = rs.getString("color");
   String year = rs.getString("year");
   double price = rs.getDouble("price");
  
  %>
  
  <div style="height: 370px; width: 400px; text-align: center; margin-left: 38%;">
    <div  style="width:18rem; border-radius: 10px; border-color: black;background-color: black;">
       <img src="images/<%=model%>.jpeg" alt="Card image" style="width:100%;"> 
      <div  style="text-align: center; background-color: black;">
        <h3  style="color: white;">Car: <%=model + " " + version %></h3>
        <h4  style="color: white;">Price per/hour: <%=price %></h4>
        <h4  style="color: white;">Model year: <%=year%></h4>
        <form action="RentCar" method="post"><input type="hidden" name="rent" value="<%=car_id%>"><input type="submit" name="submit" value="Rent" style=" border-radius: 5px; cursor: pointer; margin: 5px;text-align: center; width: 90%;"></form>
      
    </div>
    </div>
    

<% 
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }

    }
    else{
        RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
        request.setAttribute("error", "no-user");
        rd.forward(request, response);
    }

%>

</body>
</html>