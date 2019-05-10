<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
String loginId = "";
if(auth != null){
	loginId = auth.getName();
}

request.setAttribute("loginId", loginId);
%>

<ul class="headerRec">
	
	<li class="loginId">
		${loginId }
	</li>
	<li class="btnRec">
		<form action="${cp}/auth/logout" method="post">
		 <sec:csrfInput/>
			<button class="btnLogout">로그아웃</button>
		</form>
	</li>
</ul>