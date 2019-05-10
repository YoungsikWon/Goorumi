<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">사용자 등록</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>사용자 관리</span>
			<span class="arrow"></span>
			<span>사용자 등록</span>
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
							<select class="inputField" name="role">
								<option value="system_admin">통합 관리자</option>
								<option value="tracker_group_admin">군집 사용자</option>
								<!-- <option value="tracker_admin">일반 사용자</option> -->
							</select>
						</div>	
					</li>
					<li>
						<div class="rect01">
							<label class="title">아이디</label>
							<input type="text" class="inputField inputId" name="userId" placeholder="아이디" />
							<input type="button" class="btn overlap" data-userid-check-btn="" value="중복확인">
							<p class="text-success text-desc text-warning userIdDesc"></p>
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">비밀번호</label>
							<input type="password" class="inputField" name="passwd" placeholder="비밀번호" />
							<p class="text-desc text-warning passwdDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">비밀번호 확인</label>
							<input type="password" class="inputField" name="passwdCheck" placeholder="비밀번호 확인" />
							<p class="text-desc text-warning passwdCheckDesc"></p>
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">이름</label>
							<input type="text" class="inputField" name="username" placeholder="홍길동" />
							<p class="text-desc text-warning usernameCheckDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">연락처</label>
							<input type="text" class="inputField" name="phone" placeholder="000-0000-0000" />
							<p class="text-desc text-warning phoneCheckDesc"></p> 
						</div>
							
					</li>
					<li>
						<div class="rect01">
							<label class="title">이메일</label>
							<input type="text" class="inputField" name="email" placeholder="test@test.com" />
							<p class="text-desc text-warning emailCheckDesc"></p> 
						</div>
					</li>
					<li class="groupListForm">
						<label class="title">담당군집</label>
						<div class="groupList">
						</div>
						<input type="text" class="inputField inverterId" placeholder="군집 이름 (군집 아이디)" readonly="readonly"/>
						<input type="button" class="btn overlap expand" value="+ 군집 추가" data-toggle="modal" data-target="#groupModel">
					</li>
					<li class="trackerListForm">
						<label class="title">담당 트래커</label>
						<div class="trackerList">
						</div>
						<input type="text" class="inputField inverterId" placeholder="트래커 ID" readonly="readonly"/>
						<input type="button" class="btn overlap expand" value="+ 트래커 추가" data-toggle="modal" data-target="#trackerModel">
					</li>
				</ul>
			</fieldset>
		</form>

		<div class="btnRec txR">
			<button class="btn cancel" data-cancel-btn="">취소</button>
			<button class="btn" data-reg-btn="listmove">등록</button>
			<button class="btn" data-reg-btn="continue">등록 후 계속</button>
		</div>

	</section>

	<jsp:include page="/WEB-INF/views/popup/groupModel.jsp">
		<jsp:param name="formId" value="inputForm"/>
	</jsp:include>
<%-- 	<jsp:include page="/WEB-INF/views/popup/trackerModel.jsp"> --%>
<%-- 		<jsp:param name="formId" value="inputForm"/> --%>
<%-- 	</jsp:include> --%>
</div>
<script src="${res }/user/js/userReg.js"></script>