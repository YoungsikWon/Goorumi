<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">발전 현황</h2>
		<span class="titleSub">발전량 분포도</span>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>발전 현황</span>
			<span class="arrow"></span>
			<span>발전량 분포도</span>
		</p>
	</div>
	<jsp:include page="/WEB-INF/views/common/groupSelForm.jsp" />
	
	<section class="trackerInfoRec clearfix">
		<h2>
			<p class="txM">발전량 가이드</p>
			<p class="txS">트래커 발전량에 따라 색상정보가 변경됩니다</p>
		</h2>
		<ul class="energyGuide">
			<li class="infoTx">
				<span class="tx txL">발전량 낮음</span>
				<span class="tx txR">발전량 높음</span>
			</li>
			<li class="colorInfo"></li>
			<li class="infoNum">
				<span class="num txL">0 %</span>
				<span class="num txR">100 %</span>
			</li>
		</ul>
	</section>
		
	<div class="trakerGroup">
		<div class="trackerRec">
			<div class="trackerTableRec">

			</div>
		</div>
	</div>
</div>

<script src="${res }/advancedPresentState/js/distribution.js"></script>