<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.ProductDetailsDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.RegisterBean"%>

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

	
<jsp:include page="Header.jsp"></jsp:include>
<br/><br/>
  </head>
    <% if(request.getParameter("status")!=null) 
					  {%>
                           <h3 style=color:red><center><strong><%=request.getParameter("status")%></strong></center></h3>
                      <%}%>
  <body>
  
  
  
  
  
      <h3 align="center" style="color: #cc0066">View Status</h3>
  
  <table align="center">
  <tr>
<th style="text-align: center;color: #99004d">RequestId</th>
<th style="text-align: center;color: #99004d">machines</th>
<th style="text-align: center;color: #99004d">quantity</th>
<!--<th style="text-align: center;color: #99004d">Price</th>
--><th style="text-align: center;color: #99004d">status</th>
<!--<th style="text-align: center;color: #99004d">LoginId</th>
-->

</tr>



<% ProductDetailsDao dao=new ProductDetailsDao();
ArrayList<ProductBean> al=dao.updateNewProductRequest();

 if(al.size()!=0){	
   %>    <%for (ProductBean pb:al){ %>


<tr><td><%=pb.getRid()%></td>
<td><%=pb.getMachines()%></td>

<td>
<%=pb.getQuantity()%>
</td>


<td>
<%=pb.getStatus()%>
</td>

<%--<td>
<%=pb.getPrice()%>
</td> --%>

<%
if(!pb.getStatus().equals("Accepted"))
{
 %>
<td><a href="AcceptMachines.jsp?id=<%=pb.getUserid()%>"><%=pb.getStatus()%></a></td>
<%
}
else
{
out.println("<td>Accepted</td>");
}
 %>



<td><input type="button" value="Update"></a></td>



</tr>		 <%} %>
								
																					     
							<%}else{ %>
							 Records Not Found
					<%} %>
							
							
			
				</table>
														









</form>


  </body>
</html>
