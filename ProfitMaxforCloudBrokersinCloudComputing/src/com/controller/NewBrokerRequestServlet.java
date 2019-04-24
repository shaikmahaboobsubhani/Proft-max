package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.NewUserAcceptance;

public class NewBrokerRequestServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewBrokerRequestServlet() {
		super();
	}
	

		public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	HttpSession session=request.getSession();
	String userid=(String)session.getAttribute("userid");


	HashMap hmpro=new NewUserAcceptance().getBroker();
	if(hmpro.size()>0){
	session.setAttribute("hmpro", hmpro);
	}


	String target="NewBrokerAccept.jsp?status=New Register Member";
	RequestDispatcher rd=request.getRequestDispatcher(target);
	rd.forward(request, response);
	out.flush();
	out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

	response.setContentType("text/html");
	PrintWriter out = response.getWriter();
	doGet(request, response);

	out.flush();
	out.close();
	}



	}
