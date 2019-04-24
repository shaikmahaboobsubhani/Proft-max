<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="com.bean.RegisterBean"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'NewUserAccept.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->



<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #B0C4DE}

th {
    background-color: #4CAF50;
    color: white;
}
</style>





  </head>
  
  <jsp:include page="Header.jsp"></jsp:include>
  
 
  
  <body>
   
             <main class="container">
            <div class="row">
            <br/>
                
                <!-- Main content -->
                
                <div class="col-md-4">
                    <article>
                    
                     <center> <h2 class="article-title">Users</h2> </center>
                      
                      
                      
                      
                      
                      
                      <center>
		
			<div style="height: 300px;; width: 500px; background-color: #00BFFF margin: 20px;">
			
							<%
								String userinfo = request.getParameter("status");
								if (userinfo != null) {

								}
								try
								{
								HashMap hmpro = (HashMap) session.getAttribute("hmpro");
							if(hmpro.size()>0)
							{

								String msg = (String) session.getAttribute("acceptuser");
								session.setAttribute("acceptuser", " ");
								if (msg!= null) {
							%>
							<label style="color: #20B2AA; size: 20px;" ><%=msg%></label>
							<%
								}
								else
								{
								out.println("No Pending Requests");
								}
							%>
						<table>
			<tr>
			<td>

					<%
						if (hmpro.size() > 0) {
					%>
						  <tr>
						  
						  
                         
                            &nbsp;&nbsp;<th>Userid</th>
                           &nbsp;&nbsp;&nbsp; <th>Name</th>
                            &nbsp;<th>UserType</th>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <th>RequestUser</th>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<th>DeleteUser</th>
                             
                           </tr>
			
					<%
						for (int i = 1; i <= hmpro.size(); i++) {
								RegisterBean rb= (RegisterBean) hmpro.get(i);
					%>
					<tr>
					
					
					
						<td>
							<%=rb.getUserid()%>
						</td>
						<td>
							<%=rb.getUsertype()%>
						</td>
						<td>
							<%=rb.getUsername()%>
						</td>
						
						<td>
							 <a
								href="BrokerAcceptAccount.jsp?id=<%=rb.getUserid()%>">accept account</a> 
						</td>
						<td>
							 <a
								href="DeleteAccount.jsp?id=<%=rb.getUserid()%>">Delete</a> 
						</td>
					</tr>
					<%
						}
						}
						}
						else
						{
						out.println("no recrods found");
						}
						}
						catch(Exception e)
						{
					out.println("no recrods found");
						}
					%>
		
			
			</table>
			
</div>
<!--  <div  style="height: 30px;; width: 500px; background-color:#FFA500; margin: 20px;"></div>
			</div> -->
		</center>
                      
                      
                      
          </div>
          </div>
                    
                      
                      
                      
                      
                      
                      
                      
      
    
    
    
  </body>
</html>
