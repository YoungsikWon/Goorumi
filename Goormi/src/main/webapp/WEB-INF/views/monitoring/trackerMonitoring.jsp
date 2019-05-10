<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="dashboard">
	<div class="titleRec">
		<h2 class="titleTx">통합 모니터링</h2>
		<p class="navi">
			<span>통합모니터링</span>
			<span class="arrow"></span>
			<span class="home"></span>
		</p>
	</div>
	<div class="searchRec">
		<form id="#">
			<ul>
				<li class="searchTerms">
					<label class="searchTermsTx">발전소(군집)</label>
					<select class="selectBox">
						<option>서울02</option>
						<option>경기도 광명01</option>
						<option>경기도 성남01</option>
						<option>경기도 광주01</option>
						<option>충북 청주01</option>
						<option>충북 의성01</option>
						<option>충남 당진01</option>
						<option>충남 서산01</option>
						<option>경북 구미01</option>
					</select>
				</li>
				<li class="searchTerms">
					<label class="searchTermsTx">트래커</label>
					<select class="selectBox">
						<option>tracker-01</option>
						<option>tracker-02</option>
						<option>tracker-03</option>
						<option>tracker-04</option>
					</select>
				</li>
				
				
				<li class=""><button class="btn selectBtn">선택</button></li>
			</ul>
		</form>
	</div>
	<div class="row clearfix">
		<section class="col col-40">
			<div class="box dashHeader">
				<p class="tx">
					<label>군집명</label>
					<span>${GROUP_INFO.tracker_group_name }</span>
				</p>
				<p class="tx">
					<label>사용자</label>
					<span>${GROUP_INFO.username }</span>
				</p>
				<p class="tx">
					<label>총 용량</label>
					<span class="info">${GROUP_INFO.capacity } kW</span>
				</p>
			</div>
			<div class="box graph01">graph01</div>
		</section>
		<section class="col col-60">
			<div class="box graph02">graph02</div>
		</section>
	</div>
	<div class="row clearfix">
		<section class="col col-40">
			<div class="box graph03">
				<ul>
					<li>전일 발전량<p>45.0 kW</p></li>
					<li>총 누적 발전량<p>241.0 kW</p></li>
					<li>발전효율<p>34%</p></li>
				</ul>
			</div>
		</section>
		<section class="col col-20">
			<div class="box graph04">
				<ul>
					<li>날씨<p>맑음</p></li>
					<li>온도<p>28 ℃</p></li>
					<li>습도<p>62 %</p></li>
					<li>풍속<p>3 m/s</p></li>
					<li>조도<p>34 %</p></li>
				</ul>
			</div>
		</section>
		<section class="col col-40">
			<div class="box graph05">
				<table class="ListTable">
					<caption></caption>
					<colgroup>
						<col width="40px"></col>
						<col></col>
						<col width="100px"></col>
						<col width="100px"></col>
						<col width="100px"></col>
					</colgroup>
					<thead class="tableHead">
						<tr>
							<th class="txC">번호</th>
							<th>아이디</th>
							<th>알람 타임</th>
							<th>등급</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody class="tableBody">
						<tr>
							<td class="txC">4</td>
							<td>abcd</td>
							<td>김사부</td>
							<td>박노을</td>
							<td class="num ft11">2017-02-01 10:24:22</td>
						</tr>
						<tr>
							<td class="txC">3</td>
							<td>abcd</td>
							<td>김사부</td>
							<td>박노을</td>
							<td class="num ft11">2017-02-01 10:24:22</td>
						</tr>
						<tr>
							<td class="txC">2</td>
							<td>abcd</td>
							<td>김사부</td>
							<td>박노을</td>
							<td class="num ft11">2017-02-01 10:24:22</td>
						</tr>
						<tr>
							<td class="txC">1</td>
							<td>abcd</td>
							<td>김사부</td>
							<td>박노을</td>
							<td class="num ft11">2017-02-01 10:24:22</td>
						</tr>
					</tbody>
				</table>
			</div>
		</section>
	</div>
</div>