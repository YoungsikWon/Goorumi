<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>  
<c:if test="${PAGING != null }">  
	<div class="pageNum" data-form-id="${param.formId}">
		<ul class="">
            <c:forEach var="i" begin="${PAGING.sheetStartPageNo }" end="${PAGING.sheetEndPageNo }" step="1">
           		<li class="pageNumBtn 
           			<c:if test="${i == PAGING.pageNo }">
           				active
           			</c:if>
           			" data-pageno="${i}">
					<a href="#" >${i}</a>
				</li>	
				
			</c:forEach>
		</ul>
	</div>
</c:if>
