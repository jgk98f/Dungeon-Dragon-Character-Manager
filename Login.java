/**
 *
 * @author Jason
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.sql.*;
import mybeans.*;

public class Login extends HttpServlet{
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/cs4010";
    int ID;
    
    //  Database credentials
    static final String USER = "cs4010";
    static final String PASS = "cs4010";
 
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
        RequestDispatcher rd;
        
        HttpSession session = request.getSession();
 
        if(Authenticate(request,session)){  
            rd = request.getRequestDispatcher("/cmanager.jsp");
            try{rd.forward(request, response);}
            catch(Exception ex3){ex3.printStackTrace();}
            
        }
        else{
            rd = request.getRequestDispatcher("error.jsp");
            try{rd.forward(request, response);}
            catch(Exception ex4){ex4.printStackTrace();}
        }
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
        RequestDispatcher rd;
        
        rd = request.getRequestDispatcher("index.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }

    
private boolean Authenticate(HttpServletRequest request, HttpSession session){
        // JDBC driver name and database URL
        Connection conn = null;
        Statement stmt = null;
        boolean status = false;
        String useremail = request.getParameter("email");
        String userpass = request.getParameter("password");
        try {
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT email,password,account_id FROM AccountBean WHERE email = '" + useremail + "' AND password = '" + userpass + "'";
            ResultSet rs = stmt.executeQuery(sql);
            int ID;
            
            //STEP 5: Extract data from result set
            if(rs.next()) {
            ID = rs.getInt("account_id");
            session.setAttribute("ID", ID );
            status = true;
            }
            else{
            status = false;
            }
       
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt!=null)
                    stmt.close();
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn!=null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
    return status;
    }
}