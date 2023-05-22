import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;

public class SearchCar extends HttpServlet {

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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String car_id = request.getParameter("search");
        try {
        request.setAttribute("search", "yes");
        session.setAttribute("car", car_id);
        RequestDispatcher rd = request.getRequestDispatcher("Admin_ViewCar.jsp");
            rd.include(request, response);
        
        
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