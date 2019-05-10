<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">트래커 등록</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>트래커 관리</span>
			<span class="arrow"></span>
			<span>트래커 등록</span>
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
							<input type="text" class="inputField inputId" name="trackerGroupName" placeholder="군집명" data-toggle="modal" data-target="#groupModel" readonly="readonly"/>
							<input type="hidden" name="trackerGroupId" value="">
							<input type="button" class="btn overlap" value="군집 선택" data-toggle="modal" data-target="#groupModel">
							<p class="text-desc text-warning trackerGroupNameDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">트래커 ID</label>
							<input type="text" class="inputField inputId" name="trackerId" placeholder="트래커 ID" />
							<input type="button" class="btn overlap" data-trackerid-check-btn="" value="중복확인">
							<p class="text-success text-desc text-warning trackerIdDesc"></p> 
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">트래커 모델명</label>
							<input type="text" class="inputField" name="trackerName" placeholder="트래커 모델명" />
							<p class="text-desc text-warning trackerNameDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">트래커 용량(kW)</label>
							<input type="text" class="inputField" name="capacity" placeholder="트래커 용량(kW)" />
							<p class="text-desc text-warning capacityDesc"></p> 
						</div>
					</li>
					<li class="inverterListForm">
						<label class="title">인버터 ID</label>
						<div class="inverterList"></div>
						<!-- <input type="text" class="inputField inverterId" placeholder="인버터 ID" readonly="readonly"/> -->
						<input type="button" class="btn inverterAdd" value="인버터 추가" data-inverter-add-btn="">
					</li>
					<li>
						<div class="rect01">
							<label class="title">시공사</label>
							<input type="text" class="inputField" name="builder" placeholder="시공사" />
							<p class="text-desc text-warning builderDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">준공일</label>
							<input type="date" class="inputField num" name="completionDate" max="9999-12-31" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />" />
							<p class="text-desc text-warning completionDateDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">관리인</label>
							<input type="text" class="inputField" name="manager" placeholder="관리인" />
							<p class="text-desc text-warning managerDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">소유주</label>
							<input type="text" class="inputField" name="owner" placeholder="소유주" />
							<p class="text-desc text-warning ownerDesc"></p> 
						</div>
					</li>
					<li>
						<div class="rect01">
							<label class="title">연락처</label>
							<input type="text" class="inputField num" name="phone" placeholder="000-0000-0000" />
							<p class="text-desc text-warning phoneDesc"></p> 
						</div>
						<div class="rect02">
							<label class="title">설치 일자</label>
							<input type="date" class="inputField num" name="installDate" max="9999-12-31" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />"/>
							<p class="text-desc text-warning installDateDesc"></p> 
						</div>
					</li> 
					<li>
						<label class="title">관리 이력</label>
						<textarea name="history"></textarea>
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
	
	<jsp:include page="/WEB-INF/views/popup/groupModel2.jsp">
		<jsp:param name="formId" value="inputForm"/>
	</jsp:include>
	<jsp:include page="/WEB-INF/views/popup/inverterModel.jsp">
		<jsp:param name="formId" value="inputForm"/>
	</jsp:include>
</div>
<script src="${res }/tracker/js/trackerReg.js"></script>