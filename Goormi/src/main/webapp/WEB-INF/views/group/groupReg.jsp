<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9UP1fIawT0fAgNiiwDnk3oEKnSJKEJBs&libraries=visualization&sensor=false"></script>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">군집 등록</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>군집 관리</span>
			<span class="arrow"></span>
			<span>군집 등록</span>
		</p>
	</div>

	<section class="inputRec">
		<form id="inputForm">
			<sec:csrfInput/>
			<fieldset class="inputForm">
				<ul>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">군집 ID</label>
							<input type="text" class="inputField inputId" name="trackerGroupId" placeholder="군집 ID" />
							<input type="button" class="btn overlap" data-groupid-btn="" value="중복확인">
							<p class="text-success text-desc text-warning trackerGroupIdDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">군집명</label>
							<input type="text" class="inputField inputId"  name="trackerGroupName" placeholder="군집명" />
							<input type="button" class="btn overlap" data-groupname-btn=""value="중복확인">
							<p class="text-success text-desc text-warning trackerGroupNameDesc"></p>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">위치</label>
							<input type="text" class="inputField inputId" name="address1" placeholder="위치" readonly="readonly"/>
							<input type="hidden" name="areaCode"/>
							<input type="hidden" name="areaName"/>
							<input type="button" class="btn overlap" data-address-btn="" value="주소검색">
							<p class="text-desc text-warning address1Desc"></p>
						</div>
						<div class="rect02">
							<label class="title">상세 위치</label>
							<input type="text" class="inputField" name="address2" placeholder="상세 위치" />
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<div class="rect_25">
								<label class="title">위도</label>
								<input type="text" class="inputField" name="locLat" placeholder="위도" />
								<p class="text-desc text-warning latDesc"></p>
							</div>
							<div class="rect_25">
								<label class="title">경도</label>
								<input type="text" class="inputField" name="locLng" placeholder="경도" />
								<p class="text-desc text-warning lngDesc"></p>
							</div>
						</div>
						<div class="rect02">
							<label class="title">담당자</label>
							<input type="text" class="inputField" name="username" placeholder="홍길동" />
							<p class="text-desc text-warning usernameDesc"></p>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">연락처</label>
							<input type="text" class="inputField" name="phone" placeholder="000-0000-0000" />
							<p class="text-desc text-warning phoneDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">관리인</label>
							<input type="text" class="inputField" name="manager" placeholder="관리인" />
							<p class="text-desc text-warning managerDesc"></p>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">소유주</label>
							<input type="text" class="inputField" name="owner" placeholder="소유주" />
							<p class="text-desc text-warning ownerDesc"></p>
						</div>
						<div class="rect02">
							<label class="title">시공사</label>
							<input type="text" class="inputField" name="builder" placeholder="시공사" />
							<p class="text-desc text-warning builderDesc"></p>
						</div>
					</li>
					<li class="clearfix">
						<div class="rect01">
							<label class="title">설치 일자</label>
							<input type="date" class="inputField num" name="installDate" max="9999-12-31" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />"/>
							<p class="text-desc text-warning installDateDesc"></p>
						</div>
						<div class="rect02"></div>
					</li>
					<li>
						<div class="controlRec">
							<label class="title">군집제어 알고리즘</label>
							<ul class="controlGroup clearfix">
								<li class="control">
									<p class="tx">평균 제어</p>
									<div class="btnControlRec">
										<button type="button" class="btnControl">ON</button>
										<button type="button" class="btnControl dis">OFF</button>
										<input hidden="true" name="avaControlMode" value="Y">
									</div>
								</li>
								<li class="control">
									<p class="tx">그림자 제어</p>
									<div class="btnControlRec">
										<button type="button" class="btnControl">ON</button>
										<button type="button" class="btnControl dis">OFF</button>
										<input hidden="true" name="shadowControlMode" value="Y">
									</div>
								</li>
								<li class="control">
									<p class="tx">일몰 모드 제어</p>
									<div class="btnControlRec">
										<button type="button" class="btnControl">ON</button>
										<button type="button" class="btnControl dis">OFF</button>
										<input hidden="true" name="sunsetControlMode" value="Y">
									</div>
								</li>
								<li class="control">
									<p class="tx">SNOW 제어</p>
									<!-- <div class="controlSelectRec">
										<select class="selectOb">
											<option>시간</option>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
							
										<select class="selectOb">
											<option>적설량</option>
											<option>100</option>
											<option>200</option>
											<option>300</option>
											<option>400</option>
										</select>
									</div> -->
									<div class="btnControlRec">
										<button type="button" class="btnControl">ON</button>
										<button type="button" class="btnControl dis">OFF</button>
										<input hidden="true" name="snowControlMode" value="Y">
									</div>
								</li>
								<li class="control">
									<p class="tx">WIND 제어</p>
									<div class="btnControlRec">
										<button type="button" class="btnControl">ON</button>
										<button type="button" class="btnControl dis">OFF</button>
										<input hidden="true" name="windControlMode" value="Y">
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<label class="title">관리 이력</label>
						<textarea name="history"></textarea>
					</li>
					<li>
						<div class="imgForm">
							<label class="title">군집 사진</label>
							<input type="text" class="inputField inputId" name="imgFileText" readonly="readonly" />
							<input type="button" class="btn overlap" data-imgreg-btn="" value="사진 등록"> 
							<input type="file" name="imgFile" accept=".jpg, .jpeg, .gif, .png" style="position: absolute; display: none;">
							<p class="text-desc text-warning imgFileDesc"></p>
						</div>
					</li>
					<li>
						<div class="imgPreviewForm">
							<label class="title inBlock">군집 사진 미리보기</label>
							<input type="button" class="btn smallBtn" data-imgdel-btn="" value="사진 삭제">
							<div class="imgPreviewRec">
								<img class="imgPreview" style="width: 100%;"/>
							</div>
						</div>
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
	
</div>
	
<script src="${res }/group/js/groupReg.js"></script>
