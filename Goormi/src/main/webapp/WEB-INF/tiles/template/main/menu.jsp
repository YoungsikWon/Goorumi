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

<!-- Left Menu Start -->
<h1 class="titleRec">
	<p class="titleKor"><span class="titleBold">태양광</span><br>모니터링<br>시스템</p>
	<p class="titleEng">Solar<br>Monitioring<br>System</p>
</h1>
<div class="loginInfoRec">
	<h5 class="loginTx"></h5>
	<p class="loginId">
		${loginId }
	</p>
	<div class="btnRec">
		<form action="${cp}/auth/logout" method="post">
		 	<sec:csrfInput/>
			<button class="btnLogout">로그아웃</button>
		</form>
	</div>
</div>
<div class="leftmenu">
	<!-- MENU -->
	<sec:authorize access="hasRole('system_admin')">
		<div class="menuItem" data-sidebar-name="monitoring">
			<h4><a href="${cp }/monitoring/monitoring">통합 모니터링</a></h4>
		</div>
		<div class="menuItem" data-sidebar-name="groupPresentState">
			<h4><a href="${cp }/groupPresentState/group">군집 현황</a></h4>
		</div>
		<div class="menuItem" data-sidebar-name="advancedPresentState">
			<h4><a href="${cp }/advancedPresentState/realTime">발전 현황</a></h4>
			<ul class="sub03">
				<li><a href="${cp }/advancedPresentState/realTime">일일 발전</a></li>
				<li><a href="${cp }/advancedPresentState/past">기간 별 발전</a></li>
				<li><a href="${cp }/advancedPresentState/distribution">발전량 분포도</a></li>
			</ul>
		</div>
		<div class="menuItem" data-sidebar-name="manage">
			<h4><a href="${cp }/user/list">관리 도구</a></h4>
			<ul class="sub04">
				<li><a href="${cp }/user/list">사용자 관리</a></li>
				<li><a href="${cp }/group/list">군집 관리</a></li>
				<li><a href="${cp }/tracker/list">트래커 관리</a></li>
				<li><a href="${cp }/inverter/list">인버터 관리</a></li>
			</ul>
		</div>
	</sec:authorize>
	<sec:authorize access="hasRole('tracker_group_admin')">
		<div class="menuItem">
			<h4><a href="${cp }/monitoring/monitoring">통합 모니터링</a></h4>
		</div>
		<div class="menuItem">
			<h4><a href="${cp }/groupPresentState/group">군집 현황</a></h4>
		</div>
		<div class="menuItem" data-sidebar-name="advancedPresentState">
			<h4><a href="${cp }/advancedPresentState/realTime">발전 현황</a></h4>
			<ul class="sub03">
				<li><a href="${cp }/advancedPresentState/realTime">일일 발전</a></li>
				<li><a href="${cp }/advancedPresentState/past">기간 별 발전</a></li>
				<li><a href="${cp }/advancedPresentState/distribution">발전량 분포도</a></li>
			</ul>
		</div>
		<div class="menuItem" data-sidebar-name="manage">
			<h4><a href="${cp }/group/list">관리 도구</a></h4>
			<ul class="sub04">
				<li><a href="${cp }/group/list">군집 정보</a></li>
				<li><a href="${cp }/tracker/list">트래커 정보</a></li>
				<li><a href="${cp }/inverter/list">인버터 정보</a></li>
			</ul>
		</div>
	</sec:authorize>
	<sec:authorize access="hasRole('tracker_admin')">
		<div class="menuItem">
			<h4><a href="${cp }/monitoring/monitoring">통합 모니터링</a></h4>
		</div>
		<div class="menuItem">
			<h4><a href="${cp }/groupPresentState/tracker">트래커 현황</a></h4>
		</div>
		<div class="menuItem" data-sidebar-name="advancedPresentState">
			<h4><a href="${cp }/advancedPresentState/realTime">발전 현황</a></h4>
			<ul class="sub03">
				<li><a href="${cp }/advancedPresentState/realTime">일일 발전</a></li>
				<li><a href="${cp }/advancedPresentState/past">기간 별 발전</a></li>
				<li><a href="${cp }/advancedPresentState/distribution">발전량 분포도</a></li>
			</ul>
		</div>
	</sec:authorize>
</div>
<script>
$(".menuItem li a").each(function() {
	if (location.pathname == $(this).attr('href')) {
		$(this).parent('li').addClass('active');
	}
});
</script>