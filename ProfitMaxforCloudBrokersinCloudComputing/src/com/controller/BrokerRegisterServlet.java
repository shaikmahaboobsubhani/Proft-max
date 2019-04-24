package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bean.RegisterBean;
import com.dao.LoginDao;
import com.dao.ProfileDAO;

public class BrokerRegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();
RegisterBean rb=new RegisterBean();


String username=request.getParameter("username");
String lastname=request.getParameter("lastname");
String userid=request.getParameter("userid");

String password=request.getParameter("password");

String confirmpassword=request.getParameter("confirmpassword");

String email=request.getParameter("email");

String phone=request.getParameter("phone");

String gender=request.getParameter("gender");
String usertype=request.getParameter("usertype");


rb.setUsername(username);


rb.setLastname(lastname);
rb.setUserid(userid);
rb.setPassword(password);
rb.setConfirmpassword(confirmpassword);
rb.setEmail(email);
rb.setPhone(phone);
rb.setGender(gender);
rb.setUsertype(usertype);




//rb.setUserType("USER");

String target = "BrokerRegistration.jsp?status=Registration Failed  !!!!!";
boolean flag1=new ProfileDAO().checkLoginIDExisted(request.getParameter("uid"));
if(flag1==true){
	 target = "BrokerRegistration.jsp?status=This "+flag1+" login ID is not present!!";
}
else{
	boolean f=new ProfileDAO().insertLoginInfo(rb);
	boolean f1=new ProfileDAO().insertUserInfo(rb);
	if(f==true&&f1==true){
	target = "Login.jsp?status=Welcome Account is created successfully";
	}else{
		target = "BrokerRegistration.jsp?status=Registration Failed  !!!!!";	
	}
}
RequestDispatcher rd = request.getRequestDispatcher(target);
rd.forward(request,response);  

out.flush();
out.close();
}


public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

response.setContentType("text/html");
PrintWriter out = response.getWriter();
doGet(request,response);
out.flush();
out.close();
}
}
