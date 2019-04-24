<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<%@page import="com.dao.NewUserAcceptance"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'RejectAccount.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  
  <jsp:include page="Header.jsp"></jsp:include>

  
  
  <body>
    
            
                 <main class="container">
            <div class="row">
            <br/>
                <!-- Main content -->
                
                <div class="col-md-4">
                    <article>
                    
                      <h2 class="article-title"></h2>
                      
                      
                      
                      
                      
                    <%
   String id=request.getParameter("userid");
   new NewUserAcceptance().rejectProduct(id);
    session.setAttribute("acceptproduct","Product active now");
   
   session.setAttribute("rejectproduct","Product is rejected now");
   
    String target = "./NewProductBrokerRequest";
		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);
   
    %>  
                      
       </div>
       </div>               
    
    
    
   
  </body>
</html>
