<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.ProductDetailsDao"%>

<%@page import="com.bean.ProductBean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    
    <title>Cloud</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/table.css">

	<style type="text/css">
	
	td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}
	
	</style>
	
	
	
	
<jsp:include page="Header.jsp"></jsp:include>
<br/><br/>
  </head>
    <% if(request.getParameter("status")!=null) 
					  {%>
                           <h3 style=color:red><center><strong><%=request.getParameter("status")%></strong></center></h3>
                      <%}%>
  <body>
      <h3 align="center" style="color: #cc0066">View Details</h3>
  
  <table align="center">
  <tr>
&nbsp;<th style="text-align: center;color: #99004d">Pid</th>
&nbsp;&nbsp;&nbsp;<th style="text-align: center;color: #99004d">Machines</th>
&nbsp;&nbsp;&nbsp;<th style="text-align: center;color: #99004d">Available</th>

&nbsp;&nbsp;&nbsp;<th style="text-align: center;color: #99004d">Price</th>

&nbsp;&nbsp;&nbsp;<th style="text-align: center;color: #99004d">Action</th>


</tr>



<% ProductDetailsDao dao=new ProductDetailsDao();
ArrayList<ProductBean> al=dao.viewProducts();

 if(al.size()!=0){	
   %>    <%for (ProductBean pb:al){ %>


<tr>&nbsp;<td><%=pb.getPid()%></td>

&nbsp;&nbsp;&nbsp;<td><%=pb.getMachines()%></td>

&nbsp;&nbsp;&nbsp;<td><%=pb.getAvailable()%></td>

&nbsp;&nbsp;&nbsp;<td>
<%=pb.getPrice()%>
</td>


&nbsp;&nbsp;&nbsp;<td><a href="EditProduct.jsp?pid=<%=pb.getPid() %>">Edit</a></td>
 



<%
}
}
 %>




</tr>		
							
							
			
				</table>
														

  </body>
</html>
