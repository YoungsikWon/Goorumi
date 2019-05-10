<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>

<p class="viewNum" data-form-id="${param.formId}">
	<select class="selectBox">
		<option <c:if test="${10 == PAGING.rowsLen }"> selected </c:if> value="10">10개씩 보기</option>
		<option <c:if test="${20 == PAGING.rowsLen }"> selected </c:if> value="20">20개씩 보기</option>
		<option <c:if test="${30 == PAGING.rowsLen }"> selected </c:if> value="30">30개씩 보기</option>
		<option <c:if test="${40 == PAGING.rowsLen }"> selected </c:if> value="40">40개씩 보기</option>
		<option <c:if test="${50 == PAGING.rowsLen }"> selected </c:if> value="50">50개씩 보기</option>
	</select>
</p>