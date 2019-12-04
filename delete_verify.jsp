<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="enrollBean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 삭제 </title>
</head>
<body>
	<%
		String s_id = (String) session.getAttribute("user");
		String c_id = request.getParameter("c_id");
		int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
	%>
	<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" scope="page" />
	<%
		enrollMgr.deleteEnroll(s_id, c_id, c_id_no);
	%>
	<script>
		alert("삭제되었습니다.");
		location.href = "delete.jsp";
	</script>
</body>
</html>
