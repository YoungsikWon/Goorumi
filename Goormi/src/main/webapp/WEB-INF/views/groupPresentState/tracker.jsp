<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">트래커 현황</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>트래커 현황</span>
		</p>
	</div>
	<jsp:include page="/WEB-INF/views/common/trackerSelForm.jsp" />
	<div class="row clearfix">
		<section class="col">
			<div class="box">
				<div class="trackerInfo">
					<ul>
						<li>
							트래커 아이디 : ${INFO.tracker_id }
						</li>
						<li>
							용량 : ${INFO.capacity }
						</li>
						<li>
							고도각 : ${INFO.x_angle }
						</li>
						<li>
							방위각 : ${INFO.y_angle }
						</li>
						<li>
							온도 : ${INFO.body_temp }
						</li>
						<li>
							습도 : ${INFO.body_humd }
						</li>
					</ul>
				</div>
			</div>
		</section>
		<section class="">
			<div class="box box-body-right">
				<div class="remote-banner">
					<div class="remote-title">
						원격제어
					</div>
					<div class="remote-explain">트래커를 제어하시려면 제어시작 버튼을 눌러주세요</div>
					
					<div class="remote-stop-group">
						<button type="button" class="remote-start-btn">제어 시작</button>
					</div>
					
					<div class="remote-start-group">
						<button type="button" class="remote-stop-btn">제어 중지</button>
						
						<div class="">
				            <button type="button" class="btn auto_btn" data-set="auto">자동</button>
				            <button type="button" class="btn manual_btn" data-set="manual">수동</button>
			            </div>			
			            			
						<div class="remote-box">
							<div class="remote-manual-group">
								ID
								<select>
									<option>1</option>
									<option>2</option>
								</select>
							
								<div class="remote-top" data-control="up">
								</div>
								<div class="remote-left" data-control="left">
								</div>
								<div class="remote-right" data-control="right">
								</div>						
								<div class="remote-bottom" data-control="down">
								</div>
							</div>
							<div class="remote-auto-group">
								<input type="checkbox"> 전체
								ID
								<select>
									<option>1</option>
									<option>2</option>
								</select>
								<button type="button" data-control="auto" class="btn auto-action-btn">자동모드 실행</button>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</section>
	</div>
	
	<section class="">
		<div class="box graph05">
			<div class="searchRec">
				<form id="alarmTableForm">
					<input type="hidden" name="pageNo" value="1">
					<input type="hidden" name="pageSize" value="10">
					<ul>
						<li class="searchTerms">
							<label class="searchTermsTx">알람 등급</label>
							<select name="alarmGrade">
								<option value="">전체</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select>
						</li>
						<li class=""><button class="btn selectBtn" type="button">선택</button></li>
					</ul>
				</form>
			</div>
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
<script src="${res }/groupPresentState/js/tracker.js"></script>