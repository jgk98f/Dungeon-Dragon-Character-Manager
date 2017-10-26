/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import java.sql.*;
import mybeans.*;
/**
 *
 * @author Jason
 */
public class registry extends HttpServlet{
    
    RequestDispatcher rd;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/cs4010";
    
    //  Database credentials
    static final String USER = "cs4010";
    static final String PASS = "cs4010";
 
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
        boolean result = Register(request);
        int id = getAccountId(request);
        request.setAttribute("Status", result);
        request.setAttribute("ID",id);
        rd = request.getRequestDispatcher("success.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
        rd = request.getRequestDispatcher("index.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }
 
    private int getAccountId(HttpServletRequest request){
        // JDBC driver name and database URL
        Connection conn = null;
        Statement stmt = null;
        int identity = 0;

        String useremail = request.getParameter("email");
        
        
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
            sql = "SELECT account_id FROM AccountBean WHERE email='"+useremail+"'";
            ResultSet rs = stmt.executeQuery(sql);
   
            
            //STEP 5: Extract data from result set
            if(rs.next()) {
            identity = rs.getInt("account_id");
            }
            else{
            identity = 0;
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
    return identity;
    }

    
private boolean Register(HttpServletRequest request){
        // JDBC driver name and database URL
        Connection conn = null;
        Statement stmt = null;
        boolean status = false;

        String fname = request.getParameter("Fname");
        String lname = request.getParameter("Lname");
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
            sql = "INSERT INTO AccountBean (fname,lname,email,password) VALUES(\"" + fname + "\",\"" + lname + "\",\"" + useremail + "\",\"" + userpass + "\")";
            int rs = stmt.executeUpdate(sql);
   
            
            //STEP 5: Extract data from result set
            if(rs > 0) {
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