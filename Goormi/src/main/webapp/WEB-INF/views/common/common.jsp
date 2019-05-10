<%-- <%@ page session="false" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%

String contextPath = request.getContextPath();
request.setAttribute("cp", contextPath);

request.setAttribute("res", request.getContextPath() + "/resources/res");
request.setAttribute("lib", request.getContextPath() + "/resources/lib");

%>
<jsp:useBean id="toDay" class="java.util.Date" />
<script>window._cp='${cp}';</script>
<script>window._res='${res}';</script>
<script>window._lib='${lib}';</script>