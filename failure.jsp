<%-- 
    Document   : failure
    Created on : Dec 2, 2015, 1:30:27 PM
    Author     : Jason
--%>


INSERT INTO CharacterBean ( this_AccountBean,Strength,Dexterity,Constitution,Intelligence,Wisdom,Charisma,ArmorClass,Inspiration,Proficiency,Acrobatics,AnimalHandling,Arcana,Athletics,Deception,History,Insight,Intimidation,Investigation,Medicine,Nature,Perception,Performance,Persuasion,Religion,SleightOfHand,Stealth,Survival,Initiative,Speed,Health,DeathSaveSuccess,DeathSaveFail,Attack,Level,Name,Experience,Alignment,CharacterClass,Age,Height,Weight,EyeColor,SkinColor,HairColor VALUES ('this_AccountBean','Strength','Dexterity','Constitution','Intelligence','Wisdom','Charisma','ArmorClass','Inspiration','Proficiency','Acrobatics','AnimalHandling','Arcana','Athletics','Deception','History','Insight','Intimidation','Investigation','Medicine','Nature','Perception','Performance','Persuasion','Religion','SleightOfHand','Stealth','Survival','Initiative','Speed','Health','DeathSaveSuccess','DeathSaveFail','Attack','Level','Name','Experience','Alignment','CharacterClass','Age,'Height','Weight','EyeColor','SkinColor','HairColor');




<%@page import="javax.servlet.*,javax.servlet.http.*,mybeans.CharacterBean"%>
<%
String name = request.getParameter("charname");
         CharacterBean character = new CharacterBean();
            int number = 1;
            character.setCharacters(number,name);
            request.setAttribute("character",character);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
//    private CharacterBean [] getCharacters(HttpServletRequest request){
//        
//      
//        Connection conn = null;
//        Statement stmt = null;
//        int count = 0;
//        CharacterBean [] list = null;
//        
//        try {
//            //STEP 2: Register JDBC driver
//            Class.forName("com.mysql.jdbc.Driver");
//
//            //STEP 3: Open a connection
//            System.out.println("Connecting to database...");
//            conn = DriverManager.getConnection(DB_URL,USER,PASS);
//
//            //STEP 4: Execute a query
//            System.out.println("Creating statement...");
//            stmt = conn.createStatement();
//            String sql;
//            int userAccountId = (int) request.getAttribute("ID");
//            
////          sql = "SELECT account_id, fname, lname, email FROM AccountBean";
//          sql = "SELECT * FROM CharacterBean WHERE this_AccountBean = \'" + userAccountId + "\'";
////            sql = "SELECT * FROM CharacterBean WHERE this_AccountBean = '1'";
//            ResultSet rs = stmt.executeQuery(sql);
//            
//            
//            
//            //STEP 5: Extract data from result set
//            while (rs.next()) {
////                list.setId(rs.getInt("this_AccountBean"));
////                list.setStrength(rs.getString("Strength"));
////                list.setDexterity(rs.getString("Dexterity"));
////                list.setConstitution (rs.getString("Constitution "));
////                list.setIntelligence(rs.getString("Intelligence"));
////                list.setWisdom(rs.getString("Wisdom"));
////                list.setCharisma(rs.getString("Charisma"));
////                list.setArmorClass(rs.getString("ArmorClass"));
////                list.setInspiration(rs.getString("Inspiration"));
////                list.setProficieny(rs.getString("Proficieny"));
////                list.setAcrobatics(rs.getString("Acrobatics"));
////                list.setAnimalHandling(rs.getString("AnimalHandling"));
////                list.setArcana(rs.getString("Arcana"));
////                list.setAthletics(rs.getString("Athletics"));
////                list.setDeception(rs.getString("Deception"));
////                list.setHistory(rs.getString("History"));
////                list.setInsight(rs.getString("Insight"));
////                list.setInitimidation(rs.getString("Initimidation"));
////                list.setInvestigation(rs.getString("Investigation"));
////                list.setMedicine(rs.getString("Medicine"));
////                list.setNature(rs.getString("Nature"));
////                list.setPerception(rs.getString("Perception"));
////                list.setPerformance(rs.getString("Performance"));
////                list.setPersuasion(rs.getString("Persuasion"));
////                list.setReligon(rs.getString("Religon"));
////                list.setSleightOfHand(rs.getString("SleightOfHand"));
////                list.setStealth(rs.getString("Stealth"));
////                list.setSurvival(rs.getString("Survival"));
////                list.setInitiative(rs.getString("Initiative"));
////                list.setSpeed(rs.getString("Speed"));
////                list.setHealth(rs.getString("Health"));
////                list.setDeathSaveSuccess(rs.getString("DeathSaveSuccess"));
////                list.setDeathSaveFail(rs.getString("DeathSaveFail"));
////                list.setAttack(rs.getString("Attack"));
////                list.setLevel(rs.getString("Level"));
////                list.setName(rs.getString("Name"));
////                list.setExperience(rs.getString("Experience"));
////                list.setAlignment(rs.getString("Alignment"));
////                list.setCharacterClass(rs.getString("CharacterClass"));
////                list.setAge(rs.getString("Age"));
////                list.setHeight(rs.getString("Height"));
////                list.setWeight(rs.getString("Weight"));
////                list.setEyeColor(rs.getString("EyeColor"));
////                list.setSkinColor(rs.getString("SkingColor"));
////                list.setHairColor(rs.getString("HairColor"));
//                //Retrieve by column name
//                list[count].setId(rs.getInt("this_AccountBean"));
//                list[count].setStrength(rs.getString("Strength"));
//                list[count].setDexterity(rs.getString("Dexterity"));
//                list[count].setConstitution (rs.getString("Constitution "));
//                list[count].setIntelligence(rs.getString("Intelligence"));
//                list[count].setWisdom(rs.getString("Wisdom"));
//                list[count].setCharisma(rs.getString("Charisma"));
//                list[count].setArmorClass(rs.getString("ArmorClass"));
//                list[count].setInspiration(rs.getString("Inspiration"));
//                list[count].setProficieny(rs.getString("Proficieny"));
//                list[count].setAcrobatics(rs.getString("Acrobatics"));
//                list[count].setAnimalHandling(rs.getString("AnimalHandling"));
//                list[count].setArcana(rs.getString("Arcana"));
//                list[count].setAthletics(rs.getString("Athletics"));
//                list[count].setDeception(rs.getString("Deception"));
//                list[count].setHistory(rs.getString("History"));
//                list[count].setInsight(rs.getString("Insight"));
//                list[count].setInitimidation(rs.getString("Initimidation"));
//                list[count].setInvestigation(rs.getString("Investigation"));
//                list[count].setMedicine(rs.getString("Medicine"));
//                list[count].setNature(rs.getString("Nature"));
//                list[count].setPerception(rs.getString("Perception"));
//                list[count].setPerformance(rs.getString("Performance"));
//                list[count].setPersuasion(rs.getString("Persuasion"));
//                list[count].setReligon(rs.getString("Religon"));
//                list[count].setSleightOfHand(rs.getString("SleightOfHand"));
//                list[count].setStealth(rs.getString("Stealth"));
//                list[count].setSurvival(rs.getString("Survival"));
//                list[count].setInitiative(rs.getString("Initiative"));
//                list[count].setSpeed(rs.getString("Speed"));
//                list[count].setHealth(rs.getString("Health"));
//                list[count].setDeathSaveSuccess(rs.getString("DeathSaveSuccess"));
//                list[count].setDeathSaveFail(rs.getString("DeathSaveFail"));
//                list[count].setAttack(rs.getString("Attack"));
//                list[count].setLevel(rs.getString("Level"));
//                list[count].setName(rs.getString("Name"));
//                list[count].setExperience(rs.getString("Experience"));
//                list[count].setAlignment(rs.getString("Alignment"));
//                list[count].setCharacterClass(rs.getString("CharacterClass"));
//                list[count].setAge(rs.getString("Age"));
//                list[count].setHeight(rs.getString("Height"));
//                list[count].setWeight(rs.getString("Weight"));
//                list[count].setEyeColor(rs.getString("EyeColor"));
//                list[count].setSkinColor(rs.getString("SkingColor"));
//                list[count].setHairColor(rs.getString("HairColor"));
//                count++;
//            }
//            //STEP 6: Clean-up environment
//            rs.close();
//            stmt.close();
//            conn.close();
//        } catch (SQLException se) {
//            //Handle errors for JDBC
//            se.printStackTrace();
//        } catch (Exception e) {
//            //Handle errors for Class.forName
//            e.printStackTrace();
//        } finally {
//            //finally block used to close resources
//            try {
//                if (stmt!=null)
//                    stmt.close();
//            } catch (SQLException se2) {
//            }// nothing we can do
//            try {
//                if (conn!=null)
//                    conn.close();
//            } catch (SQLException se) {
//                se.printStackTrace();
//            }//end finally try
//        }//end try
//    return list;
//    }