<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">발전 현황</h2>
		<span class="titleSub">일일 발전</span>
		<span class="lastDate">마지막 조회시간 : </span>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>발전 현황</span>
			<span class="arrow"></span>
			<span>일일 발전</span>
		</p>
	</div>
	
	<div class="searchRec">
		<input type="hidden" name="hiddenTrackerGroupId" value="${SEARCH_MAP.trackerGroupId}">
		<input type="hidden" name="hiddenTrackerId" value="${SEARCH_MAP.trackerId}">
		<input type="hidden" name="loginRole" value="${SEARCH_MAP.loginRole}">
		<form id="trackerSelForm">
			<ul class="clearfix">
				<li class="searchTerms">
					<label class="searchTermsTx">지역</label>
					<c:choose>
						<c:when test="${LOGIN_ROLE == 'system_admin'}">
							<select class="selectBox" name="areaCode">
								<option value="33" <c:if test="${SEARCH_MAP.areaCode == '33'}"> selected </c:if> >강원도</option>
								<option value="31" <c:if test="${SEARCH_MAP.areaCode == '31'}"> selected </c:if> >경기도</option>
								<option value="55" <c:if test="${SEARCH_MAP.areaCode == '55'}"> selected </c:if> >경상남도</option>
								<option value="54" <c:if test="${SEARCH_MAP.areaCode == '54'}"> selected </c:if> >경상북도</option>
								<option value="43" <c:if test="${SEARCH_MAP.areaCode == '43'}"> selected </c:if> >충청북도</option>
								<option value="41" <c:if test="${SEARCH_MAP.areaCode == '41'}"> selected </c:if> >충청남도</option>
								<option value="63" <c:if test="${SEARCH_MAP.areaCode == '63'}"> selected </c:if> >전라북도</option>
								<option value="61" <c:if test="${SEARCH_MAP.areaCode == '61'}"> selected </c:if> >전라남도</option>
								<option value="64" <c:if test="${SEARCH_MAP.areaCode == '64'}"> selected </c:if> >제주도</option>
							</select>
						</c:when>
						<c:otherwise>
							<select class="selectBox" name="areaCode">
							<c:forEach var="area_item" items="${AREA_LIST }" varStatus="status">
								<option value="${area_item.area_code }" <c:if test="${SEARCH_MAP.areaCode == area_item.area_code}"> selected </c:if> >${area_item.area_name }</option>
							</c:forEach>
							</select>
						</c:otherwise>
					</c:choose>
					
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">발전소(군집)</label>
					<select class="selectBox" name="trackerGroupId">
					</select>
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">트래커 ID</label>
					<select class="selectBox" name="trackerId">
					</select>
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">일자</label>
					<input type="date" name="searchDate" max="9999-12-31" value="${SEARCH_MAP.searchDate}">
				</li>
				<li class="searchBtnRec"><button class="btn selectBtn">조회</button></li>
			</ul>
		</form>
	</div>
	
	<section class="realTimeRec clearfix">
		<div class="energyTodayRec">
			<table>
				<tbody>
					<tr>
						<td>트래커</td>
						<td class="energyCapacity">
							<span class="tracker"></span>
						</td>
					</tr>
					<tr>
						<td>트래커 용량</td>
						<td>
							<span class="tracker_capacity">0</span> kW
						</td>
					</tr>
					<tr>
						<td>당일 발전량</td>
						<td>
							<span class="tracker_energy">0</span> kW
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="energyChartRec">
			<div style="float: left;font-size: 13;">인버터 발전량 [KW]</div>
			<div style="float: right;font-size: 13;">일사량 [W/m^2]</div>
			<div id="graph02"></div>
		</div>
	</section>

	<section class="tableRec">
		<form id="energyListForm">
			<input type="hidden" name="pageNo" value="1">
			<input type="hidden" name="pageSize" value="10">
		</form>
		<table class="ListTable">
			<caption></caption>
			<colgroup>
				<col width="60px"></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
			</colgroup>
			<thead class="tableHead">
				<tr>
					<th class="txC">번호</th>
					<th>트래커 명</th>
					<th>트래커 아이디</th>
					<th>연결 인버터 아이디</th>
					<th>현재 출력 (KW)</th>
					<!-- <th>일 발전량 (KW)</th> -->
					<th>용량(KW)</th>
					<th>관리자</th>
					<th>등록일시</th>
				</tr>
			</thead>
			<tbody class="tableBody">
			</tbody>
		</table>
		<div class="energyListPageing pageNum"></div>
	</section>
	
</div>
<script src="${res }/advancedPresentState/js/realTime.js"></script>
<script src="${res }/common/js/trackerSel.js"></script>