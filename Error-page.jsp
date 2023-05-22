
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
    <img src="images/error.png" style="height: 120px; width: 120px;">
    <h3 style="color:grey">Sorry! Something went wrong....</h3>
    <button style="background-color: black; border-radius: 5%;"><a href="UserLogin.jsp" style="text-decoration: none;  color: azure;">Login Screen</a></button>
  

  <% String error_type = (String)request.getAttribute("error");
    if(error_type.equals("no-user"))
    {
  %>
   <br><br><span>You are not a regular user. Please login again.</span>    
  <%
    }
  %>

  
  <% 
    if(error_type.equals("user-login"))
    {
  %>
    <br><br><span style="color: red">User cannot access this page. Login again with a Admin account.</span>    
  <%
    }
  %>

<%
  if(error_type.equals("no-login"))
  {
%>
<br><br> <span style="color:red">You have not logged onto the system. Please login to access the page</span>    
<%
  }
%>

<%
  if(error_type.equals("duplicate-car_id"))
  {
%>
<br><br> <span style="color:red">Car-id already entered. Cannot add into the system.</span>    
<%
  }
%>

<%
  if(error_type.equals("admin-login"))
  {
%>
<br><br> <span style="color:red">Admin does not have access to this page. Login again with regular user account.</span>    
<%
  }
%>


  </div>
</body>
</html>