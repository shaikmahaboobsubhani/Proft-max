package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.RegisterBean;
import com.util.Dbconnection;




public class ChangePasswordDao {

	 public boolean changePassword(RegisterBean reb)
	    {
		 
		 boolean flag=false ;
		 
		 
	    	 	 String uid=reb.getUserid();
	    		 String pass=reb.getPassword();
	    		 String npass=reb.getNpassword();
	    		 
	      
	        
	    		 Connection con;
	 			
	 			try {
	 				
	 				con=Dbconnection.getConnection();
	 				

	           int i;
	           int i1;
	           String q="update LOGININFO set PASSWORD='"+npass+"' where LOGINID='"+uid+"' and PASSWORD='"+pass+"'";
	           System.out.println(q);
	           i=con.createStatement().executeUpdate(q);
	           
	           String q2="update USERINFO set PASSWORD='"+npass+"',CONFIRMPASSWORD='"+npass+"' where USERID='"+uid+"' and PASSWORD='"+pass+"'";
	           System.out.println(q2);
	           
	           i1=con.createStatement().executeUpdate(q2);
	           
	           
	           
	           
	        
	            if(i==1&&i1==1)
	            {
	                flag=true;
	                con.commit();
	            }
	            
	        }
	        catch (SQLException ex) 
	        {
	            ex.printStackTrace();
	            flag=false;
	           
	        }
	        
	       
	        return flag;
	    }
	   
		
	

}
