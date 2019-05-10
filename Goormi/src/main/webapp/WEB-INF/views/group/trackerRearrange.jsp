<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<div class="contentwrap">
	<div class="titleRec">
		<h2 class="titleTx">군집 상세보기</h2>
		<p class="navi">
			<span class="home"></span>
			<span class="arrow"></span>
			<span>관리도구</span>
			<span class="arrow"></span>
			<span>군집 관리</span>
			<span class="arrow"></span>
			<span>군집 상세보기</span>
		</p>
	</div>
	<div class="inputRec">
		<div>
			<table>
				<colgroup>
					<c:forEach var="x" begin="0" end="${SIZE_X * 2}" step="1">
						<col width="30px"></col>
					</c:forEach>
				</colgroup>
				<tbody>
					<tr style="height: 30px;">
						<c:forEach var="x" begin="0" end="${SIZE_X * 2}" step="1">
							<th></th>
						</c:forEach>
					</tr>
					<c:forEach var="i" begin="1" end="${SIZE_Y }" step="1">
						<c:set var="y" value="${SIZE_Y-i}" scope="page"></c:set>
						<tr style="height: 30px;">
							<c:forEach var="x" begin="0" end="${SIZE_X - 1}" step="1">
								<c:if test="${x == 0 }">
									<th></th>
								</c:if>
								<th data-size-x="${x }" data-size-y="${y }">
									<c:forEach var="item" items="${TRACKER_REARRANGE_LIST }" varStatus="status" >
										<c:if test="${x == item.site_x && y == item.site_y }">
											<div style="background-color: yellow; width: 30px; height: 30px;">
												<span>${item.tracker_id }</span>
											</div>
										</c:if>
									</c:forEach>										
								</th>
								<th></th>
							</c:forEach>	
						</tr>
						<tr style="height: 30px;">
							<c:forEach var="x" begin="0" end="${SIZE_X * 2}" step="1">
								<th></th>
							</c:forEach>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div>
			<button data-tracker-gps-rearrange="${SEARCH_MAP.trackerGroupId }">GPS 좌표 매칭</button>
			<div>
				<table>
					<colgroup>
						<col width="100px"></col>
					</colgroup>
					<thead class="tableHead">
						<tr>
							<th>트래커명</th>
						</tr>
					</thead>
				</table>
			</div>
			<div style="overflow:scroll; height:300px; width: 100px;">
				<table>
					<colgroup>
						<col width="100px"></col>
					</colgroup>
					<tbody>
						<c:forEach var="item" items="${TRACKER_NON_REARRANGE_LIST }" varStatus="status">
							<tr>
								<th>${item.tracker_id }</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="${res }/group/js/trackerRearrange.js"></script>