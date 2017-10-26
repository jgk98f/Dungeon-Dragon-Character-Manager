<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>  
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <div class="left" style="padding-right: 150px;"/>
        <div class="right" style="padding-left: 150px;"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>D&D Manager Sources</title>
    <h3 class="text-center" style="padding-top: 100px;">Welcome to the source code!</h3>
    </head>
    <br/>
    <body>
        <h3>Functionality:</h3>
        <p style="font-size: 16px;">
           The project is fairly simple. The base functionality of the service is to allow a user to log in and modify 
           one of their D&D characters to allow a relatively paperless playing experience. The service refreshes the data and writes it to the database.
        </p>
        <br/>
        <h3>Credits:
        <p style="font-size: 16px;">
            All of the code was written by either myself or modified from Dr. Siegel's code.
        </p>
        <br/>
        <h3>Overview:
        <p style="font-size: 16px;">
            Have you ever wondered about playing dungeons and dragons? 
            Well, I have. With five people in the game, statistics, spell slots, and inventories can become unruly and unmanageable. 
            While journeying through the lands, you burn through sheets of paper like no tomorrow. 
            I always seem to forget leveling when I reach proper experience amount and applying the levels to my skills. 

            Fear no more. Introducing the Dungeons and Dragons character manager. 
            You will no longer have to slash and burn anymore trees to enjoy the simple pleasures of Dungeons and Dragons. 
            This tool will automatically calculate health, experience, etc...! 
            This functionality even comes neatly packaged in a hip-new UI! Do you want take a break and come back later? 
            No problem, the statistics will persist in your account!
        </p>
        <br/>
        <h3>Future:
        <p style="font-size: 16px;">
            I am going to implement the game operations so the program will compute the changes. 
            In addition, the representation of the character data will be refined. 
        </p>
        <br/>
        <h3>Instructions:
        <p style="font-size: 16px;">
            The start of the web application is located at http://hoare.cs.umsl.edu/servlet/j-klamert/Login . Click on the register button and register a new account.
            REMEMBER THE ACCOUNT ID! You will need this id for later events. Go back to the login page and log in. This will take you to the character manager page.
            Here you may use the forms to add a character to the database (which will be encoded). Then you may also retrieve a character from the database by remembering your
            account id and your characters name, which should be all unique within your account. This is meant to populate a table with the data toward the bottom of the page.
        </p>
        <p style="font-size: 16px;">
            NOTES: The character retrieval tool is not in full working order at the moment. The table cells are not editable as of the present.
            The character bean is to be populated with the data returned from the MySQL database after running the getCharacters() function. However,
            when I go into the jsp and use EL to reference the request attribute named "cbean" no values show up. So, there are only a few scenarios. Either
            the database is returning a completely null entity, which is kind of unlikely, the entity wasn't found, or there is a scoping problem with the request value
            from transport between the servlet and the jsp view. That is what I think. I didn't have much of a problem making an insert character for the doPost method of charmanager.java
            but I was unable to get the values to be displayed. In addition, I only used URL encoding to and from the database as protection from basic sensitive characters. I am aware that
            it falls short when coupling mySQL unique characters and url encoding. An example of this is the '-' and '_' characters.
        </p>
        <br/>
        <div class="center">
            <pre><code>
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import mybeans.CharacterBean;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.net.URLDecoder;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jason
 */
public class charmanager extends HttpServlet {
    
       // JDBC driver name and database URL
       static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
       static final String DB_URL = "jdbc:mysql://localhost/cs4010";

