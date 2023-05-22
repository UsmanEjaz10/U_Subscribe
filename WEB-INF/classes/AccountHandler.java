import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class AccountHandler extends HttpServlet {
    // Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession sess = request.getSession(false);       // Will check if session has already been created (user has logged into the system) or not (maybe accessing the page through url) //

        if (sess == null) {
            out.print("Session Expired");
            
      RequestDispatcher rd = request.getRequestDispatcher("Error-page.jsp");
      request.setAttribute("error", "no-login");
      rd.forward(request, response);
        }

        else {
            String type = (String) sess.getAttribute("type");
            String username = (String) sess.getAttribute("username");
            
            
            RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
            rd.forward(request, response);
            

        }
    }

}
