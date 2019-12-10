<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, adminUserBean.*"%>
<!DOCTYPE html>
<html>
<head><title>수강신청 마감</title></head>
<body>
	<%
		String admin_session_id = (String)session.getAttribute("admin_user");
    if (admin_session_id != null) {
	%>
		<jsp:useBean id="adminUserMgr" class="adminUserBean.AdminUserMgr" />
		<% String result = adminUserMgr.finishEnroll(); %> 
		<script>
			alert("<%= result %>");
			location.href = "insert.jsp";
		</script>
	<% } %>
</body>
</html>
