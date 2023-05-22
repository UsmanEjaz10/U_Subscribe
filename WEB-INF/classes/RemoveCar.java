import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class RemoveCar extends HttpServlet {

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String car_id = request.getParameter("remove_car_id");
        String username = (String)session.getAttribute("username");
        

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String query = "delete from carList where username = '" + username + "' and car_id = '" + car_id + "'";
            int confirm = st.executeUpdate(query);
            String q = "update car_records set availability = 'not rented' where car_id = '" + car_id + "'";
            int confirm2 = st.executeUpdate(q);
            RequestDispatcher rd = request.getRequestDispatcher("RentCar.jsp");
            rd.forward(request, response);

        }
        catch (Exception I) {
            out.print(I);
        }
    }
    if(type.equals("admin"))
    {
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "admin-login");
      rd.forward(request, response);
    }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}