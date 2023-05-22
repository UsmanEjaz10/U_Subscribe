<%@ page language = "java" import = "java.sql.*, java.util.*" %>
   
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reciept</title>
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <script src="valid.js"></script>
    <style>
        
        body{
      background-image: url("images/ViewCar.jpeg");
      background-repeat: no-repeat;
      background-size: cover;
    }       
label{
    font-family: sans-serif;
    font-size: 18px;
    text-align: center;
    display:inline-block;
    width: 10%;
}

.card {
        transition: transform 2s;
       height:fit-content;
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
    </style>
   
</head>
<body>
    <h3 style="font-family: 'Times New Roman', Times, serif; margin-top: 5px;">Car-Subscription</h3>   
<div class="pill-nav">
    <a  class="active" href="Admin_ViewCar.jsp" style="text-align: right;">Revist Cars</a>
</div>
<hr>
<form action="Thankyou.jsp" name="reciept" onsubmit=" return val1()">
    <div style="text-align: center;">
    <div class="card">
<%
    try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/pharma";
    Connection con = DriverManager.getConnection(url, "root", "");
    Statement st = con.createStatement();
    String username = (String)session.getAttribute("username");
    String rentCar_id = (String)session.getAttribute("rentcar");
    Double total_price = 0.0;
    String query2 = "select * from user_records where username = '" + username + "'";
    ResultSet rs1 = st.executeQuery(query2);
    while(rs1.next())
    {
        String f_name = rs1.getString("firstname");
        String l_name = rs1.getString("lastname");
        String email = rs1.getString("email");
        String phone = rs1.getString("Phone");
%>
<div class = "container">
    <h2 style="text-align: center;">Reciept</h2>
<hr>
<div id="exception"></div>
<br><br>
<!--Username Box--> 
<label>Username : </label>
<input type="text" name = "username" id="username" value="<%=username%>" required>
<br><br>
<!-- Name Box-->
<label>Name : </label>
<input type="text" name = "name" id="name" value="<%=f_name%> <%=l_name%>" required>
<br><br>
<!--Email Box-->
<label>Email : </label>
<input type="email" name="email" id="email" value="<%=email%>" onkeypress="return valid_email2(val)">
<br><br>
 <!--Phone Box--> 
 <label>Phone :  </label>
 <input type="text" name = "phone" id="phone" value="<%=phone%>" onkeypress="return format_checker(event)" onkeyup="return leave()" required>
 <br><br>
<!--Address Box--> 
  <label>Address :  </label>
  <input type="text" name = "address" id="address" placeholder="Enter address" required>
  <br><br>
  
<%

    }
    
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
        <span style="color:aquamarine"><%=model%> <%= version%> for <%=hour%> hrs.</span><br><br>
<%
 
    }

}
catch(Exception e)
{
    out.println(e);
}
    Double total_price = (Double)session.getAttribute("total");

%>
    <h3>Total Price: <%=total_price%></h3>
    <input type="submit" value="Confirm"  style="text-align: center; margin:10px; color: white; background-color: black; cursor: pointer;">
    </div>
                
</div>
</form>
</body>
</html>
<%
    }
%>
