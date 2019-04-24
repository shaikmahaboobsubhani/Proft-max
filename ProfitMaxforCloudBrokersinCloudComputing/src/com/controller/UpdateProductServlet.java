package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ProductBean;
import com.dao.ProductDetailsDao;

public class UpdateProductServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateProductServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		  String id=request.getParameter("pid");  
	        int pid=Integer.parseInt(id);  
	        
	        String machines=request.getParameter("machines");  
	        
	        String available=request.getParameter("available");  
	        String price=request.getParameter("price");  
	        
	        ProductBean pb=new ProductBean();
	        
	          
	        pb.setPid(pid);
	        pb.setMachines(machines);
	        
	        pb.setAvailable(available);
	        pb.setPrice(price);
	        
	        
	        
	        int status=ProductDetailsDao.update(pb);  
	        if(status>0){  
	            response.sendRedirect("ViewProduct.jsp?status=Successfully Modified");  
	        }else{  
	            out.println("Sorry! unable to update record");  
	        }  
	          
	        out.close();  
	    }  
		  
     

	
	
	
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
