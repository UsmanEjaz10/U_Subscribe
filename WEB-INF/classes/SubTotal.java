import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class SubTotal extends HttpServlet {

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
        String update_hour = request.getParameter("update_hour");
        String username = (String)session.getAttribute("username");
        String update_hour_car_id = request.getParameter("update_hour_car_id");
        


        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();

            String query = "select * from carList where username = '" + username + "' and car_id = '"+update_hour_car_id+ "'";
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
            {
                Double hour = rs.getDouble("hour");
                if(update_hour.equals("-"))
                {
                    if(hour > 1){hour = hour - 1;}
                }
                else if(update_hour.equals("+"))
                {
                    hour = hour + 1 ;
                }           

            String q = "update  carList set hour = '"+ hour +"' where car_id ='"+ update_hour_car_id + "'";
            int confirm = st.executeUpdate(q);
            }
            RequestDispatcher rd = request.getRequestDispatcher("RentCar.jsp");
            rd.forward(request, response);



        }



        catch (Exception I) {
            out.print(I);
        }
    }
    if(type.equals("admin")){
        RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "admin-login");
      rd.forward(request, response);
    }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}