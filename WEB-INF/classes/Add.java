import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class Add extends HttpServlet {

    // Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        
     HttpSession session = request.getSession(false);   
     String type = (String)session.getAttribute("type");
    if (session == null) {
    
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
        String availability = "not rented";
        double price = Integer.parseInt(request.getParameter("price"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String q = "select * from car_records where car_id='" + car_id + "'";
            ResultSet db_result = st.executeQuery(q);
            if(db_result.next())
            {
                out.println("<span style='text-align:center; color:red;'> Could not insert the record. Duplicate id : " + car_id+ " </span>");
                RequestDispatcher rd = request.getRequestDispatcher("AddCarView.jsp");
                rd.include(request, response);
            }
            else{ 
            String query = "insert into car_records(car_id,model,version,availability,color,year,price) values('"+ car_id + "','"+ model + "','"+ version + "','" + availability + "', '"+ color +"' ,'" +year +"' ,'" + price + "') ";
        int rs = st.executeUpdate(query);

        out.println(rs);

        if (rs > 0) {
            out.println("<span style='text-align:center;'>Record inserted successfully. </span>");
        }

        else {
                 out.println("<span style='text-align:center; color:red;'> Could not insert the record. </span>");
        }
        RequestDispatcher rd = request.getRequestDispatcher("AddCarView.jsp");
            rd.include(request, response);
            }
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