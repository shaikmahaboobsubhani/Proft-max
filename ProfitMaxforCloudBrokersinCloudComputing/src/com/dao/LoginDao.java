package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.RegisterBean;


import com.util.Dbconnection;

public class LoginDao implements LoginDaoi{
	
	
	 Connection con;
	
	
	
	 public RegisterBean loginCheck(RegisterBean regbean)
	    {
	        String userid=regbean.getUserid();
	        String password=regbean.getPassword();
	       
	        
	       
	        
	        RegisterBean regbean1=new RegisterBean();
	           try
	        {
	        	   con=Dbconnection.getConnection();
	            
	            PreparedStatement pst=con.prepareStatement("select UTYPE,USERNAME from LOGININFO where LOGINID=? and PASSWORD=? and STATUS='1'");
	            pst.setString(1,userid);
	            pst.setString(2,password);
	            
	            ResultSet rs=pst.executeQuery();
	           
	            if(rs.next())
	            {
	            	regbean1.setUsertype(rs.getString(1));
	            	regbean1.setUsername(rs.getString(2));            
	            }
	           
	        }
	        catch (SQLException ex) 
	        {
	        	ex.printStackTrace();
	        }
	        
	        
	        finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
	       
	        return regbean1;
	    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}




