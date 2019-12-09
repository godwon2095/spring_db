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
		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">과목번호</th>
						<th scope="col">분반</th>
						<th scope="col">과목명</th>
						<th scope="col">학점</th>
						<th scope="col">배팅한 포인트</th>
						<th scope="col">수강신청</th>
					</tr>
				</thead>
				<tbody>
				<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
					<%
						int year = enrollMgr.getCurrentYear();
						int semester = enrollMgr.getCurrentSemester();

						Vector vlist = enrollMgr.getEnrollList(session_id, year, semester);
						int counter = vlist.size();
						for (int i = 0; i < counter; i++) {
							Enroll en = (Enroll) vlist.elementAt(i);
					%>
					<tr>
						<td><%=en.getCId()%></td>
						<td><%=en.getCIdNo()%></td>
						<td><%=en.getCName()%></td>
						<td><%=en.getCUnit()%></td>
						<td><%=en.getPAmount()%></td>
						<td><a
							href="delete_verify.jsp?e_id=
							<%=en.getEId()%>" data-confirm="정말 삭제하시겠습니까?">삭제</a></td>
						<%
							}
						%>
					</tr>
				</tbody>
			</table>
		</div>
		<%@ include file="js.html" %>
	</body>
</html>
