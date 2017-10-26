import javax.servlet.*;
import javax.servlet.http.*;
import mybeans.CharacterBean;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jason
 */
public class Sql extends HttpServlet {
    
       // JDBC driver name and database URL
       static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
       static final String DB_URL = "jdbc:mysql://localhost/cs4010";

       //  Database credentials
       static final String USER = "cs4010";
       static final String PASS = "cs4010";
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
    
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher rd;
        String name = request.getParameter("charname");
        CharacterBean cbean = new CharacterBean();
        int number = (int) request.getSession().getAttribute("ID");
        cbean.setCharacters(number,name);
        request.setAttribute("cbean",cbean); 
        rd = request.getRequestDispatcher("cmanager.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }
    
    private void updateCharacter(HttpServletRequest request){
        
    }
    
}