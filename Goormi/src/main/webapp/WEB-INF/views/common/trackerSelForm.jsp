<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>  
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
			<li class="searchBtnRec"><button class="btn selectBtn">조회</button></li>
		</ul>
	</form>
</div>

<script src="${res }/common/js/trackerSel.js"></script>