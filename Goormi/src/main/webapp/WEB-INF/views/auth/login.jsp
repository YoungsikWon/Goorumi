<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" type="text/css" href="${res }/common/css/base.css">
		<link rel="stylesheet" type="text/css" href="${res }/common/css/style.css">
		<script src="${lib}/plugins/jquery/jquery-2.2.3.min.js"></script>

		<title>
			<%-- <tiles:getAsString name="title" /> --%>
		</title>

	</head>

	<body class="">
		<div class="login">
			<div class="loginVisual">
				<div class="titleRec">

				</div>
				<div class="loginRec">
					<div class="loginBox">
						<h1>태양광 모니터링 시스템</h1>
						<p class="subTx">Solar Monitoring System</p>
    					<form class="inputRec" action="${cp}/auth/securityCheck" method="post" id="loginForm">
    						<sec:csrfInput/>
							<input type="text" class="inputText" name="userId" placeholder="아이디">
							<input type="password" class="inputText" name="passWd" placeholder="비밀번호">
							<button class="loginBtn">로그인</button>
						</form>
					</div>
				</div>
			</div>
			<div class="loginFooter">
				<p class="footerTx">
					<span class="highlight">성창 주식회사</span>
					<span class="bar"></span>
					<span class="tx">(28358) 충북 청주시 흥덕구 동촌로 149</span>
					<span class="bar"></span>
					<span class="num">Tel : 043.272.6552~3</span>
					<span class="bar"></span>
					<span class="num">Fax : 043.272.4884</span>
					<span class="bar"></span>
					<span class="tx">대표자 : 이재진</span>
				</p>
				<p class="copyright">Copyright (C) Sungchang telecom Co.,Ltd. All Rights Reserved.
				</p>
			</div>
		</div>		
	</body>
	<script type="text/javascript">
		$(function () {
		    if(undefined != getQuerystring("error")){
		    	alert("로그인 정보가 일치하지 않습니다.");
		    	location.replace(_cp + '/auth/login');
		    }
		});
		  
		function getQuerystring(paramName){
		
			var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
			if(_tempUrl != ""){
				var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
				
				for(var i = 0; i<_tempArray.length; i++) {
					var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
					
					if(_keyValuePair[0] == paramName){ // _keyValuePair[0] : 파라미터 명
						return _keyValuePair[1];
					}
				}
			}	
			
		}
		  
	  
	</script>
</html>

