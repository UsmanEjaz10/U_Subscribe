import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class RentCar extends HttpServlet {

    
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
        String car_id = request.getParameter("rent");
        session.setAttribute("rentcar", car_id);
        String username = (String)session.getAttribute("username");



        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String query = "update car_records set availability = 'rented' where car_id='" + car_id + "'";
            int confirm = st.executeUpdate(query);
            out.println("Update successfully.....");
            String q = "select * from car_records where car_id ='"+ car_id + "'";
            ResultSet result = st.executeQuery(q);
            if(result.next())
            {
                String model = result.getString("model");
                String version = result.getString("version");
                Double price = result.getDouble("price");
                out.println("got results from db");
            
            String query1 = "select * from carList where car_id='" + car_id + "' and username='" + username + "'";
            ResultSet rs  = st.executeQuery(query1);
            
                out.println("got results from db-- carList");
            
            if(rs.next())
            {}
            else{
                Double hour = 1.0;
                String query3 = "insert into carList(username, car_id, price, model, version, hour) values('" + username + "', '"+ car_id + "','"+ price + "', '"+ model+"', '"+ version+ "', '"+ hour + "')";
                int confirm1 = st.executeUpdate(query3);
                out.println("got results from db---carList 2");
            
            }
        }


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