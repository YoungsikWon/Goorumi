<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">사용자 상세보기</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>사용자 관리</span>
			<span class="arrow"></span>
			<span>사용자 상세보기</span>
		</p>
	</div>
	
	<section class="inputRec">
		<form id="inputForm">
			<sec:csrfInput/>
			<fieldset class="inputForm">
				<ul>
					<li>
						<div class="rect01">
						
							<label class="title">등급</label>
							<input type="hidden" name="role" value="${INFO.role}" readonly="readonly"/>
							<c:choose>
								<c:when test="${INFO.role == 'system_admin'}">
									<input type="text" class="inputField_read" value="통합 관리자" readonly="readonly"/>
								</c:when>
								<c:when test="${INFO.role == 'tracker_group_admin'}">
									<input type="text" class="inputField_read" value="군집 사용자" readonly="readonly"/>
								</c:when>
							</c:choose>
							
						</div>
						<div class="rect02">
							<label class="title">아이디</label>
							<input type="text" class="inputField_read" name="userId" value="${INFO.user_id }" readonly="readonly"/>
							<p class="text-desc text-warning userIdDesc"></p>
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">신규 비밀번호</label>
							<input type="password" class="inputField" name="passwd" placeholder="비밀번호 변경시에만 입력하여 주십시오." />
							<p class="text-desc text-warning passwdDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">비밀번호 확인</label>
							<input type="password" class="inputField" name="passwdCheck" placeholder="비밀번호 변경시에만 입력하여 주십시오." />
							<p class="text-desc text-warning passwdCheckDesc"></p>
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">이름</label>
							<input type="text" class="inputField" name="username" value="${INFO.username }"/>
							<p class="text-desc text-warning usernameCheckDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">연락처</label>
							<input type="text" class="inputField" name="phone" value="${INFO.phone }" />
							<p class="text-desc text-warning phoneCheckDesc"></p> 
						</div>
							
					</li>
					<li>
						<div class="rect01">
							<label class="title">이메일</label>
							<input type="text" class="inputField" name="email" value="${INFO.email }" />
							<p class="text-desc text-warning emailCheckDesc"></p> 
						</div>
					</li>
					<c:if test="${INFO.role == 'tracker_group_admin'}">
						<li class="groupListForm">
							<label class="title">담당군집</label>
							<div class="groupList">
								<c:forEach var="group" items="${USER_TRACKER_GROUP_LIST }" varStatus="status">
									<div class="groupGroup trackerGroupId-${group.tracker_group_id }">
										<input type="text" class="inputField" readonly="readonly" name="trackerGroupName" value="${group.tracker_group_name }"/>
										<input type="hidden" name="trackerGroupId" readonly="readonly" value="${group.tracker_group_id }"/>
										<input type="button" class="btn deleteBtn" data-group-del-btn="${group.tracker_group_id }" value="- 제거">
									</div>
								</c:forEach>
							</div>
							<!-- <input type="text" class="inputField" placeholder="군집 이름" readonly="readonly"/> -->
							<input type="button" class="btn addGroupBtn" value="군집 추가" data-toggle="modal" data-target="#groupModel">
						</li>
					</c:if>
<!-- 					<li class="trackerListForm"> -->
<!-- 						<label class="title">담당 트래커</label> -->
<!-- 						<div class="trackerList"> -->
<%-- 							<c:forEach var="tracker" items="${USER_TRACKER_LIST }" varStatus="status"> --%>
<%-- 								<div class="trackerId-${tracker.tracker_id }"> --%>
<%-- 									<input type="text" class="inputField inverterId" name="trackerId" readonly="readonly" value="${tracker.tracker_id }"/> --%>
<%-- 									<input type="button" class="btn overlap expand" style="margin-left: 3px;" data-tracker-del-btn="${tracker.tracker_id }" value="- 트래커 제거"> --%>
<!-- 								</div> -->
<%-- 							</c:forEach> --%>
<!-- 						</div> -->
<!-- 						<input type="text" class="inputField inverterId" placeholder="트래커 ID" readonly="readonly"/> -->
<!-- 						<input type="button" class="btn overlap expand" value="+ 트래커 추가" data-toggle="modal" data-target="#trackerModel"> -->
<!-- 					</li> -->
				</ul>
			</fieldset>
		</form>

		<div class="btnRec txR">
			<button class="btn cancel" data-cancel-btn="">취소</button>
			<button class="btn" data-modify-btn="">편집</button>
		</div>
		
	</section>
	
	<jsp:include page="/WEB-INF/views/popup/groupModel.jsp">
		<jsp:param name="formId" value="inputForm"/>
	</jsp:include>
<%-- 	<jsp:include page="/WEB-INF/views/popup/trackerModel.jsp"> --%>
<%-- 		<jsp:param name="formId" value="inputForm"/> --%>
<%-- 	</jsp:include> --%>
</div>
<script src="${res }/user/js/userDetail.js"></script>