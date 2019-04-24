<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<body>
		<table>
			<tr>
				<td>
				</td>
			</tr>
		</table>
		<c:choose>
			<c:when test="${sessionScope.role eq'CLOUD'}">
				<jsp:include page="./CloudMenu.jsp" />
			</c:when>
			<c:when test="${sessionScope.role eq 'USER'}">
				<jsp:include page="./CloudUserMenu.jsp" />
			</c:when>
			<c:when test="${sessionScope.role eq 'BROKER'}">
				<jsp:include page="./BrokerMenu.jsp" />
			</c:when>
			
			<c:when test="${sessionScope.role eq null}">
				<jsp:include page="./HomeMenu.jsp" />
			</c:when>
		</c:choose>
		<br>
		<br>
		<br>
		<font color="red">
		<center>
		<b> <c:if test="${requestScope.status!='null'}">
				<c:out value="${requestScope.status}"></c:out>
			</c:if> </b>
		</font>
		</center>
	</body>
</html>