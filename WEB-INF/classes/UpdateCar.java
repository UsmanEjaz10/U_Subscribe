import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class UpdateCar extends HttpServlet {

    // Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     HttpSession session = request.getSession(false);   
     String type = (String)session.getAttribute("type");
    if (type == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

   if(type.equals("user"))
    {
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "user-login");
      rd.forward(request, response);
    }
    else if(type.equals("admin"))
    {
       
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Getting Parameter
        String car_id = request.getParameter("car_id");
        String model = request.getParameter("model");
        String version = request.getParameter("version");
        String color = request.getParameter("color");
        String year = request.getParameter("year");
        String availability = request.getParameter("availability");
        String price = request.getParameter("price");
        String updateid = (String)session.getAttribute("updateid");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String query = "update car_records set car_id = '" + car_id + "', model = '"+ model +"', version='"+version + "', availability = '" + availability + "', color='" +color+"', year = '"+year+ "', price='"+price+"' where car_id='"+ updateid+"'";
            int confirm = st.executeUpdate(query);


         RequestDispatcher rd = request.getRequestDispatcher("Admin_ViewCar.jsp");
            rd.forward(request, response);
        
        }

        catch (Exception I) {
            out.print(I);
        }
    }

     else{
    RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
    request.setAttribute("error", "no-user");
    rd.forward(request, response);
  }

}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}