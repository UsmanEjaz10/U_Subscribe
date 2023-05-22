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

      if (type.equals("admin")) {
    
        RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
        request.setAttribute("error", "admin-login");
        rd.forward(request, response);
        }

   if(type.equals("user"))
    {
    %>
    <h4 style="font-family: 'Times New Roman', Times, serif; margin-top: 5px;">Car-Subscription ---- User(customer)</h4>
    <!--Navigation Bar-->
    <div class="pill-nav">
        <a href="Homepage.jsp">Home</a>
        <a href="Admin_ViewCar.jsp">Listed Cars</a>
        <a  class="active" href="RentCar.jsp">Selected</a>
        <a href="About.jsp">About</a>
        <a href="Logout.jsp" style="text-align: right;">Logout</a>
    </div>
    <!--/Navigation Bar-->
    <hr>
    <div class="pill-nav" style="text-align: center;">
      <a class="active" href="Admin_ViewCar.jsp" style="text-align: center;">Add more</a>
      <a class="active" href="GenerateReciept.jsp" style="text-align: center;">Generate Reciept</a>
      <br><br>
    </div>
    
    <div>
        <table border = "1" style="text-align: center; margin-left: auto; margin-right: auto;">
            <tr height="30" width="800" style="background-color: darksalmon;">
            <td><b>Car_id</b></td>
            <td><b>Car Model</b></td>
            <td><b>Model Version</b></td>
            <td><b>Price/Hour</b></td>
            <td><b>Total Hours</b></td>
            <td><b>Sub_total</b></td> 
            <td><b>Remove Car</b></td> 
            
            </tr>

                
<%
   //-------Creating Connection with the database-----//
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String username = (String)session.getAttribute("username");
            String rentCar_id = (String)session.getAttribute("rentcar");
            Double total_price = 0.0;
            Double default_hours = 1.0;
            String query = "select * from carList where username = '" + username + "'";
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                String model = rs.getString("model");
                String version = rs.getString("version");
                Double price = rs.getDouble("price");
                Double hour = rs.getDouble("hour");
                String car_id = rs.getString("car_id");
            
        
           
            
%>
 <tr>
    <td><%= car_id %></td>
    <td><%= model %></td>
    <td><%= version %></td>
    <td><%=price %><input type="hidden" id="price" value="<%=price%>"></td>
    <td><form action="SubTotal" method="post"><%=hour%><input type="hidden" name="hour" value="<%=hour%>"><input type="hidden" name="update_hour_car_id" value="<%=car_id%>"><input type="submit" name="update_hour" value="-"><input type="submit" name="update_hour" value="+"> </form> </td>
    <td><%= price*hour %></td>
    <td><form action="RemoveCar" method="post"><input type="hidden" name="remove_car_id" value="<%=car_id%>"><input type="submit" name="remove" value="x"></form></td>
    <% total_price = total_price + (price*hour); %>
</tr>     
        
<% 

}
%>
</table>
</div>
<div style="text-align: center;"><h3>Total price: <%=total_price %></h3></div>

<%
    session.setAttribute("total", total_price);
    }
catch (Exception e)
{
    out.println(e);
}

}

%>

</body>
</html>