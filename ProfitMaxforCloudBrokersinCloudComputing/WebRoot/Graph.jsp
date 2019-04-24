<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@page import="com.dao.*" %>
<%@page import="com.bean.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>dd</title>

		<!-- Bootstrap -->
		<!--<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/responsive-slider.css" rel="stylesheet">
		<link rel="stylesheet" href="css/animate.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link href="css/style.css" rel="stylesheet">
	--></head>

	<!-- Bootstrap core CSS	<link href="assets/css/bootstrap.css" rel="stylesheet"> -->



	<!-- Custom styles for this template --><!--
	<link href="assets/css/main.css" rel="stylesheet">

	<script src="https://code.jquery.com/jquery-1.10.2.min.js">
</script>
	<script src="assets/js/hover.zoom.js">
</script>
	<script src="assets/js/hover.zoom.conf.js">
</script>





	--><script src="js/jquery.min.js" type="text/javascript">
</script>
	<script src="js/highcharts.js" type="text/javascript">
</script>

	<script type="text/javascript">

Highcharts.visualize = function(table, options) {
	// the categories
	options.xAxis.categories = [];
	$('tbody th', table).each(function(i) {
		options.xAxis.categories.push(this.innerHTML);
	});

	options.series = [];
	$('tr', table).each(
			function(i) {
				var tr = this;
				$('th, td', tr).each(function(j) {
					if (j > 0) { // skip first column
							if (i == 0) { // get the name and init the series
								options.series[j - 1] = {
									name : this.innerHTML,
									data : []
								};
							} else { // add values
								options.series[j - 1].data
										.push(parseFloat(this.innerHTML));
							}
						}
					});
			});

	var chart = new Highcharts.Chart(options);
}

$(document).ready(
		function() {
			var table = document.getElementById('datatable'), options = {
				chart : {
					renderTo : 'container',
					defaultSeriesType : 'column'
				},
				title : {
					text : '  Precision'
				},
				xAxis : {},
				yAxis : {
					title : {
						text : ''
					}
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>' + this.y
								+ ' ' + this.x.toLowerCase();
					}
				}
			};

			Highcharts.visualize(table, options);
			$('#datatable').hide();
		});
</script>






	</head>

	<body >

		<jsp:include page="Header.jsp"></jsp:include>
		
		<%
   
  
  
 
 ProfileDAO dao = new ProfileDAO();
 
				List<ProductBean>  lpb= dao.graphDataValues();

  
    
   %>


		<center>

			<%
String status=request.getParameter("status");
if(status!=null)
{
out.println(status);

}
 %>

			<div id="container" style="width: 50%; height: 400px">

			</div>
			<table id="datatable" border="1" width="134" cellspacing="0"
				cellpadding="0" height="110">

				<thead>
					<tr>
						<th></th>

						<%
				for(ProductBean pbean:lpb){
					 %>

						<th>
							<font color=green><%=pbean.getMachines() %></font>
						</th>

						<%
					}
					 %>
					</tr>
				</thead>
				<tbody>



					<tr>
						<th></th>
						<%
				for(ProductBean pbean1:lpb){
					 %>
						<td><%=pbean1.getQuantity()%></td>

						<%
					}
					 %>

					</tr>

				</tbody>


			</table>


		</center>












	


		<center>



			

		</center>






	</body>
</html>
