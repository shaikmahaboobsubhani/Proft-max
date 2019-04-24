package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProductBean;
import com.dao.ProductDetailsDao;
import com.dao.ProfileDAO;

public class ProductDetailsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductDetailsServlet() {
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
		
		
		String machines=request.getParameter("machines");
		
		
		String available=request.getParameter("available");
		
		
		String price=request.getParameter("price");
		
		
		HttpSession hs=request.getSession();
		
		ProductBean pb=new ProductBean();
		
		hs.setAttribute("machines",machines);
		
		pb.setMachines(machines);
		
		pb.setAvailable(available);
		pb.setPrice(price);
		
		
		
		String target = "AddProduct.jsp?status=Insertion Failed  !!!!!";
		
		
		
		
		
		
		boolean flag1=new ProductDetailsDao().checkProductIDExisted(request.getParameter("machines"));
		if(flag1==true){
			 target = "AddProduct.jsp?status=This "+flag1+" Product machines are not present!!";
		}
		else{
			boolean f=new ProductDetailsDao().insertProductInfo(pb);
			
			if(f==true){
			target = "AddProduct.jsp?status= Inserted Successfully ";
			}else{
				target = "AddProduct.jsp?status=Insertion Failed  !!!!!";	
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request,response);  

		
		
		
		
		
		
		
		
		
		
		
		
		
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
