<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, enrollBean.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>수강신청 삭제 </title>
	</head>
	<body>
		<%
			int e_id = Integer.parseInt(request.getParameter("e_id"));
			String s_id = (String) session.getAttribute("user");
			String result = null;
		%>
		<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
		<% result = enrollMgr.deleteEnroll(e_id, s_id); %>
		<script>
			alert("<%= result %>");
			location.href = "delete.jsp";
		</script>
	</body>
</html>
