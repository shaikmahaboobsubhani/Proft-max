package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import com.bean.ProductBean;
import com.bean.RegisterBean;
import com.util.Dbconnection;

public class NewProductAcceptance {

	Connection con;


	private boolean flag;

	
	
	public boolean deleteNewUserAccount(String loginid){
		
		 try {
			 con=Dbconnection.getConnection();
			 PreparedStatement ps=con.prepareStatement("delete LOGININFO where LOGINID='"+loginid+"'");
			 PreparedStatement ps1=con.prepareStatement("delete USERINFO where LOGINID='"+loginid+"'");
			 int i=0;
			 int i2=0;
			 i=ps.executeUpdate();
			 i2=ps1.executeUpdate();
			 if(i>0 && i2>0){
				 flag=true;
				 
			 }
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		 finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
		
		return flag;
		
		
		
	}
	public boolean rejectUser(String loginid){
		try{
			
			con=Dbconnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update LOGININFO  set status=2 where LOGINID='"+loginid+"'");
			int i=0;
			i=ps.executeUpdate();
			if(i>0){
				 flag=true;
				
			}
		}
			catch (Exception e) {
				System.out.println(e);
					}
			
			
			 finally {
		        	try {
		        	if (con != null)
		        	con.close();
		        	} catch (SQLException e) {
		        	}
		        	}
			
			
			return flag;
			
		}
		
	public boolean getAcceptNewUser(String loginid) {
		try {
			
			
			con=Dbconnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update LOGININFO set status=1 where LOGINID='"+ loginid + "' and utype='USER'");
			int i = 0;
			i = ps.executeUpdate();
			if (i > 0) {
				flag = true;

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		 finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
		
		return flag;
	}
	
	
	
	
	
	
	
	
	public boolean getAcceptNewBroker(String loginid) {
		try {
			
			
			con=Dbconnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update LOGININFO set status=1 where LOGINID='"+ loginid + "' and utype='BROKER'");
			int i = 0;
			i = ps.executeUpdate();
			if (i > 0) {
				flag = true;

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		 finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
		
		return flag;
	}
	
	
	
	
	
	
	
	

	public HashMap getUserProducts(){
	  HashMap hm=new HashMap();
	  try {
		  
		  
		  con=Dbconnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select request.LOGINID,request.MACHINES,request.QUANTITY,request.RID from request where request.status='PENDING' ");
			int i = 0;
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				ProductBean pbean = new ProductBean();
				pbean.setUserid(rs.getString(1));
				pbean.setMachines(rs.getString(2));
				pbean.setQuantity(rs.getString(3));
				pbean.setRid(4);
				
				i = i + 1;
				hm.put(i, pbean);

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		 finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
		
		return hm;
	}

	
	
	
	public HashMap getBroker(){
		  HashMap hm=new HashMap();
		  try {
			  
			  
			  con=Dbconnection.getConnection();
				PreparedStatement ps = con
						.prepareStatement("select * FROM LOGININFO where STATUS='0' and utype='BROKER'");
				int i = 0;
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					RegisterBean rbean = new RegisterBean();
					rbean.setUserid(rs.getString(1));
					rbean.setUserid(rs.getString(2));
					rbean.setUsertype(rs.getString(3));
					rbean.setUsername(rs.getString(4));
					i = i + 1;
					hm.put(i, rbean);

				}
			} catch (Exception e) {
				System.out.println(e);
			}
			
			
			 finally {
		        	try {
		        	if (con != null)
		        	con.close();
		        	} catch (SQLException e) {
		        	}
		        	}
			
			return hm;
		}

		
	
	
	
	
	public boolean rejectProduct(String loginid){
		try{
			
			con=Dbconnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update REQUEST  set status=2 where LOGINID='"+loginid+"'");
			int i=0;
			i=ps.executeUpdate();
			if(i>0){
				 flag=true;
				
			}
		}
			catch (Exception e) {
				System.out.println(e);
					}
			
			
			 finally {
		        	try {
		        	if (con != null)
		        	con.close();
		        	} catch (SQLException e) {
		        	}
		        	}
			
			
			return flag;
			
		}
	
	
	
	
	
	
	public boolean getAcceptNewProduct(String loginid) {
		try {
			
			
			con=Dbconnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update LOGININFO set status=ACCEPTED where LOGINID='"+ loginid + "' and utype='USER'");
			int i = 0;
			i = ps.executeUpdate();
			if (i > 0) {
				flag = true;

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		 finally {
	        	try {
	        	if (con != null)
	        	con.close();
	        	} catch (SQLException e) {
	        	}
	        	}
		
		return flag;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public HashMap getBrokerProducts(){
		  HashMap hm=new HashMap();
		  try {
			  
			  
			  con=Dbconnection.getConnection();
				PreparedStatement ps = con
						.prepareStatement("select request.LOGINID,request.MACHINES,request.QUANTITY,request.rid from request where request.status='PROCESS' ");
				int i = 0;
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					ProductBean pbean = new ProductBean();
					pbean.setUserid(rs.getString(1));
					pbean.setMachines(rs.getString(2));
					pbean.setQuantity(rs.getString(3));
					pbean.setRid(4);
					
					i = i + 1;
					hm.put(i, pbean);

				}
			} catch (Exception e) {
				System.out.println(e);
			}
			
			
			 finally {
		        	try {
		        	if (con != null)
		        	con.close();
		        	} catch (SQLException e) {
		        	}
		        	}
			
			return hm;
		}

		
	
	
	
	
	
	
	}


