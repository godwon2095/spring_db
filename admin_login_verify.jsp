<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*, adminUserBean.*"%>
<jsp:useBean id="adminUserMgr" class="adminUserBean.AdminUserMgr" />
<%
	String adminUserEmail = request.getParameter("adminUserEmail");
	String adminUserPassword = request.getParameter("adminUserPassword");

	Vector vlist = adminUserMgr.getAdminUser(adminUserEmail, adminUserPassword);
	int counter = vlist.size();

	if (counter == 0) {
%>
<script>
	alert("관리자 이메일 혹은 암호가 틀렸습니다.");
	location.href = "admin_login.jsp";
</script>
<%
	} else {
		AdminUser admin_user = (AdminUser) vlist.elementAt(0);
		session.setAttribute("admin_user",  Integer.toString(admin_user.getAID()));
		response.sendRedirect("admin.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
