<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Connection"%>

<%@page import="com.dao.ProductDetailsDao"%>
<%@page import="com.util.Dbconnection"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.sql.PreparedStatement"%>

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
  	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 
<%
       String userid=request.getParameter("id");
       String q=request.getParameter("id1");
       String machines=request.getParameter("machines");
       
   try
   {
  Dbconnection dc=new Dbconnection();
  Connection con = dc.getConnection();
	     			             
	     		
    PreparedStatement st=con.prepareStatement("update request set status='ACCEPTED' where status='PENDING' and quantity='"+q+"' and machines='"+machines+"' and loginid='"+userid+"' ");
   
    System.out.println("cccccccccccc............"+q);
    st.executeUpdate();
   session.setAttribute("acceptproduct","Product active now");
                response.sendRedirect("ViewUserRequest.jsp?status=Request Processing");
    }
    catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("ViewUserRequest.jsp??status= Failed");
    }
  
%>
  </body>
</html>
