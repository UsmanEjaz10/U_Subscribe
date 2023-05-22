<%@ page language = "java" import = "java.sql.*" %>

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
    
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/pharma";
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement st = con.createStatement();
        String username = (String)session.getAttribute("username");
       
        String query = "delete from carList where username = '" + username + "'";
        int confirm = st.executeUpdate(query);  

%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    .container1{
      
      margin: 100px;
      text-align: center;
      
      
    }
  </style>
</head>
<body>
  <div class="container1">
    <span style="color:green">Congratulations!!!</span>
    <br><br>
    <img src="images/congrats.JPG" style="height: 120px; width: 120px;">
    <h3 style="color:darkgreen">Your order has been placed.</h3>
    <button style="background-color: black; border-radius: 5%; padding: 2px;"><a href="Homepage.jsp" style="text-decoration: none;  color: azure;">Home</a></button>
  
  </div>
</body>
</html>

<% 

}
%>