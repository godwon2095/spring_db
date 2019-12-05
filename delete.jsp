<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, enrollBean.*"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="meta_css.html" %>
		<meta charset="EUC-KR">
		<title>수강신청 삭제</title>
	</head>
	<body>
		<%@ include file="top.jsp"%>
		<%
			if (session_id == null)
				response.sendRedirect("login.jsp");
		%>

		<table width="75%" align="center" border>
			<tr>
				<th>과목번호</th>
				<th>분반</th>
				<th>과목명</th>
				<th>학점</th>
				<th>배팅한 포인트</th>
				<th>수강신청</th>
			</tr>
			<br>
			<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
			<%
				Vector vlist = enrollMgr.getEnrollList(session_id);
				int counter = vlist.size();
				for (int i = 0; i < vlist.size(); i++) {
					Enroll en = (Enroll) vlist.elementAt(i);
			%>
			<tr>
				<td align="center"><%=en.getCId()%></td>
				<td align="center"><%=en.getCIdNo()%></td>
				<td align="center"><%=en.getCName()%></td>
				<td align="center"><%=en.getCUnit()%></td>
				<td align="center"><%=en.getPAmount()%></td>
				<td align="center"><a
					href="delete_verify.jsp?c_id=
					<%=en.getCId()%>&c_id_no=<%=en.getCIdNo()%>">삭제</a></td>
				<%
					}
				%>
			</tr>
		</table>
		<%@ include file="js.html" %>
	</body>
</html>
