<%

    String type = (String)session.getAttribute("type");
   
      if (type == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

   if(type.equals("user"))
    {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <%@ page language = "java" import = "java.sql.*" %>
   <style>
    body{
      background-image: url("images/ViewCar.jpeg");
      background-repeat: no-repeat;
      background-size: cover;
    }
    input[type=search]:focus{
      background-color: darksalmon;
    }
   </style>
  
</head>
<body>

  <h3>Car-Subscription ---- User(customer)</h3>
  <!--Navigation Bar-->
  <div class="pill-nav">
      <a href="Homepage.jsp">Home</a>
      <a class="active" href="#">Listed Cars</a>
      <a href="RentCar.jsp">Selected</a>
      <a href="About.jsp">About</a>
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
  </div>
  <!--/Navigation Bar-->
  <hr>
  <div class="pill-nav" style="text-align: right;">
    <a class="active" href="#" style="text-align: center;">Table</a>
    <a href="Admin_ViewCar_Grid.jsp">All Cars</a>
  </div>

  <div>
    <form action="SearchCar" method="post"><div style="text-align: center;"><input type="search" name="search" placeholder="Search by car model"><input type="submit" value="Search" style="background-color: black; color: white;"></div></form>
  </div>




  <div style="text-align: center; align-items: center;">
  <h3>Tabular</h3>
<table border = "1" style="text-align: center; margin-left: auto; margin-right: auto;">
<tr height="30" width="800" style="background-color: darksalmon;">
<td><b>Car_id</b></td>
<td><b>Car Model</b></td>
<td><b>Model Version</b></td>
<td><b>Color</b></td>
<td><b>Model Year</b></td>
<td><b>Price/Hour</b></td>
<td><b>Rent</b></td>
<td><b>Get more info</b></td>
</tr>
<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/pharma";
    Connection con=DriverManager.getConnection(url, "root", "");
Statement stmt = con.createStatement();
String search = (String)request.getAttribute("search");
String id = (String)session.getAttribute("car");
//................. Only searching for the cars which are available to the user(customer) ...............//
ResultSet rs = null;
if(search == null || id.equals("all")){
  rs = stmt.executeQuery("select * from car_records where availability = 'not rented'");
}
else if(search.equals("yes"))
{
   rs = stmt.executeQuery("select * from Car_records where model ='" + id + "'  and availability = 'not rented'");
}

while(rs.next()) {
 String car_id = rs.getString("car_id");
 String model = rs.getString("model");
 String version = rs.getString("version");
 String color = rs.getString("color");
 String year = rs.getString("year");
 double price = rs.getDouble("price");
 session.setAttribute("page", "table");
%>

<tr>
<td><%= car_id %></td>
<td><%= model %></td>
<td><%= version %></td>
<td><%= color %></td>
<td><%= year %></td>
<td><%= price %></td>
<!-- Button created to rent a car -->
<td><form action="RentCar" method="post"><input type="hidden" name="rent" value="<%=car_id%>"><input type="submit" name="submit" value="Rent" style="color:white; background-color: black; border-radius: 5px; cursor: pointer;"></form></td>
<td><form action="Details.jsp" method="post"><input type="hidden" name="details" value="<%=car_id%>"><input type="submit" name="submit" value="Details" style="color:white; background-color: black; border-radius: 5px; cursor: pointer;"></form></td>

</tr>
<%
}
%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

</table>
</div>

</body>
</html>
<%
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
    <title>Document</title>
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

  <h3>Car-Subscription</h3>
  <!--Navigation Bar-->
  <div class="pill-nav">
      <a href="Homepage.jsp">Home</a>
      <a  href="AddCarView.jsp">Add Car</a>
      <a class="active" href="#">View Cars</a>
      <a href="Logout.jsp" style="text-align: right;">Logout</a>
  </div>
  <!--/Navigation Bar-->
  <hr>
  <div class="pill-nav" style="text-align: right;">
    <a class="active" href="#" style="text-align: center;">Table</a>
    <a href="Admin_ViewCar_Grid.jsp">All Cars</a>
</div>
<!--/Navigation Bar-->



  <div style="text-align: center; align-items: center;">
  <h3>Tabular</h3>
<table border = "1" style="text-align: center; margin-left: auto; margin-right: auto;">
<tr height="30" width="800" style="background-color: darksalmon">
<td><b>Car_id</b></td>
<td><b>Car Model</b></td>
<td><b>Model Version</b></td>
<td><b>Color</b></td>
<td><b>Model Year</b></td>
<td><b>Status</b></td>
<td><b>Price/Hour</b></td>
<td><b>Delete</b></td>
<td><b>Update</b></td>
</tr>
<%

try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/pharma";
    Connection con=DriverManager.getConnection(url, "root", "");

Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select * from car_records");

while(rs.next()) {
 String car_id = rs.getString("car_id");
 String model = rs.getString("model");
 String version = rs.getString("version");
 String color = rs.getString("color");
 String year = rs.getString("year");
 String available = rs.getString("availability");
 Double price = rs.getDouble("price");
 session.setAttribute("page", "table");
%>

<tr>
<td><%= car_id %></td>
<td><%= model %></td>
<td><%= version %></td>
<td><%= color %></td>
<td><%= year %></td>
<td><%= available %></td>
<td><%= price %></td>
<td><form action="DeleteCar" method="post"><input type="hidden" name="delete" value="<%=car_id%>"><input type="submit" name="submit" value="Delete" style="color:white; background-color: black; border-radius: 5px; cursor: pointer;"></form></td>
<td><form action="UpdateCar.jsp"><input type="hidden" name="update" value="<%=car_id%>"><input type="submit" name="submit" value="Update" style="color:white; background-color: black; border-radius: 5px; cursor: pointer;"></form></td>

</tr>
<%
}
%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

</table>
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
