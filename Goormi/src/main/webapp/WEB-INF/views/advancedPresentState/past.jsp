<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">발전 현황</h2>
		<span class="titleSub">기간 별 발전</span>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>발전 현황</span>
			<span class="arrow"></span>
			<span>기간 별 발전</span>
		</p>
	</div>
	
	<div class="searchRec">
		<input type="hidden" name="hiddenTrackerGroupId" value="${SEARCH_MAP.trackerGroupId}">
		<input type="hidden" name="hiddenTrackerId" value="${SEARCH_MAP.trackerId}">
		<input type="hidden" name="loginRole" value="${SEARCH_MAP.loginRole}">
		<form id="trackerSelForm" onsubmit="return validateForm()">
			<ul class="clearfix">
				<li class="">
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
					<label class="searchTermsTx">기간</label>
					<input type="date" name="startDate" max="9999-12-31" value="${SEARCH_MAP.startDate }"/> ~ 
					<input type="date" name="endDate" max="9999-12-31" value="${SEARCH_MAP.endDate }"/>
				</li>
				<li class="searchBtnRec"><button class="btn selectBtn">조회</button></li>
			</ul>
		</form>
		<form id="pagingForm">
			<input type="hidden" name="pageNo" value="${PAGING.pageNo }">
			<input type="hidden" name="pageSize" value="${PAGING.rowsLen }">
			<input type="hidden" name="areaCode" value="${SEARCH_MAP.areaCode }">
			<input type="hidden" name="trackerGroupId" value="${SEARCH_MAP.trackerGroupId }">
			<input type="hidden" name="trackerId" value="${SEARCH_MAP.trackerId }">
			<input type="hidden" name="startDate" value="${SEARCH_MAP.startDate }">
			<input type="hidden" name="endDate" value="${SEARCH_MAP.endDate }">
		</form>
	</div>

	<!-- CSS 수정해야함 -->	
	<section class="totalRec">
		<div class="txS">
			<span class="startDate"></span>
			~
			<span class="endDate"></span>
		</div>
		<div class="txM">
			기간 내 트래커 <span>전체</span>의 총 발전량
			<span class="energyTx"></span> kW
		</div>
<!-- 
		<h2 class="title">
			<p class="txS">
				<span class="startDate"></span> ~ 
				<span class="endDate"></span>
			</p>
		</h2>
		<h2 class="sumEnergyRec">
			<p class="txM">
				<span>기간 내 트래커</span>
				<span>전체</span>
				<span>의 총 발전량</span>
				<span class="energyTx"></span>KW
			</p>
		</h2> -->
	</section>
	
	<section class="chartRec graph02">
		<div id="graph02"></div>
	</section>
	
	<%-- <section class="tableRec">
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
					<th>현재 발전량 (KW)</th>
					<th>용량</th>
					<th>관리자</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody class="tableBody">
				<c:choose>
		        	<c:when test="${PAGING.rowsTotalCount > 0 }">
		        		<c:forEach var="item" items="${ENERGY_LIST }" varStatus="status">
								<tr> 
									<td class="txC ft12 num">${PAGING.startDescNo - status.index }</td>
									<td>${item.tracker_name }</td>
									<td>${item.tracker_id }</td>
									
									<c:choose>
										<c:when test="${item.inverter_id == '' || item.inverter_id eq null }">
											<td>연결된 인버터 없음</td>
										</c:when>
										<c:otherwise>
											<td>${item.inverter_id }</td>
										</c:otherwise>
									</c:choose>
									
									<td><fmt:formatNumber value="${item.energy }" pattern="0.00"/></td>
									
									<c:choose>
										<c:when test="${item.capacity == '' || item.capacity eq null }">
											<td>연결된 용량 정보 없음</td>
										</c:when>
										<c:otherwise>
											<td>${item.capacity }</td>
										</c:otherwise>
									</c:choose>
									
									<td>${item.manager }</td>
									<td>${item.reg_date }</td>
								</tr>
						</c:forEach>
					</c:when>
	    	      	<c:otherwise>
	               		<tr style="text-align: center;">
		               		<td colspan='9' >조회된 목록이 없습니다.</td>
	               		<tr>
	             	</c:otherwise>
	        	</c:choose>
			</tbody>
		</table>
		<jsp:include page="/WEB-INF/views/common/paging.jsp">
			<jsp:param name="formId" value="pagingForm"/>
		</jsp:include>		
	</section> --%>
		
</div>
<script src="${res }/advancedPresentState/js/past.js"></script>
<script src="${res }/common/js/trackerSel.js"></script>