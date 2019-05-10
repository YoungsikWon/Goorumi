<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<script>
	console.log('${TRACKER_DATA_LIST}');
	var model = '${TRACKER_DATA_LIST}';
	console.log(model);
</script>

<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">군집 현황</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>군집 현황</span>
		</p>
	</div>
	<jsp:include page="/WEB-INF/views/common/groupSelForm.jsp" />
	
	<div class="trakerGroup">
		<div class="trackerRec">
			<div class="trackerTitleRec">
				<ul class="GrouptrackerInfo clearfix">
					<li>
						<span class="infoTitle">군집명</span>
						<span class="infoTx">${INFO.tracker_group_name }</span>
					</li>
					<li>
						<span class="infoTitle">사용자</span>
						<span class="infoTx">${INFO.username }</span>
					</li>
					<li>
						<span class="infoTitle">트래커 수</span>
						<span class="infoTx">${INFO.tracker_cnt }</span>
					</li>
					<li>
						<span class="infoTitle">인버터 수</span>
						<span class="infoTx">${INFO.inverter_cnt }</span>
					</li>
					<li>
						<span class="infoTitle">용량</span>
						<span class="infoTx">${INFO.capacity } kW</span>
					</li>
					<input type="button" value="트래커 수동 배치" onclick="readyBatchTracker()"/>
				</ul>
				<div class="GroupTrackerEditMode">
					<h3 class="title">트래커 배치
						<span class="subTx">트래커를 마우스로 드래그앤 드랍으로 배치하세요</span>
					</h3>
					<input type="button" value="트래커 배치 저장" onclick="updateBatchTracker()"/>
				</div>
			</div>
			<div class="trackerTableRec">

			</div>
		</div>
		
		<div class="remoteController" id="remoteController" ondragstart="onDragStart(event)" draggable="true">
			<div class="remote-banner">
				<div class="remote-title">원격제어</div>
				
				<div class="remote-explain">트래커를 제어하시려면 제어시작 버튼을 눌러주세요</div>

				<div class="remote-stop-group">
					<button type="button" class="remote-start-btn">제어 시작</button>
				</div>
				
				<div class="remote-start-group">
					<button type="button" class="remote-stop-btn">제어 중지</button>
					
					<div class="btnRec">
			            <button type="button" class="btn auto_btn active" data-set="auto">자동</button>
			            <button type="button" class="btn manual_btn" data-set="manual">수동</button>
		            </div>			
		            			
					<div class="remote-box" draggable="false">
						<div class="remote-manual-group">
							<div class="remote-top" data-control="up"></div>
							<div class="remote-left" data-control="left"></div>
							<div class="remote-right" data-control="right"></div>						
							<div class="remote-bottom" data-control="down"></div>
							<div class="remote-stop" data-control="stop"></div>
						</div>
						<div class="remote-auto-group">
							<button type="button" data-control="auto" class="btn auto-action-btn">자동모드 실행</button>
							<div class="trackerAllCheckGroup" for="trackerAllCheck">
								<button type="button" id="trackerAllCheck" class="trackerAllCheck" name="trackerAllCheck">전체 선택</button>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	
	<section>
		<div class="searchRec">
			<form id="alarmTableForm">
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="pageSize" value="10">
				<ul class="clearfix">
					<li class="searchTerms">
						<label class="searchTermsTx">트래커 ID</label>
						<select class="selectBox" name="trackerId">
						</select>
					</li>
					<li class="searchTerms">
						<label class="searchTermsTx">알람 등급</label>
						<select class="selectBox" name="alarmGrade">
							<option value="">전체</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</li>
					<li class="searchBtnRec"><button type="button" class="btn selectBtn">선택</button></li>
				</ul>
			</form>
		</div>
		<div class="tableRec">
			<table class="ListTable alarmList">
				<caption></caption>
				<colgroup>
					<col width="40px"></col>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
				</colgroup>
				<thead class="tableHead">
					<tr>
						<th class="txC">번호</th>
						<th>트래커 아이디</th>
						<th>알람 타입</th>
						<th>알람 등급</th>
						<th>발생 일시</th>
					</tr>
				</thead>
				<tbody class="tableBody">
				</tbody>
			</table>
			<div class="alarmListPageing pageNum"></div>
		</div>
	</section>
	
</div>
<script src="${res }/groupPresentState/js/group.js?_dm=5"></script>