<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">인버터 정보</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>인버터 관리</span>
			<span class="arrow"></span>
			<span>인버터 정보</span>
		</p>
	</div>
	<div class="searchRec">
		<form id="#">
			<ul class="clearfix">
				<li class="searchTerms">
					<label class="searchTermsTx">군집명</label>
					<input class="inputField" type="text" name="likeTrackerGroupName" placeholder="" value="${SEARCH_MAP.likeTrackerGroupName }" />
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">아이디</label>
					<input class="inputField" type="text" name="likeInverterId" placeholder="" value="${SEARCH_MAP.likeInverterId }" />
				</li>				
				<li class="searchTerms">
					<label class="searchTermsTx">관리자</label>
					<input class="inputField" type="text" name="likeManager" placeholder="" value="${SEARCH_MAP.likeManager }" />
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
					<col width="12%"></col>
					<col width="14%"></col>
				</colgroup>
				<thead class="tableHead">
					<tr>
						<sec:authorize access="hasRole('system_admin')">
						<th></th>
						</sec:authorize>
						<th class="txC">번호</th>
						<th>군집명</th>
						<th>ID</th>
						<th>인버터 모델</th>
						<th>인버터 용량(KW)</th>
						<th>관리자</th>
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
											<input type="checkbox" name="inverterId" value="${item.inverter_id }" />
											<input type="checkbox" class="hide" name="trackerGroupId" value="${item.tracker_group_id }" />
										</td>
									</sec:authorize>
									<td class="txC ft12 num">${PAGING.startDescNo - status.index }</td>
									<td>
										<c:choose>
											<c:when test="${empty item.tracker_group_name}">
												미등록
											</c:when>
											<c:otherwise>
												${item.tracker_group_name }
											</c:otherwise>
										</c:choose>	
									</td>
									<c:choose>
										<c:when test="${LOGIN_ROLE == 'system_admin'}">
											<td class="point num" data-detailid="${item.inverter_id }">${item.inverter_id }</td>
										</c:when>
										<c:otherwise>
											<td class="num">${item.inverter_id }</td>
										</c:otherwise>
									</c:choose>									
									<td>${item.inverter_name }</td>
									<td class="num">${item.capacity }</td>
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
<script src="${res }/inverter/js/inverterList.js"></script>