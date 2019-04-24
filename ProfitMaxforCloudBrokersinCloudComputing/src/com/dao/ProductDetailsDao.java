package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.bean.ProductBean;
import com.bean.RegisterBean;
import com.util.Dbconnection;

public class ProductDetailsDao {
	
	private boolean flag;
	
	
	public boolean checkProductIDExisted(String machines) {
		boolean f=false;
		Connection con;
		
		try {
			
			con=Dbconnection.getConnection();
			
			PreparedStatement ps=con.prepareStatement("select * FROM PRODUCTDETAILS Where MACHINES=?");
			ps.setString(1, machines);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				f=true;
		}
		}

		catch (Exception e) {
			System.out.println(e);
		}

		return f;
		}

	
	
	
	
	
	 public boolean insertProductInfo(ProductBean pb)
	    {
		 
		 
		 
		 
		 String  machines=pb.getMachines();
		 
		 
		                  String available=pb.getAvailable();
		                 String price= pb.getPrice();
		 
		 
		 
		 
	    	 	 
	    		 Connection con;
	        try 
	        {
	        	con=Dbconnection.getConnection();
	          
	           PreparedStatement pst=null;
	           int i=0;
	          pst=con.prepareStatement("insert into PRODUCTDETAILS values((select nvl(max(pid),0)+1 from PRODUCTDETAILS),?,?,?)");                        
	           pst.setString(1,machines);
	           pst.setString(2,available);
	           pst.setString(3,price);
	           
	          
	           i=pst.executeUpdate();
	            if(i==1)
	            {
	                flag=true;
	                con.commit();
	            }
	            else
	            {
	                flag=false;
	                con.rollback();
	            }      
	        } 
	        catch (SQLException ex) 
	        {
	          
	        }
	        return flag;
	    }
	
	
	
	 
	 
	 public ArrayList<ProductBean> viewProducts() throws SQLException {
			

			
			ArrayList<ProductBean> list=new ArrayList<ProductBean>();
			
			
			 Connection con;
		        try 
		        {
		        	con=Dbconnection.getConnection();
			
			
				PreparedStatement ps=con.prepareStatement("select * from PRODUCTDETAILS ");
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					ProductBean pb=new ProductBean();
					
					String pid1=rs.getString(1);
					int pid=Integer.parseInt(pid1);
					pb.setPid(pid);
					
					String machines=rs.getString(2);
					
					pb.setMachines(machines);
					
                String available=rs.getString(3);
					
					pb.setAvailable(available);
					
					
					 String price=rs.getString(4);
					 
						
						pb.setPrice(price);
						
					
					
					
					
					
					
					list.add(pb);
					
				}
				ps.close();
				rs.close();
				
				
			}
			catch(Exception e){
				System.out.println(e);
			}

			return list;
		}

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 public static int update(ProductBean pb){  
	        int status=0;  
	        
	        Connection con;
	        try 
	        {
	        	con=Dbconnection.getConnection();
	           
	        	
	            PreparedStatement ps=con.prepareStatement(  
	                         "update PRODUCTDETAILS set MACHINES=?,AVAILABLE=?,PRICE=? where pid=?");  
	            
	            ps.setString(1,pb.getMachines());  
	            
	            ps.setString(2,pb.getAvailable());  
	            ps.setString(3,pb.getPrice());  
	          
	            ps.setInt(4,pb.getPid());  
	              
	            status=ps.executeUpdate();  
	              
	            con.close();  
	        }catch(Exception ex){ex.printStackTrace();}  
	          
	        return status;  
	    }  
	 
	 
	 
	 
	 
	 
	 public HashMap getSpecificProduct(int  pid)
		{
			HashMap hm=new HashMap();
		
	
			 Connection con;
		        try 
		        {
		        	con=Dbconnection.getConnection();
			
			
			int i=0;
			
			PreparedStatement pst=con.prepareStatement("select pid,machines,available,price from PRODUCTDETAILS where pid=?");
			
			pst.setInt(1, pid);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				i++;
				
				ProductBean pb=new ProductBean();
				
				pb.setPid(rs.getInt(1));
				
				
				pb.setMachines(rs.getString(2));
				
				
				pb.setAvailable(rs.getString(3));
				
				pb.setPrice(rs.getString(4));
				
				
				hm.put(i,pb);
				
				
			}
			
			pst.close();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return hm;
		
		} 
	 
	 
	 
	
	 
	 
	 
	 public boolean insertProductRequestInfo(ProductBean pb, String userid)
	    {
		 
		 System.out.println("userid:"+userid);
		 
		 
		 String  machines=pb.getMachines();
		 
		 
		                  String quantity=pb.getQuantity();
		                 String price= pb.getPrice();
		 
		 
		 
		 
	    	 	 
	    		 Connection con;
	        try 
	        {
	        	con=Dbconnection.getConnection();
	          
	           PreparedStatement pst=null;
	           int i=0;
	           System.out.println("hiiiiiiiiiiiiiiii");
	          pst=con.prepareStatement("insert into REQUEST values((select nvl(max(rid),0)+1 from REQUEST),?,?,?,?)");                        
	          System.out.println("wwwwwwwwwww");
	          pst.setString(1,machines);
	           pst.setString(2,quantity);
	          
	           pst.setString(3, "PENDING");
	           
	           pst.setString(4,userid);
	           
	           i=pst.executeUpdate();
	           
	           System.out.println("uuuuuuuuuuuuuuuu"+i);
	            if(i==1)
	            {
	                flag=true;
	                con.commit();
	            }
	            
	        } 
	        catch (SQLException ex) 
	        {
	          ex.printStackTrace();
	        }
	        return flag;
	    }
	
	
	
	 
	 
	 
	 
	 
	 
	 
	 public ArrayList<ProductBean> viewProductRequest() throws SQLException {
			

			
			ArrayList<ProductBean> list=new ArrayList<ProductBean>();
			
			 Connection con;
		        try 
		        {
		        	con=Dbconnection.getConnection();
				
				
				
				PreparedStatement ps=con.prepareStatement("select * from request");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					ProductBean pb=new ProductBean();
					int rid=rs.getInt(1);
					
				
					pb.setRid(rid);
					
				
					String machines=rs.getString(2);
					
					pb.setMachines(machines);
					String quantity=rs.getString(3);
					pb.setQuantity(quantity);


					

					String status=rs.getString(4);
					
					pb.setStatus(status);

					String userid=rs.getString(5);
					
					
					pb.setUserid(userid);
					
					
					list.add(pb);
					
				}
				
				
				
			}
			catch(Exception e){
				System.out.println(e);
			}

			return list;
		}
	 
	 
	 
	 public List<String> getProducts()
		{
			List<String> list=new ArrayList<String>();
			
			try {
				Connection con=Dbconnection.getConnection();
				PreparedStatement pst=con.prepareStatement("select MACHINES from PRODUCTDETAILS where MACHINES='machines'");
				ResultSet rs=pst.executeQuery();
				while(rs.next())
				{
					
					
					
					list.add(rs.getString(1));
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
			
			
		}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 public int getPrice(String machines)
		{
			int price=0;
			try
			{
				
			
			Connection con=Dbconnection.getConnection();
			PreparedStatement pst=con.prepareStatement("select price from PRODUCTDETAILS where MACHINES=? ");
			pst.setString(1, machines);
			
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				price=Integer.parseInt(rs.getString(1));
			}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		return price;	
		}
	
	
	 
	 
	 
	 
	 public  ArrayList<ProductBean> updateNewProductRequest(){
		 
		 ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		 
		 boolean flag=false;
		 Connection con=null;
			
		 try {
				 con=Dbconnection.getConnection();
			 PreparedStatement ps=con.prepareStatement("update request set='PROCESS' where status='PENDING'");
			 int i=0;
			 int i2=0;
			 
			 i=ps.executeUpdate();
			 
			 PreparedStatement ps1=con.prepareStatement("select rid,machines,quantity,status,loginid from request");
			 
			 
			 ResultSet rs;
			 
			 
				rs=ps1.executeQuery();
			 
			 
			
			 
			 while (rs.next()) {
				 
				 ProductBean pb=new ProductBean();
				int rid= rs.getInt(1);
				 
				 
				String machines=rs.getString(2);
				
				String quantity=rs.getString(3);
				
				String status=rs.getString(5);
				pb.setRid(rid);
				pb.setMachines(machines);
				pb.setQuantity(quantity);
				pb.setStatus(status);
				 
				 list.add(pb);
				 
				 
				 
				
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
		
		return list;
		
		
		
	}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
public  ArrayList<ProductBean> priceCal(){
		 
		 ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		 
		 boolean flag=false;
		 Connection con=null;
			
		 try {
				 con=Dbconnection.getConnection();
				 PreparedStatement ps1=con.prepareStatement("select quantity from request where machines=? and loginid=?");
				 
			 PreparedStatement ps=con.prepareStatement("update PRODUCTDETAILS p set p.available=AVAILABLE-(select r.quantity from where p.machines=r.machines) where status='ACCEPTED'");
			 int i=0;
			 int i2=0;
			 
			 i=ps.executeUpdate();
			 
			 PreparedStatement ps3=con.prepareStatement("select rid,machines,quantity,status,loginid from request");
			 
			 
			 ResultSet rs;
			 
			 
				rs=ps1.executeQuery();
			 
			 
			
			 
			 while (rs.next()) {
				 
				 ProductBean pb=new ProductBean();
				int rid= rs.getInt(1);
				 
				 
				String machines=rs.getString(2);
				
				String quantity=rs.getString(3);
				
				String status=rs.getString(5);
				pb.setRid(rid);
				pb.setMachines(machines);
				pb.setQuantity(quantity);
				pb.setStatus(status);
				 
				 list.add(pb);
				 
				 
				 
				
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
		
		return list;
		
		
		
	}
	 
	 
	 
	 
	 




public ArrayList<ProductBean> viewTaskAllocator() throws SQLException {
	

	
	ArrayList<ProductBean> list=new ArrayList<ProductBean>();
	
	 Connection con;
        try 
        {
        	con=Dbconnection.getConnection();
		
		
		
		PreparedStatement ps=con.prepareStatement("select * from request where status='ACCEPTED'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			ProductBean pb=new ProductBean();
			int rid=rs.getInt(1);
			
		
			pb.setRid(rid);
			
		
			String machines=rs.getString(2);
			
			pb.setMachines(machines);
			String quantity=rs.getString(3);
			pb.setQuantity(quantity);


			

			String status=rs.getString(4);
			
			pb.setStatus(status);

			String userid=rs.getString(5);
			
			
			pb.setUserid(userid);
			
			
			list.add(pb);
			
		}
		
		
		
	}
	catch(Exception e){
		System.out.println(e);
	}

	return list;
}

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
	

}
