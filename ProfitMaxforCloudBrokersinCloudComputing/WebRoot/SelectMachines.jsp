<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>



<%@ page import="com.bean.*,com.dao.*,java.util.*"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ViewCategory.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	-->
  		<link href="css/styles.css" rel="stylesheet" type="text/css" media="all" />


<style type="text/css">


select
{
width:250px;
    }

 

</style>



  </head>
  <jsp:include page="Header.jsp"></jsp:include>
  
  
  
  
  
  
  <%
String user=(String)session.getAttribute("role");
if(user==null)
{
response.sendRedirect("Login.jsp?status=Please Enter username and password");
}
%>
  
  
  
  
  <%
  ProductDetailsDao dao=new ProductDetailsDao();
  List<String> machinesList=dao.getProducts();
  
   %>
  
  
<body style="background-image:url('img/res10.jpeg');background-repeat: no-repeat; background-size: cover;">
    
    <center>
    
    <h2><font color=#b30059 size="5">Select Machines</font></h2>
    
  
<!--    <form action="./CategoryServlet" method="post">-->

<form action="AddSelectedMachines.jsp">

    <table>
    
    
    <tr>
    
							<td>
								Select Items
							</td>
							
							<td>
								<select name="machines" multiple="multiple"  align='center'  style="width:250px"; required>
									<%
									for(String str:machinesList)
									{
									
									 %>
									 <option width=100><%=str %></option>
									 <%
									 }
									  %>
									
									
									

									</select>
		  		</td>
		  		</tr>
		  		
		  	
		  		
		  		
		  		
		  		<tr></tr>
		  		
		  		<tr>
		  		<td></td>
		  		
		  		<br/>
		  		<br/>
		  		
		  		<td>
		  		
		  		<input type="submit" value="Submit"/>
		  		</td>
		  		</tr>
		  		
		  		</table>
		  		</form>
		  		</center>
		  		</body>
		  		</html>
									
									
									
									
									
								