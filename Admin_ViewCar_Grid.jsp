
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <%@ page language = "java" import = "java.sql.*, java.util.*" %>
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


    String type = (String)session.getAttribute("type");
    if (type == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

   if(type.equals("user"))
    {
    %>
    <h4 style="font-family: 'Times New Roman', Times, serif; margin-top: 5px;">Car-Subscription ---- User(customer)</h4>
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
      <a  href="Admin_ViewCar.jsp" style="text-align: center;">Table</a>
      <a class="active"href="#">All Cars</a>
    </div>
    
  

    <h3 style="text-align: center;">Car Cards</h3>
    <div style="display:flex; text-align: center; flex-wrap: wrap;">
    <br><br>
      <%  
      try{
        
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/pharma";
        Connection con=DriverManager.getConnection(url, "root", "");
      
      Statement stmt = con.createStatement();
      ResultSet rs = null;
    //  String search = (String)request.getAttribute("search");
    //  String id = (String)session.getAttribute("car");
      rs = stmt.executeQuery("select * from car_records where availability = 'not rented'");
      
      

      while(rs.next()) {
      String car_id = rs.getString("car_id");
      String model = rs.getString("model");
      String version = rs.getString("version");
      String color = rs.getString("color");
      String year = rs.getString("year");
      String available = rs.getString("availability");
      Double price = rs.getDouble("price");
      
      

    %>
  
    <div style="background-color: darksalmon; margin:20px; width:260px; border: 5px solid black;">
      <img src="images/<%=model%>.jpeg" alt="<%=model%>" style="width:250px; height:140px;">
      <h4><%=model%> <%=version%></h4>
      <p>Price/Hour: <%=price%></p>
      <p>Color: <%=color%></p>
      <p>Model Year: <%=year%></p>
      <form action="RentCar" method="post"><input type="hidden" name="rent" value="<%=car_id%>"><input type="submit" name="submit" value="Rent" style="color:white; background-color: black; border-radius: 5px; cursor: pointer; margin: 5px;text-align: center; width: 90%;"></form>
      <form action="Details.jsp" method="post"><input type="hidden" name="details" value="<%=car_id%>"><input type="submit" name="submit" value="Details" style="color:white; background-color: black; border-radius: 5px; cursor: pointer; margin: 5px; text-align: center; width: 90%;"></form>
      
    </div>


<%
}
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>
</div>
</body>
</html>
<%
  
    }
    else if(type.equals("admin"))
    {
  %>
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
    <a href="Admin_ViewCar.jsp">Table</a>
    <a class="active" href="#">All Cars</a>
</div>
<!--/Navigation Bar-->



  <div style="text-align: center; align-items: center;">
  <h3>Card display</h3>
  <div style="display:flex; text-align: center; flex-wrap: wrap;  flex-direction: row; margin: auto;">
    <br><br>
   

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
      
      session.setAttribute("page", "Grid");
      
%>
<div style="background-color: darksalmon; margin:20px; width:255px; border: 3px solid black;">
  <img src="images/<%=model%>.jpeg" alt="<%=model%>" style="width:250px; height:140px;">
  <br><br>
  <h4><%=model%> <%=version%></h4>
  <h6>Price/Hour: <%=price%></h6>
  <h6>Color: <%=color%></h6>
  <h6>Model Year: <%=year%></h6>
  <form action="DeleteCar" method="post"><input type="hidden" name="delete" value="<%=car_id%>"><input type="submit" name="submit" value="Delete" style="color:white; background-color: black; border-radius: 5px; cursor: pointer; margin: 5px; width: 90%; text-align: center;"></form>
  <form action="UpdateCar.jsp"><input type="hidden" name="update" value="<%=car_id%>"><input type="submit" name="submit" value="Update" style="color:white; background-color: black; border-radius: 5px; cursor: pointer; margin: 5px; width: 90%; text-align: center;"></form>
  
</div>

<%
}
%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

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
