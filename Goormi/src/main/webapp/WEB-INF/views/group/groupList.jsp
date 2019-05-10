<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">군집 정보</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>군집 관리</span>
			<span class="arrow"></span>
			<span>군집 정보</span>
		</p>
	</div>
	<div class="searchRec">
		<form id="#">
			<ul class="clearfix">
				<li class="searchTerms">
					<label class="searchTermsTx">지역</label>
					<sec:authorize access="hasRole('system_admin')">
						<select class="selectBox" name="areaCode">
							<option value="">전체</option>
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
					</sec:authorize>
					<sec:authorize access="hasRole('tracker_group_admin')">
						<select class="selectBox" name="areaCode">
							<option value="">전체</option>
							<c:forEach var="area_item" items="${AREA_LIST }" varStatus="status">
								<option value="${area_item.area_code }" <c:if test="${SEARCH_MAP.areaCode == area_item.area_code}"> selected </c:if> >${area_item.area_name }</option>
							</c:forEach>
						</select>
					</sec:authorize>
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">군집명</label>
					<input class="inputField" type="text" name="trackerGroupName" placeholder="군집명" value="${SEARCH_MAP.trackerGroupName }" />
				</li>
				
				<li class="searchBtnRec"><button class="btn selectBtn">조회</button></li>
			</ul>
		</form>
		
		<form id="pagingForm">
			<input type="hidden" name="pageNo" value="${PAGING.pageNo }">
			<input type="hidden" name="pageSize" value="${PAGING.rowsLen }">
			
			<input type="hidden" name="role" value="${SEARCH_MAP.role }">		
			<input type="hidden" name="searchType" value="${SEARCH_MAP.searchType }">		
			<input type="hidden" name="searchWord" value="${SEARCH_MAP.searchWord }">		
			<input type="hidden" name="likeTrackerGroupName" value="${SEARCH_MAP.likeTrackerGroupName }">
		</form>
	</div>

	<!-- table -->
	<section class="tableRec">
		<form id="tableForm">
			<sec:csrfInput/>
			<table class="ListTable">
				<caption></caption>
				<colgroup>
					<sec:authorize access="hasRole('system_admin')">
						<col width="36px"></col>
					</sec:authorize>
					<col width="40px"></col>
					<col width="12%"></col>
					<col></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="8%"></col>
					<col width="12%"></col>
					<col width="14%"></col>
				</colgroup>
				<thead class="tableHead">
					<tr>
						<sec:authorize access="hasRole('system_admin')">
							<th class="txC"></th>
						</sec:authorize>
						<th class="txC">번호</th>
						<th>군집명</th>
						<th>주소</th>
						<th>트래커 수</th>
						<th>인버터 수</th>
						<th>담당자</th>
						<th>시공사</th>
						<th>관리사</th>
						<th>연락처</th>
						<th>등록일시</th>
					</tr>
				</thead>
				<tbody class="tableBody">
					<c:choose>
			        	<c:when test="${PAGING.rowsTotalCount > 0 }">
							<c:forEach var="item" items="${LIST }" varStatus="status">
								<tr>
									<sec:authorize access="hasRole('system_admin')">
										<td class="txC ft12" data-checked="">
											<input type="checkbox" name="trackerGroupId" value="${item.tracker_group_id }" />
										</td>
									</sec:authorize>
									<td class="txC ft12">${PAGING.startDescNo - status.index }</td>
									<c:choose>
										<c:when test="${LOGIN_ROLE == 'system_admin'}">
									<td class="point num" data-detailid="${item.tracker_group_id }">${item.tracker_group_name }</td>
										</c:when>
										<c:otherwise>
											<td class="num">${item.tracker_group_name }</td>
										</c:otherwise>
									</c:choose>		
									<td>${item.address_1 }</td>
									<td class="num">${item.tracker_cnt }</td>
									<td class="num">${item.inverter_cnt }</td>
									<td>${item.username }</td>
									<td>${item.builder }</td>
									<td>${item.manager }</td>
									<td class="num">${item.phone }</td>
									<td class="num"><fmt:formatDate value="${item.reg_date }" pattern="yyyy-MM-dd HH:mm "/></td>
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
		</form>
		<sec:authorize access="hasRole('system_admin')">
			<div class="btnRec">
				<button class="btn" data-del="">삭제</button>
				<div class="rightBtnRec">
					<button class="btn" data-reg="">등록</button>
				</div>
			</div>
		</sec:authorize>
		<jsp:include page="/WEB-INF/views/common/paging.jsp">
			<jsp:param name="formId" value="pagingForm"/>
		</jsp:include>
	</section>
</div>
<script src="${res }/group/js/groupList.js"></script>