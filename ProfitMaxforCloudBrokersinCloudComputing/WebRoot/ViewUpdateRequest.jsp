<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.bean.ProductBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewgroupinfo.jsp' starting page</title>
    
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
  <%
				String u = (String) session.getAttribute("userid");
				if (u == null) {
					String target = "Login.jsp?status=Please enter username and password";
					RequestDispatcher rd = request.getRequestDispatcher(target);
					rd.forward(request, response);
				}
			%>
    <%
    
    ArrayList<ProductBean> al=new ArrayList<ProductBean>();
    al=(ArrayList)session.getAttribute("list");
     %>
     <center><h2>View Details</h2>
     <%
            String status=request.getParameter("status");
            if(status !=null){
           
           out.println("<font color='red'>"+status+"</font>");
            }

             %>
     <div style="background-color:#AFEEEE; height: auto; width:800px;">
     
     <table width="800" height="50" border="1px" align="center">
     
     <tr style="background-color:#FFA07A; color: white;">
     <th></th>
     <th>RequestID</th>
     <th>Machines</th>
     <th>Quantity</th>
     <th>status</th>
     <th></th>
     <th></th>
     </tr>
     
     
    
     <%
     int i=0;
     
     for(ProductBean pb:al){
     i++;
      %>
      <tr>
      <td>
     <%=i%>
      </td>
    <td>
     <%=pb.getRid()%>
      </td>
     <td>
     <%=pb.getMachines()%>
      </td>
    <td>
     <%=pb.getQuantity()%>
     </td>
     
     <td>
     <%=pb.getStatus()%>
     </td>
     
     
     </tr>
     
     <%} %>
     </table>
    </div>
    </center>
  </body>
</html>
