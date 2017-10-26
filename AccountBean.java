package mybeans;
import java.util.ArrayList;
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