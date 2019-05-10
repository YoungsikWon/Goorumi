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
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0"/> -->
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" type="text/css" href="${res }/common/css/base.css">
		<link rel="stylesheet" href="${res }/auth/css/groupSelect.css">
		<link rel="stylesheet" href="${res }/auth/css/groupSelectMap.css">
		<!-- <link href='http://fonts.googleapis.com/css?family=Roboto:100,300,400,700' rel='stylesheet' type='text/css' /> -->
		<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" />
	
		<script src="${lib }/plugins/jquery/jquery-2.2.3.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
		<script src="${lib }/plugins/d3/d3.js"></script>
		<script src="${res }/common/js/paging.js"></script>
		
		<title>
			<tiles:getAsString name="title" />
		</title>

	</head>
	<body class="">
		<div id="wrap">
			<header class="header">
				<nav class="navigation">
					<h1 class="titleKor">
						<span class="titleBold">태양광</span> 모니터링 시스템
						<span class="titleEng">Solar Monitioring System</span>
					</h1>
				</nav>
				<ul class="utilRec">
					<li class="loginId">${loginId }</li>
					<li class="btnRec">
						<form action="${cp}/auth/logout" method="post">
						 <sec:csrfInput/>
							<button class="btnLogout">로그아웃</button>
						</form>
					</li>
				</ul>
			</header>
			<div class="container">
				<section class="content">
					<div class="selectMapRec">
						<h2 class="titleTx">군집 선택</h2>
						<p class="subTx">검색 지역을 선택하세요</p>
						<!-- 지도 들어가는 부분 -->
						<div id="container" class="mapRec"></div>
						
					</div>
					<div class="tableRec">
						<jsp:include page="/WEB-INF/views/common/pagesize.jsp">
							<jsp:param name="formId" value="pagingForm"/>
						</jsp:include>		
						
						<div class="searchRec">
							<form id="searchForm" onsubmit="return groupCheck()">
								<ul class="searchTerms">
									<li class="">
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
									<li class="">
										<label class="searchTermsTx">관리자</label>
										<input class="inputField" type="text" name="username" placeholder="관리자" value="${SEARCH_MAP.username }" />
									</li>
									<li class="">
										<label class="searchTermsTx">군집명</label>
										<input class="inputField" type="text" name="trackerGroupName" placeholder="군집명" value="${SEARCH_MAP.trackerGroupName }" />
									</li>
								</ul>
								<button class="searchBtn">조회</button>
							</form>
							<form id="pagingForm">
								<input type="hidden" name="pageNo" value="${PAGING.pageNo }">
								<input type="hidden" name="pageSize" value="${PAGING.rowsLen }">
								
								<input type="hidden" name="areaCode" value="${SEARCH_MAP.areaCode }">		
								<input type="hidden" name="username" value="${SEARCH_MAP.username }">		
								<input type="hidden" name="trackerGroupName" value="${SEARCH_MAP.trackerGroupName }">		
							</form>
						</div>
						<table class="resultListTable">
							<caption>검사 결과 전송 목록</caption>
							<colgroup>
								<col width="40px"></col>
								<col width="30%"></col>
								<col width="16%"></col>
								<col width="16%"></col>
								<col></col>
								<col width="80px"></col>
							</colgroup>
							<thead class="tableHead">
								<tr>
									<th class="txC">번호</th>
									<th>군집명</th>
									<th>군집 관리자</th>
									<th class="txR">군집 용량(kW)</th>
									<th>주소</th>
									<th class="txC">선택</th>
								</tr>
							</thead>
							<tbody class="tableBody">
								<c:choose>
		                			<c:when test="${PAGING.rowsTotalCount > 0 }">
										<c:forEach var="item" items="${LIST }" varStatus="status">
											<tr>
												<td class="txC"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">${PAGING.startDescNo - status.index }</a></td>
												<td class="name bold"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">${item.tracker_group_name }</a></td>
												<td class="name"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">${item.username }</a></td>
												<td class="num txR"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">${item.capacity }</a></td>
												<td class="name"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">${item.address_1 }</a></td>
												<td class="txC btn"><a href="#" data-trackergroupid="${item.tracker_group_id }" data-areacode="${item.area_code }" data-sel="">선택</a></td>
											</tr>
										</c:forEach>
									</c:when>
				                	<c:otherwise>
				                		<tr style="text-align: center;">
					                		<td colspan='6' >조회된 목록이 없습니다.</td>
				                		<tr>
				                	</c:otherwise>
				                </c:choose>	
							</tbody>
						</table>
						<jsp:include page="/WEB-INF/views/common/paging.jsp">
							<jsp:param name="formId" value="pagingForm"/>
						</jsp:include>	
					</div>
				</section>
			</div>
			<!-- <footer class="footer">
				<h3>copyright 2017 eMediTalk</h3>
			</footer> -->
		</div>
		<script src="${res }/auth/js/loginGroupSelect.js"></script>
	</body>

</html>


