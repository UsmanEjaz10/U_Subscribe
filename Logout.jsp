<%@ page language = "java" import = "java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Logout</title>
  <script>
    history.forward();
</script>
</head>
<body>
  
  <% 
  try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://127.0.0.1/pharma";
  Connection con = DriverManager.getConnection(url, "root", "");
  Statement st = con.createStatement();
  String username = (String)session.getAttribute("username");
 
  String query = "delete from carList where username = '" + username + "'";
  int confirm = st.executeUpdate(query);
            
  }
  catch(Exception e)
  {
    out.println(e);
  }          

  response.setHeader("Cache-control", "no-store");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");
  response.setDateHeader("Expires", -1);
  String t = (String)session.getAttribute("type");
  if(t == null)
  {
    RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
    rd.forward(request, response); 
  }

  if(username != null)

    session.setAttribute("type", null);
    session.invalidate(); 
    RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
    rd.forward(request, response); 
      
    %>
  
</body>
</html>