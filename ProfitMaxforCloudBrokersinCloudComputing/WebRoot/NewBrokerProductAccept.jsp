<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="com.bean.ProductBean"%>



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
                    
                     <center> <h2 class="article-title">UserProducts</h2> </center>
                      
                      
                      
                      
                      
                      
                      <center>
		
			<div style="height: 300px;; width: 500px; background-color: #00BFFF margin: 20px;">
			
							<%
								String status = request.getParameter("status");
								if (status != null) {

								}
								try
								{
								HashMap hmpro = (HashMap) session.getAttribute("hmpro");
							if(hmpro.size()>0)
							{

								String msg = (String) session.getAttribute("acceptproduct");
								session.setAttribute("acceptproduct", " ");
								if (msg!= null) {
							%>
							<label style="color: #20B2AA; size: 20px;" ><%-- <%=msg%> --%></label>
							<%
								}
								else
								{
								out.println("");
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
                           &nbsp;&nbsp;&nbsp; <th>MachineName</th>
                         &nbsp;&nbsp;&nbsp; <th> Quantity</th>
                           
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <th>RequestProduct</th>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<th>DeleteProduct</th>
                             
                           </tr>
			
					<%
						for (int i = 1; i <= hmpro.size(); i++) {
								ProductBean rb= (ProductBean) hmpro.get(i);
					%>
					<tr>
					
					
					
						<td>
							<%=rb.getUserid()%>
						</td>
						
						<td>
							<%=rb.getMachines()%>
						</td>
						
						<td>
							<%=rb.getQuantity()%>
						</td>
						
						
						
						
						<td>
							 <a
								href="AcceptBrokerMachines.jsp?id=<%=rb.getUserid()%>&quantity=<%=rb.getQuantity()%>&machines=<%=rb.getMachines()%>">acceptproduct</a> 
						</td>
						<td>
							 <a
								href="RejectBrokerMachines.jsp?id=<%=rb.getUserid()%>">Delete</a> 
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
