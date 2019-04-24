
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.*" %>
<%@page import="com.bean.*" %>


<html>

<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 60%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

</head>




<jsp:include page="Header.jsp"></jsp:include>





<body>

<br/>
<br/>
<center>
<form action="./UpdateProductServlet" >
<%
				String u = (String) session.getAttribute("userid");
				if (u == null) {
					String target = "Login.jsp?status=Please enter username and password";
					RequestDispatcher rd = request.getRequestDispatcher(target);
					rd.forward(request, response);
				}
				
				
				int pid=Integer.parseInt(request.getParameter("pid"));
				
ProductDetailsDao dao=new ProductDetailsDao();	
			
HashMap hm=dao.getSpecificProduct(pid);

for(int i=1;i<=hm.size();i++)
{
ProductBean b=(ProductBean)hm.get(i);



%>				
<table>
<tr>
<td>PID</td><td><%=b.getPid() %></td></tr>
<tr><td>Machines</td><td><input type="textbox" name="machines" value="<%=b.getMachines() %>" required/></td></tr>
<tr><td>Available</td><td><input type="textbox" name="available" value="<%=b.getAvailable() %>" required/></td></tr>
<tr><td>Price</td><td><input type="textbox" name="price" value="<%=b.getPrice() %>" required/></td></tr>


<tr><td></td><td><input type="hidden" name="pid" value="<%=b.getPid()%>"/></td></tr>
</tr>

</table>

<br/>
<br/>
<input type="submit" value="Save"> 

<%
}

 %>

   </form>
   
   </center>
   
</body>
</html>
