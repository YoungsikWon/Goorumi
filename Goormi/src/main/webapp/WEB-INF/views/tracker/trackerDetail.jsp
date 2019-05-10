<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">트래커 상세보기</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>트래커 관리</span>
			<span class="arrow"></span>
			<span>트래커 상세보기</span>
		</p>
	</div>
	
	<section class="inputRec">
		<form id="inputForm">
			<sec:csrfInput/>
			<fieldset class="inputForm">
				<ul>
					<li class="clearfix">
						<input type="hidden" name="siteX" value="${INFO.site_x }" />
						<input type="hidden" name="siteY" value="${INFO.site_y }" />
						<div class="rect01">
							<label class="title">군집명</label>
							<c:choose>
								<c:when test="${empty INFO.tracker_group_id }">
									<input type="text" class="inputField inputId" name="trackerGroupName" value="${INFO.tracker_group_name }" placeholder="군집명" data-toggle="modal" data-target="#groupModel" readonly="readonly"/>
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
							<label class="title">트래커 ID</label>
							<input type="text" class="inputField_read" name="trackerId" value="${INFO.tracker_id }" placeholder="트래커 ID" readonly="readonly"/>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">트래커 모델명</label>
							<input type="text" class="inputField" name="trackerName" value="${INFO.tracker_id }" placeholder="트래커 모델명" />
							<p class="text-desc text-warning trackerNameDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">트래커 용량(kW)</label>
							<input type="text" class="inputField" name="capacity" value="${INFO.capacity }" placeholder="트래커 용량(kW)" />
							<p class="text-desc text-warning capacityDesc"></p> 
						</div>
					</li>
					<li class="inverterListForm">
						<label class="title">인버터 ID</label>
						<div class="inverterList">
							<c:forEach var="inverter" items="${INVERTER_LIST }" varStatus="status">
								<div class="inverterId-${inverter.inverter_id }">
									<input type="text" class="inputField inverterId" name="inverterId" readonly="readonly" value="${inverter.inverter_id }"/>
									<input type="button" class="btn deleteBtn" data-inverter-del-btn="${inverter.inverter_id }" value="- 제거">
								</div>
							</c:forEach>
						</div>
						<!-- <input type="text" class="inputField inverterId" placeholder="인버터 ID" readonly="readonly"/> -->
						<input type="button" class="btn inverterAdd" value="인버터 추가" data-toggle="modal" data-target="#inverterModel">
					</li>
					<li>
						<div class="rect01">
							<label class="title">시공사</label>
							<input type="text" class="inputField" name="builder" value="${INFO.builder }" placeholder="시공사" />
							<p class="text-desc text-warning builderDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">준공일</label>
							<input type="date" class="inputField num" name="completionDate" max="9999-12-31" placeholder="2017-01-01" value="${INFO.completion_date }"/>
							<p class="text-desc text-warning completionDateDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">관리인</label>
							<input type="text" class="inputField" name="manager" value="${INFO.manager }" placeholder="관리인" />
							<p class="text-desc text-warning managerDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">소유주</label>
							<input type="text" class="inputField" name="owner" value="${INFO.owner }" placeholder="소유주" />
							<p class="text-desc text-warning ownerDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">연락처</label>
							<input type="text" class="inputField num" name="phone" value="${INFO.phone }" placeholder="000-0000-0000" />
							<p class="text-desc text-warning phoneDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">설치 일자</label>
							<input type="date" class="inputField num" name="installDate" max="9999-12-31" placeholder="2017-01-01" value="${INFO.install_date }"/>
							<p class="text-desc text-warning installDateDesc"></p> 
						</div>
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
	<jsp:include page="/WEB-INF/views/popup/inverterModel.jsp">
		<jsp:param name="formId" value="inputForm"/>
	</jsp:include>
</div>
<script src="${res }/tracker/js/trackerDetail.js"></script>