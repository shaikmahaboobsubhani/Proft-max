package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.dao.LoginDao;

import com.bean.RegisterBean;
import com.dao.LoginDao;
import com.service.LoginServiceImpl;
import com.service.LoginServicei;


public class LoginServlet extends HttpServlet {

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

		
		
		
		
		String usertype="";
	     String username="";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
	
		RegisterBean rb=new RegisterBean();
	
		String target = "Login.jsp?status=Invalid username and password";
		
		try
		{
		
		
		
		HttpSession session = request.getSession();
		
		
		//session.setAttribute("userid",userid);
		
		rb.setUserid(userid);
		rb.setPassword(password);
		
		
		RegisterBean rb1=new RegisterBean();
		
		LoginDao dao=new LoginDao();
		/*LoginServicei ls=new LoginServiceImpl();*/
	
		rb1=dao.loginCheck(rb);
		
		usertype=rb1.getUsertype();
		username=rb1.getUsername();

		
		
		session.setAttribute("role",usertype);
		System.out.println("uuuuuuuuu"+usertype);
		
		
		
		//session.setAttribute("userid", request.getParameter("userid"));
		
        if(usertype.equals("CLOUD"))
        {          
           target = "CloudHome.jsp?status=Welcome "+userid;
           session.setAttribute("userid",userid);
           session.setAttribute("role",usertype);
        } 
        else if(usertype.equals("USER"))
        {
           target = "CloudUserHome.jsp?status=Welcome "+userid;  	
           session.setAttribute("userid",userid);
           session.setAttribute("role",usertype);
           
        } 
        else if(usertype.equals("BROKER"))
        {
           target = "BrokerHome.jsp?status=Welcome "+userid;  	
           session.setAttribute("userid",userid);
           session.setAttribute("role",usertype);
           
        } 
        else { 
           target = "Login.jsp?status=Invalid username and password";
           }  
		}
		catch (Exception e) {
			// TODO: handle exception
			
			target = "Login.jsp?status=Invalid username and password";
			
		}
	
       RequestDispatcher rd = request.getRequestDispatcher(target);
       rd.forward(request,response);    
	
		out.flush();
		out.close();
	}
		
		
		
		
	}


