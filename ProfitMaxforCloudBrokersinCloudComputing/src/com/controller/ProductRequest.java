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

public class ProductRequest extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProductRequest() {
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

		String target;
		
		
		
		
		String machines=request.getParameter("machines");
		
		
		String quantity=request.getParameter("quantity");
		ProductBean pb=new ProductBean();
		HttpSession hs=request.getSession();
		String userid=(String)hs.getAttribute("userid");
		
     	String rid=request.getParameter("rid");
     	
		
		
		pb.setUserid(userid);
		
		String price=request.getParameter("price");
		
		pb.setMachines(machines);
		pb.setQuantity(quantity);
		
		pb.setPrice(price);
		
		
		
		
		 target = "ProductUserRequest.jsp?status=Insertion Failed  !!!!!";
		
		boolean f=new ProductDetailsDao().insertProductRequestInfo(pb,userid);
		
		request.setAttribute("rid", rid);
		
		if(f==true){
		target = "ProductUserRequest.jsp?status= Inserted Successfully ";
		}else{
			target = "ProductUserRequest.jsp?status=Insertion Failed  !!!!!";	
		}
	
	RequestDispatcher rd = request.getRequestDispatcher(target);
	rd.forward(request,response);  

	
	
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
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
