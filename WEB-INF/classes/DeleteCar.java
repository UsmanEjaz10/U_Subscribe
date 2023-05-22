import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class DeleteCar extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        String type = (String)session.getAttribute("type");
   
      if (type == null) {
    
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
      }

   if(type.equals("admin"))
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String car_id = request.getParameter("delete");
    


        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            String query = "delete from car_records where car_id='" + car_id + "'";
            int rs = st.executeUpdate(query);

        String page = (String)session.getAttribute("page");
        if(page.equals("table"))
        {RequestDispatcher rd = request.getRequestDispatcher("Admin_ViewCar.jsp");
            rd.include(request, response);
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("Admin_ViewCar_Grid.jsp");
            rd.include(request, response);
            
        }
        }
        catch (Exception I) {
            out.print(I);
        }
    }
    if(type.equals("user"))
    {
        
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "user-login");
      rd.forward(request, response);
    }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}