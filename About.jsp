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
    <title>About Us</title>
    <link rel="stylesheet" href="NavigationBar.css" type="text/css">
    <style>
        body{
        background-image: url("images/ViewCar.jpeg");
        background-repeat: no-repeat;
        background-size: cover;
      }
    </style>
</head>
<body>
    <h3>Car-Subscription </h3>
    <!--Navigation Bar-->
    <div class="pill-nav">
        <a href="Homepage.jsp">Home</a>
        <a  href="Admin_ViewCar.jsp">Listed Cars</a>
        <a class="active" href="#">About</a>
        <a href="Logout.jsp" style="text-align: right;">Logout</a>
    </div>
    <!--/Navigation Bar-->
    <hr>
        <div style="display: flex; text-align: center;">
            <div style="margin:5px">
                <img src="images/about3.jpeg">
                <h3>Grid book McLaren is up for grabs</h3>
            </div>
            
            <div style="margin:5px">
                <img src="images/about4.jpeg" style="width:302px; height:167px;">
                <h3>Well Audi has its own class</h3>
            </div>
            <div style="margin:5px">
                <img src="images/about5.jpeg" style="width:302px; height:167px;">
                <h3>Watch out for Mercedes</h3>
            </div>

            <div style="margin:5px">
                <img src="images/about6.jpeg" style="width:302px; height:167px;">
                <h3>Well Biased Decision here!!</h3>
            </div>
        </div>
    <hr>
    <footer>
        <h2>Usman Ejaz</h2>
        <h3>Contact: 03214255078</h3>
        <p>We welcome you to experience the very best of this modern world. Go rent ride!!! Call us and we are around the corner or book your ride on our website.</p>
        <h4>Its a pocket car so enjoy</h4>
    </footer>
   
</body>
</html>
<%
}
else if(type.equals("admin"))
{
    RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "admin-login");
      rd.forward(request, response);
}
%>