<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%
	request.setAttribute("image", request.getContextPath() + "/resources/image");
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0"/> -->
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" type="text/css" href="${lib }/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${res }/common/css/base.css">
		<link rel="stylesheet" type="text/css" href="${res }/common/css/style.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,700' rel='stylesheet' type='text/css' />
	  	<link rel="stylesheet" href="${lib}/plugins/c3/c3.css">	
	  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  
	  	<script src="${lib }/plugins/jquery/jquery-2.2.3.min.js"></script>
	  	<script src="${lib }/plugins/jquery/jquery.form.min.js"></script>
	  	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="${res }/common/js/paging.js"></script>
		<script src="${lib}/plugins/d3/d3-v3-min.js"></script>
	  	<script src="${lib}/plugins/c3/c3.js"></script>
	  	
	  	<script src="${lib}/bootstrap/js/bootstrap.js"></script>
	  	
	  	<script src="${res}/common/js/common.js"></script>
	  	<script src="${lib }/plugins/snap/snap.svg.js"></script>
	  	
		<title>
			<tiles:getAsString name="title"/>
		</title>
	</head>
	<body>
		<div id="wrap">
			<div class="container">
				<nav class="navigation">
					<tiles:insertAttribute name="menu" ignore="true" />
				</nav>	
				<section class="content">
					<!-- <tiles:insertAttribute name="header" ignore="true" /> -->
					<tiles:insertAttribute name="body" />
				</section>	
			<%-- 		<tiles:insertAttribute name="footer" ignore="true" /> --%>
					<sec:csrfInput/>
				
			</div>
		</div>
	</body>
</html>