       //  Database credentials
       static final String USER = "cs4010";
       static final String PASS = "cs4010";
       RequestDispatcher rd;
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response){
        try{
        String Id = URLEncoder.encode(request.getParameter("ID"),"UTF-8");
        String Strength = URLEncoder.encode(request.getParameter("Strength"),"UTF-8");
        String Dexterity = URLEncoder.encode(request.getParameter("Dexterity"),"UTF-8");
        String Constitution = URLEncoder.encode(request.getParameter("Constitution"),"UTF-8");
        String Intelligence = URLEncoder.encode(request.getParameter("Intelligence"),"UTF-8");
        String Wisdom = URLEncoder.encode(request.getParameter("Wisdom"),"UTF-8");
        String Charisma = URLEncoder.encode(request.getParameter("Charisma"),"UTF-8");
        String ArmorClass = URLEncoder.encode(request.getParameter("ArmorClass"),"UTF-8");
        String Inspiration = URLEncoder.encode(request.getParameter("Inspiration"),"UTF-8");
        String Acrobatics = URLEncoder.encode(request.getParameter("Acrobatics"),"UTF-8");
        String AnimalHandling = URLEncoder.encode(request.getParameter("AnimalHandling"),"UTF-8");
        String Arcana = URLEncoder.encode(request.getParameter("Arcana"),"UTF-8");
        String Athletics = URLEncoder.encode(request.getParameter("Athletics"),"UTF-8");
        String Deception = URLEncoder.encode(request.getParameter("Deception"),"UTF-8");
        String History = URLEncoder.encode(request.getParameter("History"),"UTF-8");
        String Insight = URLEncoder.encode(request.getParameter("Insight"),"UTF-8");
        String Investigation = URLEncoder.encode(request.getParameter("Investigation"),"UTF-8");
        String Medicine = URLEncoder.encode(request.getParameter("Medicine"),"UTF-8");
        String Nature = URLEncoder.encode(request.getParameter("Nature"),"UTF-8");
        String Perception = URLEncoder.encode(request.getParameter("Perception"),"UTF-8");
        String Performance = URLEncoder.encode(request.getParameter("Performance"),"UTF-8");
        String Persuasion = URLEncoder.encode(request.getParameter("Persuasion"),"UTF-8");
        String SleightOfHand = URLEncoder.encode(request.getParameter("SleightOfHand"),"UTF-8");
        String Stealth = URLEncoder.encode(request.getParameter("Stealth"),"UTF-8");
        String Survival = URLEncoder.encode(request.getParameter("Survival"),"UTF-8");
        String Initiative = URLEncoder.encode(request.getParameter("Initiative"),"UTF-8");
        String Speed = URLEncoder.encode(request.getParameter("Speed"),"UTF-8");
        String Health = URLEncoder.encode(request.getParameter("Health"),"UTF-8");
        String DeathSaveSuccess = URLEncoder.encode(request.getParameter("DeathSaveSuccess"),"UTF-8");
        String DeathSaveFail = URLEncoder.encode(request.getParameter("DeathSaveFail"),"UTF-8");
        String Attack = URLEncoder.encode(request.getParameter("Attack"),"UTF-8");
        String Level = URLEncoder.encode(request.getParameter("Level"),"UTF-8");
        String Experience = URLEncoder.encode(request.getParameter("Experience"),"UTF-8");
        String Alignment = URLEncoder.encode(request.getParameter("Alignment"),"UTF-8");
        String CharacterClass = URLEncoder.encode(request.getParameter("CharacterClass"),"UTF-8");
        String Age = URLEncoder.encode(request.getParameter("Age"),"UTF-8");
        String Height = URLEncoder.encode(request.getParameter("Height"),"UTF-8");
        String Weight = URLEncoder.encode(request.getParameter("Weight"),"UTF-8");
        String EyeColor = URLEncoder.encode(request.getParameter("EyeColor"),"UTF-8");
        String SkinColor = URLEncoder.encode(request.getParameter("SkinColor"),"UTF-8");
        String HairColor = URLEncoder.encode(request.getParameter("HairColor"),"UTF-8");
        String Proficiency = URLEncoder.encode(request.getParameter("Proficiency"),"UTF-8");
        String Intimidation = URLEncoder.encode(request.getParameter("Intimidation"),"UTF-8");
        String Religion = URLEncoder.encode(request.getParameter("Religion"),"UTF-8");
        String Name = URLEncoder.encode(request.getParameter("Name"), "UTF-8");
        boolean Status = updateCharacter(Integer.parseInt(Id),Strength,Dexterity,Constitution,Intelligence,Wisdom,Charisma,ArmorClass,Inspiration,Acrobatics,AnimalHandling,Arcana,Athletics,Deception,History,Insight,Investigation,Medicine,Nature,Perception, Performance,Persuasion, SleightOfHand,Stealth,Survival,Initiative,Speed,Health,DeathSaveSuccess,DeathSaveFail,Attack,Level,Experience,Alignment,CharacterClass,Age,Height,Weight,EyeColor,SkinColor,HairColor,Proficiency,Intimidation,Religion,Name);
        request.setAttribute("Status", Status);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        
        rd = request.getRequestDispatcher("cmanager.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }   
    
     
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
        
    try{
        String name = URLEncoder.encode(request.getParameter("name"),"UTF-8");
        String ID = request.getParameter("id");
        
        CharacterBean cbean = null;
        cbean = setCharacters(Integer.parseInt(ID),name,request);
        request.setAttribute("cbean",cbean);}
        catch (Exception ex){
            ex.printStackTrace();
    }
        
        rd = request.getRequestDispatcher("cmanager.jsp");
        try{rd.forward(request, response);}
        catch(Exception ex3){ex3.printStackTrace();}
    }
    
    
    private boolean updateCharacter(int id,String Strength,String Dexterity,String Constitution,String Intelligence,String Wisdom,String Charisma,String ArmorClass,String Inspiration,String Acrobatics,String AnimalHandling,String Arcana,String Athletics,String Deception,String History,String Insight,String Investigation,String Medicine,String Nature,String Perception,String Performance,String Persuasion,String SleightOfHand,String Stealth,String Survival,String Initiative,String Speed,String Health,String DeathSaveSuccess,String DeathSaveFail,String Attack,String Level,String Experience,String Alignment,String CharacterClass,String Age,String Height,String Weight,String EyeColor,String SkinColor,String HairColor,String Proficiency,String Intimidation,String Religion,String Name){
            
        Connection conn = null;
        Statement stmt = null;
        boolean flag = false;
        
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

//            sql = "INSERT INTO CharacterBean (this_AccountBean,Strength,Dexterity,Constitution,Intelligence,Wisdom,Charisma,ArmorClass,Inspiration,Proficiency,Acrobatics,AnimalHandling,Arcana,Athletics,Deception,History,Insight,Intimidation,Investigation,Medicine,Nature,Perception,Performance,Persuasion,Religion,SleightOfHand,Stealth,Survival,Initiative,Speed,Health,DeathSaveSuccess,DeathSaveFail,Attack,Level,Name,Experience,Alignment,CharacterClass,Age,Height,Weight,EyeColor,SkinColor,HairColor) VALUES('1','Strength','Dexterity','Constitution','Intelligence','Wisdom','Charisma','ArmorClass','Inspiration','Proficiency','Acrobatics','AnimalHandling','Arcana','Athletics','Deception','History','Insight','Intimidation','Investigation','Medicine','Nature','Perception','Performance','Persuasion','Religion','SleightOfHand','Stealth','Survival','Initiative','Speed','Health','DeathSaveSuccess','DeathSaveFail','Attack','Level','Name','Experience','Alignment','CharacterClass','Age','Height','Weight','EyeColor','SkinColor','HairColor')";
            sql = "INSERT INTO CharacterBean (this_AccountBean,Strength,Dexterity,Constitution,Intelligence,Wisdom,Charisma,ArmorClass,Inspiration,Proficiency,Acrobatics,AnimalHandling,Arcana,Athletics,Deception,History,Insight,Intimidation,Investigation,Medicine,Nature,Perception,Performance,Persuasion,Religion,SleightOfHand,Stealth,Survival,Initiative,Speed,Health,DeathSaveSuccess,DeathSaveFail,Attack,Level,Name,Experience,Alignment,CharacterClass,Age,Height,Weight,EyeColor,SkinColor,HairColor) VALUES('"+id+"','"+Strength+"','"+Dexterity+"','"+Constitution+"','"+Intelligence+"','"+Wisdom+"','"+Charisma+"','"+ArmorClass+"','"+Inspiration+"','"+Proficiency+"','"+Acrobatics+"','"+AnimalHandling+"','"+Arcana+"','"+Athletics+"','"+Deception+"','"+History+"','"+Insight+"','"+Intimidation+"','"+Investigation+"','"+Medicine+"','"+Nature+"','"+Perception+"','"+Performance+"','"+Persuasion+"','"+Religion+"','"+SleightOfHand+"','"+Stealth+"','"+Survival+"','"+Initiative+"','"+Speed+"','"+Health+"','"+DeathSaveSuccess+"','"+DeathSaveFail+"','"+Attack+"','"+Level+"','"+Name+"','"+Experience+"','"+Alignment+"','"+CharacterClass+"','"+Age+"','"+Height+"','"+Weight+"','"+EyeColor+"','"+SkinColor+"','"+HairColor+"')";

            int rs = stmt.executeUpdate(sql);
            
            //STEP 5: Extract data from result set
            if (rs > 0) {
                flag = true;
            }
            else{
                flag = false;
            }
             
            //STEP 6: Clean-up environment
            stmt.close();
            conn.close();
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
    return flag;
    }
    
    public CharacterBean setCharacters(int id, String name, HttpServletRequest request){
        
      
        Connection conn = null;
        Statement stmt = null;
        CharacterBean list = null;
        boolean status2 = false;
        
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
            int userAccountId = id;
            
            sql = "SELECT * FROM CharacterBean WHERE this_AccountBean='"+userAccountId+"' AND Name='"+name+"'";

            ResultSet rs = stmt.executeQuery(sql);
            
            //STEP 5: Extract data from result set
            if(rs.next()) {
                list.setId(rs.getInt("this_AccountBean"));
                list.setStrength(URLDecoder.decode(rs.getString("Strength"),"UTF-8"));
                list.setDexterity(URLDecoder.decode(rs.getString("Dexterity"),"UTF-8"));
                list.setConstitution (URLDecoder.decode(rs.getString("Constitution"),"UTF-8"));
                list.setIntelligence(URLDecoder.decode(rs.getString("Intelligence"),"UTF-8"));
                list.setWisdom(URLDecoder.decode(rs.getString("Wisdom"),"UTF-8"));
                list.setCharisma(URLDecoder.decode(rs.getString("Charisma"),"UTF-8"));
                list.setArmorClass(URLDecoder.decode(rs.getString("ArmorClass"),"UTF-8"));
                list.setInspiration(URLDecoder.decode(rs.getString("Inspiration"),"UTF-8"));
                list.setProficiency(URLDecoder.decode(rs.getString("Proficiency"),"UTF-8"));
                list.setAcrobatics(URLDecoder.decode(rs.getString("Acrobatics"),"UTF-8"));
                list.setAnimalHandling(URLDecoder.decode(rs.getString("AnimalHandling"),"UTF-8"));
                list.setArcana(URLDecoder.decode(rs.getString("Arcana"),"UTF-8"));
                list.setAthletics(URLDecoder.decode(rs.getString("Athletics"),"UTF-8"));
                list.setDeception(URLDecoder.decode(rs.getString("Deception"),"UTF-8"));
                list.setHistory(URLDecoder.decode(rs.getString("History"),"UTF-8"));
                list.setInsight(URLDecoder.decode(rs.getString("Insight"),"UTF-8"));
                list.setIntimidation(URLDecoder.decode(rs.getString("Intimidation"),"UTF-8"));
                list.setInvestigation(URLDecoder.decode(rs.getString("Investigation"),"UTF-8"));
                list.setMedicine(URLDecoder.decode(rs.getString("Medicine"),"UTF-8"));
                list.setNature(URLDecoder.decode(rs.getString("Nature"),"UTF-8"));
                list.setPerception(URLDecoder.decode(rs.getString("Perception"),"UTF-8"));
                list.setPerformance(URLDecoder.decode(rs.getString("Performance"),"UTF-8"));
                list.setPersuasion(URLDecoder.decode(rs.getString("Persuasion"),"UTF-8"));
                list.setReligion(URLDecoder.decode(rs.getString("Religion"),"UTF-8"));
                list.setSleightOfHand(URLDecoder.decode(rs.getString("SleightOfHand"),"UTF-8"));
                list.setStealth(URLDecoder.decode(rs.getString("Stealth"),"UTF-8"));
                list.setSurvival(URLDecoder.decode(rs.getString("Survival"),"UTF-8"));
                list.setInitiative(URLDecoder.decode(rs.getString("Initiative"),"UTF-8"));
                list.setSpeed(URLDecoder.decode(rs.getString("Speed"),"UTF-8"));
                list.setHealth(URLDecoder.decode(rs.getString("Health"),"UTF-8"));
                list.setDeathSaveSuccess(URLDecoder.decode(rs.getString("DeathSaveSuccess"),"UTF-8"));
                list.setDeathSaveFail(URLDecoder.decode(rs.getString("DeathSaveFail"),"UTF-8"));
                list.setAttack(URLDecoder.decode(rs.getString("Attack"),"UTF-8"));
                list.setLevel(URLDecoder.decode(rs.getString("Level"),"UTF-8"));
                list.setName(URLDecoder.decode(rs.getString("Name"),"UTF-8"));
                list.setExperience(URLDecoder.decode(rs.getString("Experience"),"UTF-8"));
                list.setAlignment(URLDecoder.decode(rs.getString("Alignment"),"UTF-8"));
                list.setCharacterClass(URLDecoder.decode(rs.getString("CharacterClass"),"UTF-8"));
                list.setAge(URLDecoder.decode(rs.getString("Age"),"UTF-8"));
                list.setHeight(URLDecoder.decode(rs.getString("Height"),"UTF-8"));
                list.setWeight(URLDecoder.decode(rs.getString("Weight"),"UTF-8"));
                list.setEyeColor(URLDecoder.decode(rs.getString("EyeColor"),"UTF-8"));
                list.setSkinColor(URLDecoder.decode(rs.getString("SkinColor"),"UTF-8"));
                list.setHairColor(URLDecoder.decode(rs.getString("HairColor"),"UTF-8"));
                status2 = true;
                request.setAttribute("Status2", status2);
            }
            
            //STEP 6: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
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
    return list;
    }
}                
</code><pre>
            <pre><code class="java">
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
            </code></pre>
            <pre><code class="java">
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

    //  Database credentials
    static final String USER = "cs4010";
    static final String PASS = "cs4010";
 
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException{
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
 
        if(Authenticate(request,session)){
            CharacterBean cbean = new CharacterBean();
            int ID = (int) request.getSession().getAttribute("ID");
            cbean.setCharacters(ID,name);
            request.setAttribute("cbean",cbean);
            rd = request.getRequestDispatcher("cmanager.jsp");
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
           </code></pre>
            <br/>
            <pre><code class="sql">
                CREATE TABLE cs4010.AccountBean
(
account_id int NOT NULL AUTO_INCREMENT,
fname varchar(255) NOT NULL,
lname varchar(255) NOT NULL,
email varchar(255) NOT NULL,
password varchar(255) NOT NULL,
PRIMARY KEY (account_id)
)

            </code>
            <br/>
            <code class="sql">
                CREATE TABLE cs4010.CharacterBean
(
    this_AccountBean int NOT NULL,
  `Strength` varchar(255) NOT NULL,
  `Dexterity` varchar(255) NOT NULL,
  `Constitution` varchar(255) NOT NULL,
  `Intelligence` varchar(255) NOT NULL,
  `Wisdom` varchar(255) NOT NULL,
  `Charisma` varchar(255) NOT NULL,
  `ArmorClass` varchar(255) NOT NULL,
  `Inspiration` varchar(255) NOT NULL,
  `Proficiency` varchar(255) NOT NULL,
  `Acrobatics` varchar(255) NOT NULL,
  `AnimalHandling` varchar(255) NOT NULL,
  `Arcana` varchar(255) NOT NULL,
  `Athletics` varchar(255) NOT NULL,
  `Deception` varchar(255) NOT NULL,
  `History` varchar(255) NOT NULL,
  `Insight` varchar(255) NOT NULL,
  `Intimidation` varchar(255) NOT NULL,
  `Investigation` varchar(255) NOT NULL,
  `Medicine` varchar(255) NOT NULL,
  `Nature` varchar(255) NOT NULL,
  `Perception` varchar(255) NOT NULL,
  `Performance` varchar(255) NOT NULL,
  `Persuasion` varchar(255) NOT NULL,
  `Religion` varchar(255) NOT NULL,
  `SleightOfHand` varchar(255) NOT NULL,
  `Stealth` varchar(255) NOT NULL,
  `Survival` varchar(255) NOT NULL,
  `Initiative` varchar(255) NOT NULL,
  `Speed` varchar(255) NOT NULL,
  `Health` varchar(255) NOT NULL,
  `DeathSaveSuccess` varchar(255) NOT NULL,
  `DeathSaveFail` varchar(255) NOT NULL,
  `Attack` varchar(255) NOT NULL,
  `Level` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Experience` varchar(255) NOT NULL,
  `Alignment` varchar(255) NOT NULL,
  `CharacterClass` varchar(255) NOT NULL,
  `Age` varchar(255) NOT NULL,
  `Height` varchar(255) NOT NULL,
  `Weight` varchar(255) NOT NULL,
  `EyeColor` varchar(255) NOT NULL,
  `SkinColor` varchar(255) NOT NULL,
  `HairColor` varchar(255) NOT NULL
)

            </code></pre>
            <br/>
            <pre><code class="java">
package mybeans;
import java.sql.*;
import java.io.*;
import java.net.URLEncoder;
import java.net.URLDecoder;
import  java.nio.charset.Charset;


/**
 * 
 * @author Jason
 */
public class CharacterBean implements java.io.Serializable {
            
        private int Id;
	private String Strength;
	private String Dexterity;
	private String Constitution;
	private String Intelligence;
	private String Wisdom;
	private String Charisma;
	private String ArmorClass;
	private String Inspiration;
	private String Proficiency;
	private String Acrobatics;
	private String AnimalHandling;
	private String Arcana;
	private String Athletics;
	private String Deception;
	private String History;
	private String Insight;
	private String Intimidation;
	private String Investigation;
	private String Medicine;
	private String Nature;
	private String Perception;
	private String Performance;
	private String Persuasion;
	private String Religion;
	private String SleightOfHand;
	private String Stealth;
	private String Survival;
	private String Initiative;
	private String Speed;
	private String Health;
	private String DeathSaveSuccess;
	private String DeathSaveFail;
	private String Attack;
	private String Level;
	private String Name;
	private String Experience;
	private String Alignment;
	private String CharacterClass;
	private String Age;
	private String Height;
	private String Weight;
	private String EyeColor;
	private String SkinColor;
	private String HairColor;
        
        
        public CharacterBean(){
            super();
        }
        
	/**
	 * @param strength
	 * @param dexterity
	 * @param constitution
	 * @param intelligence
	 * @param wisdom
	 * @param charisma
	 * @param armorClass
	 * @param inspiration
	 * @param proficiency
	 * @param acrobatics
	 * @param animalHandling
	 * @param arcana
	 * @param athletics
	 * @param deception
	 * @param history
	 * @param insight
	 * @param initimidation
	 * @param investigation
	 * @param medicine
	 * @param nature
	 * @param perception
	 * @param performance
	 * @param persuasion
	 * @param religion
	 * @param sleightOfHand
	 * @param stealth
	 * @param survival
	 * @param initiative
	 * @param speed
	 * @param health
	 * @param deathSaveSuccess
	 * @param deathSaveFail
	 * @param attack
	 * @param level
	 * @param name
	 * @param experience
	 * @param alignment
	 * @param class1
	 * @param age
	 * @param height
	 * @param weight
	 * @param eyeColor
	 * @param skinColor
	 * @param hairColor
	 */
	public CharacterBean(String strength, String dexterity,
			String constitution, String intelligence, String wisdom,
			String charisma, String armorClass, String inspiration,
			String proficiency, String acrobatics, String animalHandling,
			String arcana, String athletics, String deception, String history,
			String insight, String initimidation, String investigation,
			String medicine, String nature, String perception,
			String performance, String persuasion, String religion,
			String sleightOfHand, String stealth, String survival,
			String initiative, String speed, String health,
			String deathSaveSuccess, String deathSaveFail, String attack,
			String level, String name, String experience, String alignment,
			String class1, String age, String height, String weight,
			String eyeColor, String skinColor, String hairColor) {
		super();
		Strength = strength;
		Dexterity = dexterity;
		Constitution = constitution;
		Intelligence = intelligence;
		Wisdom = wisdom;
		Charisma = charisma;
		ArmorClass = armorClass;
		Inspiration = inspiration;
		Proficiency = proficiency;
		Acrobatics = acrobatics;
		AnimalHandling = animalHandling;
		Arcana = arcana;
		Athletics = athletics;
		Deception = deception;
		History = history;
		Insight = insight;
		Intimidation = initimidation;
		Investigation = investigation;
		Medicine = medicine;
		Nature = nature;
		Perception = perception;
		Performance = performance;
		Persuasion = persuasion;
		Religion = religion;
		SleightOfHand = sleightOfHand;
		Stealth = stealth;
		Survival = survival;
		Initiative = initiative;
		Speed = speed;
		Health = health;
		DeathSaveSuccess = deathSaveSuccess;
		DeathSaveFail = deathSaveFail;
		Attack = attack;
		Level = level;
		Name = name;
		Experience = experience;
		Alignment = alignment;
		CharacterClass = class1;
		Age = age;
		Height = height;
		Weight = weight;
		EyeColor = eyeColor;
		SkinColor = skinColor;
		HairColor = hairColor;
	}
        
        /**
         * @return the Id
         */
        public int getId() {
            return Id;
        }
        
	/**
	 * @return the strength
	 */
	public String getStrength() {
		return Strength;
	}

	/**
	 * @param strength
	 *            the strength to set
	 */
	public void setStrength(String strength) {
		Strength = strength;
	}

	/**
	 * @return the dexterity
	 */
	public String getDexterity() {
		return Dexterity;
	}

	/**
	 * @param dexterity
	 *            the dexterity to set
	 */
	public void setDexterity(String dexterity) {
		Dexterity = dexterity;
	}
        
        /**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		Id = id;
	}

	/**
	 * @return the constitution
	 */
	public String getConstitution() {
		return Constitution;
	}

	/**
	 * @param constitution
	 *            the constitution to set
	 */
	public void setConstitution(String constitution) {
		Constitution = constitution;
	}

	/**
	 * @return the intelligence
	 */
	public String getIntelligence() {
		return Intelligence;
	}

	/**
	 * @param intelligence
	 *            the intelligence to set
	 */
	public void setIntelligence(String intelligence) {
		Intelligence = intelligence;
	}

	/**
	 * @return the wisdom
	 */
	public String getWisdom() {
		return Wisdom;
	}

	/**
	 * @param wisdom
	 *            the wisdom to set
	 */
	public void setWisdom(String wisdom) {
		Wisdom = wisdom;
	}

	/**
	 * @return the charisma
	 */
	public String getCharisma() {
		return Charisma;
	}

	/**
	 * @param charisma
	 *            the charisma to set
	 */
	public void setCharisma(String charisma) {
		Charisma = charisma;
	}

	/**
	 * @return the armorClass
	 */
	public String getArmorClass() {
		return ArmorClass;
	}

	/**
	 * @param armorClass
	 *            the armorClass to set
	 */
	public void setArmorClass(String armorClass) {
		ArmorClass = armorClass;
	}

	/**
	 * @return the inspiration
	 */
	public String getInspiration() {
		return Inspiration;
	}

	/**
	 * @param inspiration
	 *            the inspiration to set
	 */
	public void setInspiration(String inspiration) {
		Inspiration = inspiration;
	}

	/**
	 * @return the proficiency
	 */
	public String getProficiency() {
		return Proficiency;
	}

	/**
	 * @param proficiency
	 *            the proficiency to set
	 */
	public void setProficiency(String proficiency) {
		Proficiency = proficiency;
	}

	/**
	 * @return the acrobatics
	 */
	public String getAcrobatics() {
		return Acrobatics;
	}

	/**
	 * @param acrobatics
	 *            the acrobatics to set
	 */
	public void setAcrobatics(String acrobatics) {
		Acrobatics = acrobatics;
	}

	/**
	 * @return the animalHandling
	 */
	public String getAnimalHandling() {
		return AnimalHandling;
	}

	/**
	 * @param animalHandling
	 *            the animalHandling to set
	 */
	public void setAnimalHandling(String animalHandling) {
		AnimalHandling = animalHandling;
	}

	/**
	 * @return the arcana
	 */
	public String getArcana() {
		return Arcana;
	}

	/**
	 * @param arcana
	 *            the arcana to set
	 */
	public void setArcana(String arcana) {
		Arcana = arcana;
	}

	/**
	 * @return the athletics
	 */
	public String getAthletics() {
		return Athletics;
	}

	/**
	 * @param athletics
	 *            the athletics to set
	 */
	public void setAthletics(String athletics) {
		Athletics = athletics;
	}

	/**
	 * @return the deception
	 */
	public String getDeception() {
		return Deception;
	}

	/**
	 * @param deception
	 *            the deception to set
	 */
	public void setDeception(String deception) {
		Deception = deception;
	}

	/**
	 * @return the history
	 */
	public String getHistory() {
		return History;
	}

	/**
	 * @param history
	 *            the history to set
	 */
	public void setHistory(String history) {
		History = history;
	}

	/**
	 * @return the insight
	 */
	public String getInsight() {
		return Insight;
	}

	/**
	 * @param insight
	 *            the insight to set
	 */
	public void setInsight(String insight) {
		Insight = insight;
	}

	/**
	 * @return the intimidation
	 */
	public String getIntimidation() {
		return Intimidation;
	}

	/**
	 * @param intimidation
	 *            the intimidation to set
	 */
	public void setIntimidation(String intimidation) {
		Intimidation = intimidation;
	}

	/**
	 * @return the investigation
	 */
	public String getInvestigation() {
		return Investigation;
	}

	/**
	 * @param investigation
	 *            the investigation to set
	 */
	public void setInvestigation(String investigation) {
		Investigation = investigation;
	}

	/**
	 * @return the medicine
	 */
	public String getMedicine() {
		return Medicine;
	}

	/**
	 * @param medicine
	 *            the medicine to set
	 */
	public void setMedicine(String medicine) {
		Medicine = medicine;
	}

	/**
	 * @return the nature
	 */
	public String getNature() {
		return Nature;
	}

	/**
	 * @param nature
	 *            the nature to set
	 */
	public void setNature(String nature) {
		Nature = nature;
	}

	/**
	 * @return the perception
	 */
	public String getPerception() {
		return Perception;
	}

	/**
	 * @param perception
	 *            the perception to set
	 */
	public void setPerception(String perception) {
		Perception = perception;
	}

	/**
	 * @return the performance
	 */
	public String getPerformance() {
		return Performance;
	}

	/**
	 * @param performance
	 *            the performance to set
	 */
	public void setPerformance(String performance) {
		Performance = performance;
	}

	/**
	 * @return the persuasion
	 */
	public String getPersuasion() {
		return Persuasion;
	}

	/**
	 * @param persuasion
	 *            the persuasion to set
	 */
	public void setPersuasion(String persuasion) {
		Persuasion = persuasion;
	}

	/**
	 * @return the religion
	 */
	public String getReligion() {
		return Religion;
	}

	/**
	 * @param religion
	 *            the religion to set
	 */
	public void setReligion(String religion) {
		Religion = religion;
	}

	/**
	 * @return the sleightOfHand
	 */
	public String getSleightOfHand() {
		return SleightOfHand;
	}

	/**
	 * @param sleightOfHand
	 *            the sleightOfHand to set
	 */
	public void setSleightOfHand(String sleightOfHand) {
		SleightOfHand = sleightOfHand;
	}

	/**
	 * @return the stealth
	 */
	public String getStealth() {
		return Stealth;
	}

	/**
	 * @param stealth
	 *            the stealth to set
	 */
	public void setStealth(String stealth) {
		Stealth = stealth;
	}

	/**
	 * @return the survival
	 */
	public String getSurvival() {
		return Survival;
	}

	/**
	 * @param survival
	 *            the survival to set
	 */
	public void setSurvival(String survival) {
		Survival = survival;
	}

	/**
	 * @return the initiative
	 */
	public String getInitiative() {
		return Initiative;
	}

	/**
	 * @param initiative
	 *            the initiative to set
	 */
	public void setInitiative(String initiative) {
		Initiative = initiative;
	}

	/**
	 * @return the speed
	 */
	public String getSpeed() {
		return Speed;
	}

	/**
	 * @param speed
	 *            the speed to set
	 */
	public void setSpeed(String speed) {
		Speed = speed;
	}

	/**
	 * @return the health
	 */
	public String getHealth() {
		return Health;
	}

	/**
	 * @param health
	 *            the health to set
	 */
	public void setHealth(String health) {
		Health = health;
	}

	/**
	 * @return the deathSaveSuccess
	 */
	public String getDeathSaveSuccess() {
		return DeathSaveSuccess;
	}

	/**
	 * @param deathSaveSuccess
	 *            the deathSaveSuccess to set
	 */
	public void setDeathSaveSuccess(String deathSaveSuccess) {
		DeathSaveSuccess = deathSaveSuccess;
	}

	/**
	 * @return the deathSaveFail
	 */
	public String getDeathSaveFail() {
		return DeathSaveFail;
	}

	/**
	 * @param deathSaveFail
	 *            the deathSaveFail to set
	 */
	public void setDeathSaveFail(String deathSaveFail) {
		DeathSaveFail = deathSaveFail;
	}

	/**
	 * @return the attack
	 */
	public String getAttack() {
		return Attack;
	}

	/**
	 * @param attack
	 *            the attack to set
	 */
	public void setAttack(String attack) {
		Attack = attack;
	}

	/**
	 * @return the level
	 */
	public String getLevel() {
		return Level;
	}

	/**
	 * @param level
	 *            the level to set
	 */
	public void setLevel(String level) {
		Level = level;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return Name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		Name = name;
	}

	/**
	 * @return the experience
	 */
	public String getExperience() {
		return Experience;
	}

	/**
	 * @param experience
	 *            the experience to set
	 */
	public void setExperience(String experience) {
		Experience = experience;
	}

	/**
	 * @return the alignment
	 */
	public String getAlignment() {
		return Alignment;
	}

	/**
	 * @param alignment
	 *            the alignment to set
	 */
	public void setAlignment(String alignment) {
		Alignment = alignment;
	}

	/**
	 * @return the class
	 */
	public String getCharacterClass() {
		return CharacterClass;
	}

	/**
	 * @param class1
	 *            the class to set
	 */
	public void setCharacterClass(String class1) {
		CharacterClass = class1;
	}

	/**
	 * @return the age
	 */
	public String getAge() {
		return Age;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(String age) {
		Age = age;
	}

	/**
	 * @return the height
	 */
	public String getHeight() {
		return Height;
	}

	/**
	 * @param height
	 *            the height to set
	 */
	public void setHeight(String height) {
		Height = height;
	}

	/**
	 * @return the weight
	 */
	public String getWeight() {
		return Weight;
	}

	/**
	 * @param weight
	 *            the weight to set
	 */
	public void setWeight(String weight) {
		Weight = weight;
	}

	/**
	 * @return the eyeColor
	 */
	public String getEyeColor() {
		return EyeColor;
	}

	/**
	 * @param eyeColor
	 *            the eyeColor to set
	 */
	public void setEyeColor(String eyeColor) {
		EyeColor = eyeColor;
	}

	/**
	 * @return the skinColor
	 */
	public String getSkinColor() {
		return SkinColor;
	}

	/**
	 * @param skinColor
	 *            the skinColor to set
	 */
	public void setSkinColor(String skinColor) {
		SkinColor = skinColor;
	}

	/**
	 * @return the hairColor
	 */
	public String getHairColor() {
		return HairColor;
	}

	/**
	 * @param hairColor
	 *            the hairColor to set
	 */
	public void setHairColor(String hairColor) {
		HairColor = hairColor;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
        @Override
	public String toString() {
		return "CharacterBean [Strength=" + Strength + ", Dexterity="
				+ Dexterity + ", Constitution=" + Constitution
				+ ", Intelligence=" + Intelligence + ", Wisdom=" + Wisdom
				+ ", Charisma=" + Charisma + ", ArmorClass=" + ArmorClass
				+ ", Inspiration=" + Inspiration + ", Proficiency=" + Proficiency
				+ ", Acrobatics=" + Acrobatics + ", AnimalHandling="
				+ AnimalHandling + ", Arcana=" + Arcana + ", Athletics="
				+ Athletics + ", Deception=" + Deception + ", History="
				+ History + ", Insight=" + Insight + ", Initimidation="
				+ Intimidation + ", Investigation=" + Investigation
				+ ", Medicine=" + Medicine + ", Nature=" + Nature
				+ ", Perception=" + Perception + ", Performance=" + Performance
				+ ", Persuasion=" + Persuasion + ", Religon=" + Religion
				+ ", SleightOfHand=" + SleightOfHand + ", Stealth=" + Stealth
				+ ", Survival=" + Survival + ", Initiative=" + Initiative
				+ ", Speed=" + Speed + ", Health=" + Health
				+ ", DeathSaveSuccess=" + DeathSaveSuccess + ", DeathSaveFail="
				+ DeathSaveFail + ", Attack=" + Attack + ", Level=" + Level
				+ ", Name=" + Name + ", Experience=" + Experience
				+ ", Alignment=" + Alignment + ", Class=" + CharacterClass + ", Age="
				+ Age + ", Height=" + Height + ", Weight=" + Weight
				+ ", EyeColor=" + EyeColor + ", SkinColor=" + SkinColor
				+ ", HairColor=" + HairColor + "]";
	}

}

            </code></pre>
            <br/>
            <pre><code class="java">
package mybeans;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jason
 */

public class AccountBean implements java.io.Serializable
{
   private int Id;
   private String fName;
   private String lName;
   private String email;
   private String password;
   

   public AccountBean(String Fname, String LName, String email, String pass) {
       this.fName = Fname;
       this.lName = LName;
       this.email = email;
       this.password = pass;
   }
   public AccountBean(){
       
   }
   public void setId(int id){
       this.Id = id;
   }
   
   public void setPassword(String pass){
       this.password = pass;
   }
   public void setfName(String Name){
      this.fName = Name;
   }
   public void setlName(String Lname){
      this.lName = Lname;
   }
   public void setEmail(String email){
      this.email = email;
   }
   public String getfName(){
      return fName;
   }
   public String getlName(){
      return lName;
   }
   public int getId(){
       return Id;
   }
   public String getEmail(){
      return email;
   }
   public String getPassword(){
       return password;
   }
   
   @Override
   public String toString(){
        return fName+" "+lName+" "+email+".";
    }
}
            </code></pre>
            <br/>
            <pre><code>
&lt;%@page contentType="text/html" pageEncoding="UTF-8"%&gt;<br />
&lt;%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %&gt;<br />
<br />
&lt;html&gt; <br />
&lt;!-- Latest compiled and minified CSS --&gt;<br />
&lt;link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/&gt;<br />
<br />
&lt;!-- jQuery library --&gt;<br />
&lt;script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"&gt;&lt;/script&gt;<br />
<br />
&lt;!-- Latest compiled JavaScript --&gt;<br />
&lt;script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"&gt;&lt;/script&gt;<br />
<br />
<br />
        &lt;div class="left" style="padding-right: 150px;"/&gt;<br />
        &lt;div class="right" style="padding-left: 150px;"/&gt;<br />
    &lt;head&gt;<br />
        &lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;<br />
        &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;<br />
        &lt;title&gt;D&amp;D Manager&lt;/title&gt;<br />
    &lt;h3 style="padding-top: 100px;"&gt;&lt;/h3&gt;<br />
    &lt;/head&gt;<br />
    <br />
    &lt;form action="http://hoare.cs.umsl.edu/servlet/j-klamert/charmanager" method="GET"&gt;<br />
    &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Name:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="name" placeholder="Character Name" id="name"/&gt;<br />
    &lt;/div&gt;<br />
    &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Account ID:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="id" placeholder="Account ID" id="id"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;button class="btn btn-success" type="submit"&gt;Retrieve Character&lt;/button&gt;<br />
    &lt;/form&gt;<br />
    &lt;c:if test="${Status2 == true}"&gt;<br />
        &lt;div class="alert alert-success" role="alert"&gt;Your character was retrieved!&lt;/div&gt;<br />
    &lt;/c:if&gt;<br />
    &lt;c:if test="${Status2 == false}"&gt;<br />
        &lt;div class="alert alert-danger" role="alert"&gt;Your character was not found!&lt;/div&gt;<br />
    &lt;/c:if&gt;<br />
        <br />
    &lt;br/&gt;<br />
    &lt;form action="http://hoare.cs.umsl.edu/servlet/j-klamert/charmanager" method="POST"&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Account ID:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="ID" placeholder="Account ID" id="ID"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Strength:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Strength" placeholder="Character Strength" id="Strength"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Dexterity:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Dexterity" placeholder="Character Dexterity" id="Dexterity"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Constitution:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Constitution" placeholder="Character Constitution" id="Constitution"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Intelligence:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Intelligence" placeholder="Character Intelligence" id="Intelligence"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Wisdom:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Wisdom" placeholder="Character Wisdom" id="Wisdom"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Charisma:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Charisma" placeholder="Character Charisma" id="Charisma"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Insight:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Insight" placeholder="Character Insight" id="Insight"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Investigation:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Investigation" placeholder="Character Investigation" id="Investigation"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Medicine:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Medicine" placeholder="Character Medicine" id="Medicine"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Nature:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Nature" placeholder="Character Nature" id="Nature"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Perception:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Perception" placeholder="Character Perception" id="Perception"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Performance:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Performance" placeholder="Character Performance" id="Performance"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Persuasion:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Persuasion" placeholder="Character Persuasion" id="Persuasion"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character ArmorClass:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="ArmorClass" placeholder="Character ArmorClass" id="ArmorClass"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Inspiration:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Inspiration" placeholder="Character Inspiration" id="Inspiration"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Acrobatics:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Acrobatics" placeholder="Character Acrobatics" id="Acrobatics"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character AnimalHandling:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="AnimalHandling" placeholder="Character AnimalHandling" id="AnimalHandling"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Arcana:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Arcana" placeholder="Character Arcana" id="Arcana"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Athletics:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Athletics" placeholder="Character Athletics" id="Athletics"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Deception:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Deception" placeholder="Character Deception" id="Deception"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character History:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="History" placeholder="Character History" id="History"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character SleightOfHand:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="SleightOfHand" placeholder="Character SleightOfHand" id="SleightOfHand"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Stealth:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Stealth" placeholder="Character Stealth" id="Stealth"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Survival:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Survival" placeholder="Character Survival" id="Survival"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Initiative:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Initiative" placeholder="Character Initiative" id="Initiative"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Speed:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Speed" placeholder="Character Speed" id="Speed"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Health:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Health" placeholder="Character Health" id="Health"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character DeathSaveSuccess:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="DeathSaveSuccess" placeholder="Character DeathSaveSuccess" id="DeathSaveSuccess"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character DeathSaveFail:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="DeathSaveFail" placeholder="Character DeathSaveFail" id="DeathSaveFail"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Attack:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Attack" placeholder="Character Attack" id="Attack"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Level:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Level" placeholder="Character Level" id="Level"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Experience:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Experience" placeholder="Character Experience" id="Experience"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Alignment:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Alignment" placeholder="Character Alignment" id="Alignment"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character CharacterClass:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="CharacterClass" placeholder="Character CharacterClass" id="CharacterClass"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Age:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Age" placeholder="Character Age" id="Age"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Height:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Height" placeholder="Character Height" id="Height"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Weight:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Weight" placeholder="Character Weight" id="Weight"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character EyeColor:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="EyeColor" placeholder="Character EyeColor" id="EyeColor"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character SkinColor:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="SkinColor" placeholder="Character SkinColor" id="SkinColor"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character HairColor:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="HairColor" placeholder="Character HairColor" id="HairColor"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Proficiency:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Proficiency" placeholder="Character Proficiency" id="Proficiency"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Intimidation:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Intimidation" placeholder="Character Intimidation" id="Intimidation"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Religion:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Religion" placeholder="Character Religion" id="Religion"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;div class="form-group"&gt;<br />
        &lt;label for="InputCharacter"&gt;Character Name:&lt;/label&gt;<br />
        &lt;input class="form-control"  name="Name" placeholder="Character Religion" id="Name"/&gt;<br />
    &lt;/div&gt;<br />
        &lt;button class="btn btn-primary" type="submit"&gt;Create Character&lt;/button&gt;<br />
    &lt;/form&gt;<br />
    <br />
    &lt;c:if test="${Status == true}"&gt;<br />
        &lt;div class="alert alert-success" role="alert"&gt;The save was successful!&lt;/div&gt;<br />
    &lt;/c:if&gt;<br />
    &lt;c:if test="${Status == false}"&gt;<br />
        &lt;div class="alert alert-danger" role="alert"&gt;The save has failed!&lt;/div&gt;<br />
    &lt;/c:if&gt;<br />
    <br />
    &lt;br/&gt;<br />
    &lt;body class="center"&gt;<br />
        &lt;a href="http://hoare.cs.umsl.edu/servlet/j-klamert/redirect.jsp"&gt;&lt;u&gt;Source Information&lt;/u&gt;&lt;/a&gt;<br />
        &lt;div class="center"&gt;   <br />
<br />
            &lt;table class="table table-striped table-hover table-bordered"&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Strength:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Strength}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Dexterity:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Dexterity}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Constitution:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Constitution}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Intelligence:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Intelligence}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Wisdom:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Wisdom}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Charisma:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Charisma}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;ArmorClass:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.ArmorClass}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Inspiration:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Inspiration}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Proficiency:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Proficiency}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Acrobatics:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Acrobatics}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;AnimalHandling:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.AnimalHandling}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Arcana:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Arcana}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Athletics:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Athletics}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Deception:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Deception}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;History:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.History}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Insight:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Insight}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Intimidation:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Intimidation}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Investigation:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Investigation}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Medicine:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Medicine}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Nature:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Nature}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Perception:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Perception}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Performance:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Performance}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Persuasion:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Persuasion}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Religion:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Religion}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;SleightOfHand:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.SleightofHand}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Stealth:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Stealth}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Survival:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Survival}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Initiative:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Initiative}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Speed:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Speed}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Health:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Health}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;DeathSaveSuccess:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.DeathSaveSuccess}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;DeathSaveFail:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.DeathSaveFail}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Attack:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Attack}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Level:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Level}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Name:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Name}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Experience:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Experience}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Alignment:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Alignment}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;CharacterClass:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.CharacterClass}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Age:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Age}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Height:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Height}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;Weight:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.Weight}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;EyeColor:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.EyeColor}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;SkinColor:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.SkinColor}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
                &lt;tr&gt;<br />
                    &lt;td style="width: 50%;"&gt;HairColor:&lt;/td&gt;<br />
                    &lt;td&gt;&lt;c:out value="${cbean.HairColor}"/&gt;&lt;/td&gt;<br />
                &lt;/tr&gt;<br />
            &lt;/table&gt;<br />
<br />
        &lt;/div&gt;<br />
        &lt;div class="center bottom"&gt;&lt;b style="font-size: 11px;"&gt;This website is not affiliated, endorsed, or sponsored by Wizards of the Coast® or Hasbro®. Dungeons &amp; Dragons®, and D&amp;D® are registered trademarks of Wizards of the Coast®. Contact the Web Master at: jgk98f@umsl.edu&lt;/b&gt;&lt;/div&gt;<br />
    &lt;/body&gt; <br />
&lt;/html&gt;
</code></pre>
<code><pre>
&lt;%@page contentType="text/html" pageEncoding="UTF-8"%&gt;<br />
&lt;%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %&gt;<br />
&lt;html&gt;  <br />
&lt;!-- Latest compiled and minified CSS --&gt;<br />
&lt;link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/&gt;<br />
<br />
&lt;!-- jQuery library --&gt;<br />
&lt;script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"&gt;&lt;/script&gt;<br />
<br />
&lt;!-- Latest compiled JavaScript --&gt;<br />
&lt;script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"&gt;&lt;/script&gt;<br />
<br />
        &lt;div class="left" style="padding-right: 150px;"/&gt;<br />
        &lt;div class="right" style="padding-left: 150px;"/&gt;<br />
    &lt;head&gt;<br />
        &lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;<br />
        &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;<br />
        &lt;title&gt;D&amp;D Manager&lt;/title&gt;<br />
    &lt;h3 style="padding-top: 100px;"&gt;Welcome to the D&amp;D Manager, where your adventures come to life!&lt;/h3&gt;<br />
    &lt;/head&gt;<br />
    &lt;br/&gt;<br />
    &lt;body class="center"&gt;<br />
        <br />
        &lt;div class="center"&gt;<br />
            &lt;form class="form-group" action="http://hoare.cs.umsl.edu/servlet/j-klamert/Login" method="POST"&gt;<br />
                &lt;fieldset&gt;<br />
                    &lt;legend&gt;Account Information&lt;/legend&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputEmail"&gt;Email address:&lt;/label&gt;<br />
                        &lt;input type="email" class="form-control" name="email" id="email" placeholder="Email"/&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputPassword"&gt;Password:&lt;/label&gt;<br />
                        &lt;input type="password" class="form-control" name="password" id="password" placeholder="Password"&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;button type="submit" class="btn btn-primary btn-primary:hover btn-primary:focus"&gt;<br />
                    Submit<br />
                    &lt;/button&gt;<br />
                    &lt;a href="http://hoare.cs.umsl.edu/servlet/j-klamert/success.jsp" class="btn btn-warning btn-warning:hover btn-warning:focus" type="button"&gt;Register Here&lt;/a&gt;<br />
                &lt;/fieldset&gt;<br />
            &lt;/form&gt;<br />
            <br />
        &lt;/div&gt;<br />
        &lt;a href="http://hoare.cs.umsl.edu/servlet/j-klamert/redirect.jsp"&gt;&lt;u&gt;Source Information&lt;/u&gt;&lt;/a&gt;<br />
        &lt;div&gt;&lt;b style="font-size: 11px;"&gt;This website is not affiliated, endorsed, or sponsored by Wizards of the Coast® or Hasbro®. Dungeons &amp; Dragons®, and D&amp;D® are registered trademarks of Wizards of the Coast®. Contact the Web Master at: jgk98f@umsl.edu&lt;/b&gt;&lt;/div&gt;<br />
    &lt;/body&gt; <br />
&lt;/html&gt;
</pre></code>
<pre><code>
&lt;%@page contentType="text/html" pageEncoding="UTF-8"%&gt;<br />
&lt;%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %&gt;<br />
&lt;html&gt;  <br />
&lt;!-- Latest compiled and minified CSS --&gt;<br />
&lt;link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"&gt;<br />
<br />
&lt;!-- jQuery library --&gt;<br />
&lt;script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"&gt;&lt;/script&gt;<br />
<br />
&lt;!-- Latest compiled JavaScript --&gt;<br />
&lt;script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"&gt;&lt;/script&gt;<br />
<br />
        &lt;div class="left" style="padding-right: 150px;"/&gt;<br />
        &lt;div class="right" style="padding-left: 150px;"/&gt;<br />
    &lt;head&gt;<br />
        &lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&gt;<br />
        &lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;<br />
        &lt;title&gt;D&amp;D Manager Registration&lt;/title&gt;<br />
    &lt;h3 style="padding-top: 100px;"&gt;Welcome to the registry!&lt;/h3&gt;<br />
    &lt;/head&gt;<br />
    &lt;br/&gt;<br />
    &lt;body class="center"&gt; <br />
        &lt;form class="form-group" action="http://hoare.cs.umsl.edu/servlet/j-klamert/registry" method="POST"&gt;<br />
                &lt;fieldset&gt;<br />
                    &lt;legend&gt;Account Information&lt;/legend&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputFname"&gt;First Name:&lt;/label&gt;<br />
                        &lt;input class="form-control"  name="Fname" placeholder="First Name" id="Fname"/&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputLname"&gt;Last Name:&lt;/label&gt;<br />
                        &lt;input class="form-control" name="Lname" placeholder="Last Name" id="Lname"/&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputEmail"&gt;Email address:&lt;/label&gt;<br />
                        &lt;input type="email" class="form-control" name="email" id="email" placeholder="Email"/&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;div class="form-group"&gt;<br />
                        &lt;label for="InputPassword"&gt;Password:&lt;/label&gt;<br />
                        &lt;input type="password" class="form-control" name="password" id="password" placeholder="Password"&gt;<br />
                    &lt;/div&gt;<br />
                    &lt;button type="submit" class="btn btn-primary btn-primary:hover btn-primary:focus"&gt;<br />
                    Submit<br />
                    &lt;/button&gt;<br />
                    &lt;a class="btn btn-warning btn-warning:hover btn-warning:focus" href="http://hoare.cs.umsl.edu/servlet/j-klamert/Login" type="button"&gt;Return to Sign-In&lt;/a&gt;<br />
                &lt;/fieldset&gt;<br />
            &lt;/form&gt;<br />
            &lt;c:if test="${Status == true}"&gt;<br />
                &lt;div class="alert alert-success" role="alert"&gt;The registry was successful! Your account id is ${ID}&lt;/div&gt;<br />
            &lt;/c:if&gt;<br />
            &lt;c:if test="${Status == false}"&gt;<br />
                &lt;div class="alert alert-danger" role="alert"&gt;The registry has failed!&lt;/div&gt;<br />
            &lt;/c:if&gt;<br />
            <br />
        &lt;div&gt;&lt;b style="font-size: 11px;"&gt;This website is not affiliated, endorsed, or sponsored by Wizards of the Coast� or Hasbro�. Dungeons &amp; Dragons�, and D&amp;D� are registered trademarks of Wizards of the Coast�. Contact the Web Master at: jgk98f@umsl.edu&lt;/b&gt;&lt;/div&gt;<br />
    &lt;/body&gt; <br />
&lt;/html&gt;
</code></pre>
        </div>
        <div><b style="font-size: 11px;">This website is not affiliated, endorsed, or sponsored by Wizards of the Coast® or Hasbro®. Dungeons & Dragons®, and D&D® are registered trademarks of Wizards of the Coast®. Contact the Web Master at: jgk98f@umsl.edu</b></div>
    </body> 
</html>