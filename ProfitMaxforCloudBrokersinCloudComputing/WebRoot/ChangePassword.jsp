<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'ChangePassword.jsp' starting page</title>

		<link href="css/a.css" rel="stylesheet" type="text/css" media="all" />
		
		<script>
              var password = document.getElementById("password")
            , confirm_password = document.getElementById("confirm_password");
            function validatePassword(){
                if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                confirm_password.setCustomValidity('');
                }
            }
            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;       
        </script>

		<script type="text/javascript">
function validator() {

	document.getElementById("msgoldpass").innerHTML = "";
	document.getElementById("msgnewpass").innerHTML = "";
	document.getElementById("msgchangedpass").innerHTML = "";
	document.getElementById("alertmsg").innerHTML = "";

	if (document.getElementById("opass").value == "") {

		document.getElementById("msgoldpass").innerHTML = "Plealse Enter Old Password";
		return false;
	} else if (document.getElementById("password").value == "") {

		document.getElementById("msgnewpass").innerHTML = "Plealse Enter New Password";
		return false;
	} else if (document.getElementById("confirm_password").value == "") {
		document.getElementById("msgchangedpass").innerHTML = "Plealse Enter Confirm Password";
		return false;
	} else if (document.getElementById("confirm_password").value != document
			.getElementById("password").value) {
		document.getElementById("alertmsg").innerHTML = "New Password is not matched with confirm password";
		return false;

	}

}
</script>

	</head>

	<body>
<center>
		<%
			String u = (String) session.getAttribute("userid");
			if (u == null) {
				String target = "Login.jsp?status=Please enter username and password";
				RequestDispatcher rd = request.getRequestDispatcher(target);
				rd.forward(request, response);
			}
		%>
		<div style="width: 100%; height: auto; margin-top: -15px;">
			
			<%
					String role = (String) session.getAttribute("role");
					if (role.equals("CLOUD")) {
				%>
				<div style="margin-top: -5px;"><jsp:include page="CloudMenu.jsp"></jsp:include></div>
				<%
					}
					if (role.equals("USER")) {
				%>
				<div style="margin-top: -3px;"><jsp:include page="CloudUserMenu.jsp"></jsp:include></div>
				<%
					}
					
					if(role.equals("BROKER")){
					
					
					
				%>
				<div style="margin-top: -3px;"><jsp:include page="BrokerMenu.jsp"></jsp:include></div>

<%
}
 %>
			<div class="signup" style="margin-top: -1px; width: 100%;">
				<center>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>

<form action="./ChangePasswordServlet"  onsubmit="return validator();>
					<table>
						<tr>
							<td colspan="2" style="">
								<label
									style="color: red; font-style: italic; text-align: center;">
									<%
										String status = request.getParameter("status");
										if (status != null) {
											out.println(status);
										}
									%>
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<p>
									Old Password :
									<span class="dot">*</span>
								</p>
							</td>
							<td>
								<input type="password" name="password" id="opass"
									class="input_password" value="" required>
								<label id="msgoldpass"
									style="color: red; font-size: 16px; font-style: italic;"></label>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<p>
									New Password :
									<span class="dot">*</span>
								</p>
							</td>


							<td>
								<input type="password" name="npassword" id="password""
									class="input_password" value=""  required>
								<label id="msgnewpass"
									style="color: red; font-size: 16px; font-style: italic;">
								</label>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<p>
									Confirm Password :
									<span class="dot">*</span>
								</p>
							</td>
							<td>
								<input type="password" name="confirmpassword" id="confirm_password"
									class="input_password" value=""  required>
								<label id="msgchangedpass"
									style="color: red; font-size: 16px; font-style: italic;"></label>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<label id="alertmsg"
									style="color: red; font-size: 16px; font-style: italic;"></label>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input type="submit" class="submit" value="Change Password">
							</td>
						</tr>
					</table>
				</form> 
				</center>
			</div>
			<div style="margin-top: -3px;">
				
			</div>
		</div>
		</center>
	</body>
</html>
