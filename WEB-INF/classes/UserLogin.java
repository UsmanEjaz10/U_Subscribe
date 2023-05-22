import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class UserLogin extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        HttpSession session = request.getSession();
        String login = (String)session.getAttribute("login");
        if(login == null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
            rd.forward(request, response);
        }
        
               try{
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/pharma";
            Connection con = DriverManager.getConnection(url,"root","");
            Statement st = con.createStatement();
    
            String mysql_query="Select * from user_records where username='" + username + "'";
            ResultSet db_result = st.executeQuery( mysql_query );

            if(db_result.next()){
                
                String db_username = db_result.getString("username");
                String db_type = db_result.getString("type");
                String db_password = db_result.getString("password");

                if(db_password.equals(password))
                {
                    session.setAttribute("type", db_type);
                    session.setAttribute("username", db_username);

                    RequestDispatcher rd= request.getRequestDispatcher("/AccountHandler");
                    rd.forward(request, response);

                }
                
                else {
                    session.setAttribute("invalid_password", "invalid");                    
                    RequestDispatcher rd= request.getRequestDispatcher("UserLogin.jsp");
                    rd.forward(request, response);

                }

            }

            else{
                    session.setAttribute("no_record", "invalid");                    
                    RequestDispatcher rd= request.getRequestDispatcher("UserLogin.jsp");
                    rd.forward(request, response);

            }

        }
        catch(Exception e){
            out.println(e);
            e.printStackTrace();
        }
    }
}