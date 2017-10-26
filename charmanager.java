
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