<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="com.dao.NewUserAcceptance"%>



<%

HttpServletResponse httpResponse = (HttpServletResponse)response;

httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
httpResponse.setHeader("Pragma","no-cache"); 
httpResponse.setDateHeader ("Expires", 0); 

String uid=(String)session.getAttribute("userid");
if(uid==null)
{
	
	response.sendRedirect("Login.jsp?status=Please Enter UserName and Password");
	return ;
}
%>








<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AcceptAccount.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   
   
            
             <main class="container">
            <div class="row">
            <br/>
                
                <!-- Main content -->
                
                <div class="col-md-4">
                    <article>
                    
                      <h2 class="article-title">User Accounts</h2>
   
   
   
    <% 
       String id=request.getParameter("id");
      new NewUserAcceptance().getAcceptNewUser(id);
 
      session.setAttribute("acceptuser","Account active now");
  
  // call a method to change the staus the
         String target = "./NewUserRequestServlet";
		 RequestDispatcher rd = request.getRequestDispatcher(target);
		 rd.forward(request, response);
  
   %>
   
   
   
   </div>
   </div>
  
   
   
  </body>
</html>
