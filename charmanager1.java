import java.sql.*;
import mybeans.CharacterBean;

 
public class charmanager1   {
    
       // JDBC driver name and database URL
       static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
       static final String DB_URL = "jdbc:mysql://localhost/cs4010";

       //  Database credentials
       static final String USER = "cs4010";
       static final String PASS = "cs4010";
    

    public static void main(String[] args){
        new charmanager1();
    
    } 
    public charmanager1(){
   try{

        String name = "cs4010";
        String ID = "1";
        
        CharacterBean cbean = new CharacterBean();
        cbean = setCharacters(Integer.parseInt(ID),name);
      //  request.setAttribute("cbean",cbean); 
      //  rd = request.getRequestDispatcher("/cmanager.jsp");
     //   try{rd.forward(request, response);}
        System.out.println(cbean.getId());
        }catch(Exception ex3){ex3.printStackTrace();}
    }
    

    
    public CharacterBean setCharacters(int id, String name){
        
      
        Connection conn = null;
        Statement stmt = null;
        CharacterBean list = new CharacterBean();
        
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
            
//            sql = "SELECT * FROM CharacterBean WHERE this_AccountBean='" + userAccountId + "' AND Name='" + name + "'";
            sql = "SELECT * FROM CharacterBean WHERE this_AccountBean=1 ";
            ResultSet rs = stmt.executeQuery(sql);
            
            //STEP 5: Extract data from result set
            while (rs.next()) {
                list.setId(rs.getInt("this_AccountBean"));
                list.setStrength(rs.getString("Strength"));
                list.setDexterity(rs.getString("Dexterity"));
              list.setConstitution (rs.getString("Constitution"));
                list.setIntelligence(rs.getString("Intelligence"));
                list.setWisdom(rs.getString("Wisdom"));
                list.setCharisma(rs.getString("Charisma"));
                list.setArmorClass(rs.getString("ArmorClass"));
                list.setInspiration(rs.getString("Inspiration"));
                list.setProficiency(rs.getString("Proficieny"));
                list.setAcrobatics(rs.getString("Acrobatics"));
                list.setAnimalHandling(rs.getString("AnimalHandling"));
                list.setArcana(rs.getString("Arcana"));
                list.setAthletics(rs.getString("Athletics"));
                list.setDeception(rs.getString("Deception"));
                list.setHistory(rs.getString("History"));
                list.setInsight(rs.getString("Insight"));
                list.setIntimidation(rs.getString("Intimidation"));
                list.setInvestigation(rs.getString("Investigation"));
                list.setMedicine(rs.getString("Medicine"));
                list.setNature(rs.getString("Nature"));
                list.setPerception(rs.getString("Perception"));
                list.setPerformance(rs.getString("Performance"));
                list.setPersuasion(rs.getString("Persuasion"));
                list.setReligion(rs.getString("Religon"));
                list.setSleightOfHand(rs.getString("SleightOfHand"));
                list.setStealth(rs.getString("Stealth"));
                list.setSurvival(rs.getString("Survival"));
                list.setInitiative(rs.getString("Initiative"));
                list.setSpeed(rs.getString("Speed"));
                list.setHealth(rs.getString("Health"));
                list.setDeathSaveSuccess(rs.getString("DeathSaveSuccess"));
                list.setDeathSaveFail(rs.getString("DeathSaveFail"));
                list.setAttack(rs.getString("Attack"));
                list.setLevel(rs.getString("Level"));
                list.setName(rs.getString("Name"));
                list.setExperience(rs.getString("Experience"));
                list.setAlignment(rs.getString("Alignment"));
                list.setCharacterClass(rs.getString("CharacterClass"));
                list.setAge(rs.getString("Age"));
                list.setHeight(rs.getString("Height"));
                list.setWeight(rs.getString("Weight"));
                list.setEyeColor(rs.getString("EyeColor"));
                list.setSkinColor(rs.getString("SkingColor"));
                list.setHairColor(rs.getString("HairColor"));
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