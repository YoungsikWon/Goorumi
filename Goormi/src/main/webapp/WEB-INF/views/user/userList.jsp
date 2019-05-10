<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">사용자 정보</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>사용자 관리</span>
			<span class="arrow"></span>
			<span>사용자 정보</span>
		</p>
	</div>
	<div class="searchRec">
		<form id="#">
			<ul class="clearfix">
				<li class="searchTerms">
					<label class="searchTermsTx">등급</label>
					<select class="selectBox" name="role">
						<option value="" <c:if test="${empty SEARCH_MAP.role}"> selected </c:if> >전체</option>
						<option value="system_admin" <c:if test="${SEARCH_MAP.role == 'system_admin'}"> selected </c:if> >통합 관리자</option>
						<option value="tracker_group_admin" <c:if test="${SEARCH_MAP.role == 'tracker_group_admin'}"> selected </c:if> >군집 사용자</option>
						<option value="tracker_admin" <c:if test="${SEARCH_MAP.role == 'tracker_admin'}"> selected </c:if> >일반 사용자</option>
					</select>
				</li>
				<li class="searchTerms">
					<select class="selectBox" name="searchType">
						<option value="likeUsername" <c:if test="${SEARCH_MAP.searchType == 'likeUsername'}"> selected </c:if> >이름</option>
						<option value="likeUserId" <c:if test="${SEARCH_MAP.searchType == 'likeUserId'}"> selected </c:if> >ID</option>
						<option value="likePhone" <c:if test="${SEARCH_MAP.searchType == 'likePhone'}"> selected </c:if> >연락처</option>
						<option value="likeEmail" <c:if test="${SEARCH_MAP.searchType == 'likeEmail'}"> selected </c:if> >이메일</option>
					</select>
					<input class="inputField" type="text" name="searchWord" placeholder="" value="${SEARCH_MAP.searchWord}" />
				</li>
				
				<li class="searchTerms">
					<label class="searchTermsTx">군집명</label>
					<input class="inputField" type="text" name="likeTrackerGroupName" placeholder="" value="${SEARCH_MAP.likeTrackerGroupName }" />
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
					<col width="36px"></col>
					<col width="40px"></col>
					<col width="10%"></col>
					<col></col>
					<col width="10%"></col>
					<col width="12%"></col>
					<col width="20%"></col>
					<col width="14%"></col>
					<col width="14%"></col>
				</colgroup>
				<thead class="tableHead">
					<tr>
						<th></th>
						<th class="txC">번호</th>
						<th>등급</th>
						<th>ID</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>관리 군집명</th>
						<th>등록일시</th>
					</tr>
				</thead>
				<tbody class="tableBody">
					<c:choose>
			        	<c:when test="${PAGING.rowsTotalCount > 0 }">
							<c:forEach var="item" items="${LIST }" varStatus="status">
								<tr>
									<td class="txC ft12" data-checked="">
										<c:if test="${item.user_id != loginId}">
											<input type="checkbox" name="userId" value="${item.user_id }" />
										</c:if>
									</td>
									<td class="txC ft12 num">${PAGING.startDescNo - status.index }</td>
									<td>
										<c:choose>
											<c:when test="${item.role == 'system_admin'}">
												통합 관리자
											</c:when>
											<c:when test="${item.role == 'tracker_group_admin'}">
												군집 사용자
											</c:when>
											<c:when test="${item.role == 'tracker_admin'}">
												일반 사용자
											</c:when>
										</c:choose>
									
									</td>
									<td class="point num" data-detailid="${item.user_id }"><a href="#">${item.user_id }</a></td>
									<td>${item.username }</td>
									<td class="num">${item.phone }</td>
									<td class="num">${item.email }</td>
									<td>
										<c:choose>
											<c:when test="${item.role == 'system_admin'}">
												-
											</c:when>
											<c:when test="${item.role == 'tracker_group_admin'}">
												${item.tracker_group_name }
											</c:when>
										</c:choose>
									</td>
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
		<div class="btnRec">
			<button class="btn" data-del="">삭제</button>
			<div class="rightBtnRec">
				<button class="btn" data-reg="">등록</button>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/paging.jsp">
			<jsp:param name="formId" value="pagingForm"/>
		</jsp:include>	
	</section>
</div>
<script src="${res }/user/js/userList.js"></script>