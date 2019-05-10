<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<%
	String trackerGroupId = request.getSession().getAttribute("TRACKER_GROUP_ID").toString();
%>

<script>
	var trackerGroupId = "<%= trackerGroupId %>";
	console.log("TRACKERROUPID : ", trackerGroupId);
	
	if(!trackerGroupId){
		alert("등록된 군집이 없습니다. 관리자에게 문의해 주세요.");
		location.href = "/auth/logout";
	}
</script>

<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">통합 모니터링</h2>
		<span class="lastTx">최근 조회시간</span>
		<button class="btnRefresh" title="새로고침"></button>
		<span class="lastDate"></span>
	</div>
	
	<div class="realDateTime">
		<p class="realDate"></p>
		<p class="realTime"></p>
	</div>
	<div class="alertRec"></div>
	<jsp:include page="/WEB-INF/views/common/trackerSelForm.jsp" />
	<section class="dashHeader">
		<ul class="clearfix">
			<li class="groupName">
				<p class="headRec">
					<label>군집명</label>
				</p>
				<p class="iconRec"></p>
				<p class="txRec">
					<span class="tx">${GROUP_INFO.tracker_group_name }</span>
				</p>
			</li>
			<li class="userName">
				<p class="headRec">
					<label>사용자</label>
				</p>
				<p class="iconRec"></p>
				<p class="txRec">
					<span class="tx">${GROUP_INFO.username }</span>
				</p>
			</li>
			<li class="totalVolume">
				<p class="headRec">
					<label>총 누적 발전량</label>
				</p>
				<p class="iconRec"></p>
				<p class="energyTxRec">
					<span class="energyTx">${GROUP_INFO.accu_energy }</span>
					<span class="unit">KWh</span>
				</p>
			</li>
			<li class="totalCapacity" style="display:none;">
				<p class="headRec">
					<label>총 용량</label>
				</p>
				<p class="energyTxRec">
					<span class="energyTx">${GROUP_INFO.capacity }</span>
					<span class="unit">KWh</span>
				</p>
			</li>
		</ul>
	</section>
	<section class="energyCountRec">
		<ul class="clearfix">
			<li class="presentCount">
				<span class="header">금일 발전량</span>
				<span class="unit">KWh</span>
				<span class="energyCount" data-today-energy=''>0</span>
			</li>
			<li class="pastCount">
				<span class="header">전일 발전량</span>
				<span class="unit">KWh</span>
				<span class="energyCount" data-yesterday-energy=''>0</span>
			</li>
			<li class="currentCount">
				<span class="header">현재 출력</span>
				<span class="unit">kW</span>
				<span class="energyCount" data-current-energy=''>0</span>
				<div class="graphWrap">
					<div class="circleGraphBg"></div>
					<svg id="donutSvg"></svg>
					<ul>
						<li class="js-graphItem" data-val="0" data-color="white"></li>
					</ul>

					<p class="donutEnergyPercentage"></p>
				</div>
			</li>
		</ul>
	</section>
	
	<!-- <style>
		#svg circle {
		    stroke-dashoffset: 0;
		    transition: stroke-dashoffset 1s linear;
		    stroke: rgba(0,0,0,0.4);
		    stroke-width: 0.8em;
		}
		
		#svg #energyBar {
		  	stroke: white;
		}
		
	</style> -->
	
	<section class="weatherRec">
		<ul class="clearfix">
			<li class="weather">
				<span class="header">날씨</span>
				<span class="weatherTx">
					<c:choose>
						<c:when test="${WEATHER_INFO.PTY eq '0'}">
							<c:if test="${WEATHER_INFO.SKY eq '1'}">맑음</c:if>
							<c:if test="${WEATHER_INFO.SKY eq '2'}">구름조금</c:if>
							<c:if test="${WEATHER_INFO.SKY eq '3'}">구름많음</c:if>
							<c:if test="${WEATHER_INFO.SKY eq '4'}">흐림</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${WEATHER_INFO.PTY eq '1'}">비</c:if>
							<c:if test="${WEATHER_INFO.PTY eq '2'}">비 또는 눈</c:if>
							<c:if test="${WEATHER_INFO.PTY eq '3'}">눈</c:if>
						</c:otherwise>
					</c:choose>
				</span>
				<c:choose>
					<c:when test="${WEATHER_INFO.PTY eq '0'}">
						<c:if test="${WEATHER_INFO.SKY eq '1'}"><span class="weatherImg" data-skyInfo="SKY_O01"></span></c:if>
						<c:if test="${WEATHER_INFO.SKY eq '2'}"><span class="weatherImg" data-skyInfo="SKY_O02"></span></c:if>
						<c:if test="${WEATHER_INFO.SKY eq '3'}"><span class="weatherImg" data-skyInfo="SKY_O02"></span></c:if>
						<c:if test="${WEATHER_INFO.SKY eq '4'}"><span class="weatherImg" data-skyInfo="SKY_O02"></span></c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${WEATHER_INFO.PTY eq '1'}"><span class="weatherImg" data-skyInfo="SKY_O04"></span></c:if>
						<c:if test="${WEATHER_INFO.PTY eq '2'}"><span class="weatherImg" data-skyInfo="SKY_O06"></span></c:if>
						<c:if test="${WEATHER_INFO.PTY eq '3'}"><span class="weatherImg" data-skyInfo="SKY_O05"></span></c:if>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="temp">
				<span class="header">온도</span>
				<span class="icon ico01"></span>
				<span class="numTx">${WEATHER_INFO.T1H } ℃</span>
			</li>
			<li class="humidity">
				<span class="header">습도</span>
				<span class="icon ico02"></span>
				<span class="numTx">${WEATHER_INFO.REH } %</span>
			</li>
			<li class="wind">
				<span class="header">풍속</span>
				<span class="icon ico03"></span>
				<span class="numTx">${WEATHER_INFO.WSD } m/s</span>
			</li>
			<li class="lux">
				<span class="header">일사량</span>
				<span class="icon ico04"></span>
				<span class="numTx"><fmt:formatNumber value="${WEATHER_INFO.average_illumination }" pattern="0.00"/> W/m^2</span>
				<%-- <span class="numTx">${WEATHER_INFO.average_illumination } %</span> --%>
			</li>
		</ul>
	</section>

	<section class="chartRec">
		<div style="float: left;font-size: 14; color: rgba(60,80,100,0.8);">인버터 발전량 [KW]</div>
		<div style="float: right;font-size: 14; color: rgba(60,80,100,0.8);">일사량 [W/m^2]</div>
		<div id="graph02"></div>
		<div class="btnRec">
			<button class="btn checkBtn advancedMoveBtn">상세 발전량 조회</button>
		</div>
	</section>

	<section class="alarmTableRec">
		<form id="alarmTableForm">
			<input type="hidden" name="pageNo" value="1">
			<input type="hidden" name="pageSize" value="5">
			<input type="hidden" name="alarmGrade" value="">
		</form>
	
		<table class="ListTable alarmList">
			<caption></caption>
			<colgroup>
				<col width="50px"></col>
				<col width="30%"></col>
				<col></col>
				<col width="50px"></col>
				<col width="150px"></col>
			</colgroup>
			<thead class="tableHead">
				<tr>
					<th class="txC">번호</th>
					<th>아이디</th>
					<th>알람 타임</th>
					<th>등급</th>
					<th>시간</th>
				</tr>
			</thead>
			<tbody class="tableBody">
				
			</tbody>
		</table>
		<div class="alarmListPageing pageNum"></div>
		<div class="btnRec">
			<button class="btn checkBtn alarmMoveBtn">상세 알람 조회</button>
		</div>
	</section>
</div>
<script src="${res }/monitoring/js/donutGraph.js"></script>
<script src="${res }/monitoring/js/monitoring.js"></script>
