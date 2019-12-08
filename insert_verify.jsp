<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, enrollBean.*"%>
<!DOCTYPE html>
<html>
<head><title>수강신청 입력</title></head>
<body>
	<%
		String s_id = (String) session.getAttribute("user");
		String c_id = request.getParameter("c_id");
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
		int point = Integer.parseInt(request.getParameter("p_amount"));
		String result = null;
	%>
	<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
	<% result = enrollMgr.insertEnroll(s_id, c_id, c_id_no, point); %>
	<script>
		alert("<%= result %>");
		location.href = "insert.jsp";
	</script>
</body></html>
