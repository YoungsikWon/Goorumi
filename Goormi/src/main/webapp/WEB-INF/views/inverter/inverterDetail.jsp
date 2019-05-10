<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">인버터 상세보기</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>인버터 관리</span>
			<span class="arrow"></span>
			<span>인버터 상세보기</span>
		</p>
	</div>
	
	<section class="inputRec">
		<form id="inputForm">
			<sec:csrfInput/>
			<fieldset class="inputForm">
				<ul>
					<li>
						<div class="rect01">
							<label class="title">군집명</label>
							
							<c:choose>
								<c:when test="${empty INFO.tracker_group_id }">
									<input type="text" class="inputField inputId" name="trackerGroupName" placeholder="군집명" value="${INFO.tracker_group_name }" data-toggle="modal" data-target="#groupModel" readonly="readonly"/>
									<input type="hidden" name="trackerGroupId" value="${INFO.tracker_group_id }">
									<input type="button" class="btn overlap" value="군집 선택" data-toggle="modal" data-target="#groupModel">
									<p class="text-desc text-warning trackerGroupNameDesc"></p> 
								</c:when>
								<c:otherwise>
									<input type="text" class="inputField_read" name="trackerGroupName" value="${INFO.tracker_group_name }" readonly="readonly"/>
									<input type="hidden" name="trackerGroupId" value="${INFO.tracker_group_id }">								
								</c:otherwise>
							</c:choose>						
							
						</div>
						<div class="rect02">
							<label class="title">인버터 ID</label>
							<input type="text" class="inputField_read" name="inverterId" placeholder="인버터 ID" value="${INFO.inverter_id }" readonly="readonly"/>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">인버터 모델명</label>
							<input type="text" class="inputField" name="inverterName" placeholder="인버터 모델명" value="${INFO.inverter_name }"/>
							<p class="text-desc text-warning inverterNameDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">인버터 용량(kW)</label>
							<input type="text" class="inputField" name="capacity" placeholder="트래커 용량(kW)" value="${INFO.capacity }"/>
							<p class="text-desc text-warning capacityDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">시공사</label>
							<input type="text" class="inputField" name="builder" placeholder="시공사" value="${INFO.builder }"/>
							<p class="text-desc text-warning builderDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">준공일</label>
							<input type="date" class="inputField num" name="completionDate" max="9999-12-31" placeholder="2017-01-01" value="${INFO.install_date }"/>
							<p class="text-desc text-warning completionDateDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">관리사/관리인</label>
							<input type="text" class="inputField" name="manager" placeholder="관리인" value="${INFO.manager }"/>
							<p class="text-desc text-warning managerDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">소유주</label>
							<input type="text" class="inputField" name="owner" placeholder="소유주" value="${INFO.owner }"/>
							<p class="text-desc text-warning ownerDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">연락처</label>
							<input type="text" class="inputField num" name="phone" placeholder="000-0000-0000" value="${INFO.phone }" maxlength="13"/>
							<p class="text-desc text-warning phoneDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">설치 일자</label>
							<input type="date" class="inputField num" name="installDate" max="9999-12-31" placeholder="2017-01-01" value="${INFO.install_date }"/>
							<p class="text-desc text-warning installDateDesc"></p> 
						</div>
					</li> 
					<li>
						<label class="title">트래커 ID</label>
						<c:forEach var="inverter" items="${TRACKER_LIST }" varStatus="status">
							<div class="inverterId-${tracker.tracker_id }">
								<input type="text" class="inputField_read" readonly="readonly" value="${inverter.tracker_id }"/>
							</div>
						</c:forEach>
					</li>
					<li>
						<label class="title">관리 이력</label>
						<textarea name="history">${INFO.history }</textarea>
					</li>
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
</div>
<script src="${res }/inverter/js/inverterDetail.js"></script>