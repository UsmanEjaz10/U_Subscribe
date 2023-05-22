import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class SignUp extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
	response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    String f_name=request.getParameter("f_name");
    String l_name=request.getParameter("l_name");
    String username=request.getParameter("username");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String confirm_password=request.getParameter("confirm_password");
    String phone_num = request.getParameter("phone_num");

    out.println("<html>");
    out.println("<head><title>SignUp</title></head>");
    out.println("<body>");


    try{

        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/pharma";

        Connection con=DriverManager.getConnection(url, "root", "");
        Statement st= con.createStatement();

 		    String mysql_query = "Select * from user_records where username='"+ username + "' ";
     	  ResultSet db_result = st.executeQuery( mysql_query );
    	
		    if(db_result.next()){
      // As the username must be unique, if there exists a similar username in DB then display error feedback on the same sign up page //

			     out.println("<h6 style='color:white; text-align:center;'>UserName is not available.Try Another!</h2>");
           RequestDispatcher rd = request.getRequestDispatcher("Sign_up.jsp");
           rd.include(request, response);
                
        }

        
	    	else{ 
      // if username is unique then insert the data into the database, display a successful feedback and forward the request to Login page so that a particular User can login onto the system //
    	
	        String insertion_query = "insert into user_records(firstname,lastname,username,phone,email,password) values('"+ f_name + "','"+ l_name + "','"+ username + "','" + phone_num + "', '"+ email +"' ,'" + password + "') ";
	        int confirm = st.executeUpdate( insertion_query );

        if(confirm == 1){	
          out.println("<h2>Signup successful.... (data stored on DB)</h2>"); 
          RequestDispatcher rd = request.getRequestDispatcher("UserLogin.jsp");
          rd.forward(request, response); 		
                  }
	        else{	out.println("<h2>Data not saved into DB</h2>"); 		
                }
		    }
		
     out.println("</body></html>");

        st.close();             // Statment has been closed at this point //
        con.close();            // Disconnected with Database //

    }catch(Exception e){

      out.println(e);
    }
	
	out.close();

  }

}
