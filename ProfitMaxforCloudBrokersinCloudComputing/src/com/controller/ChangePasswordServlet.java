package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



	//import com.nit.dao.Changepassworddao;
import com.bean.*;
import com.dao.ChangePasswordDao;

	public class ChangePasswordServlet extends HttpServlet {

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
			
			HttpSession session = request.getSession();
			String userid=(String)session.getAttribute("userid");
			String target = "ChangePassword.jsp?status=Please enter correct old password......";
			
			RegisterBean b=new RegisterBean();
			b.setPassword(request.getParameter("password"));
			b.setNpassword(request.getParameter("npassword"));
			
			
		
			b.setUserid(userid);
			
			boolean f=	new ChangePasswordDao().changePassword(b);
			if(f==true){
				
				target = "ChangePassword.jsp?status=Your Password is changed ......";
			}
			else{
				
				target = "ChangePassword.jsp?status=Please enter correct old password......";
			}

			   RequestDispatcher rd = request.getRequestDispatcher(target);
			   rd.forward(request,response);    
			out.flush();
			out.close();
			}


			public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doGet(request,response);
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			out.flush();
			out.close();
			}
			}
