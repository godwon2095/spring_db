<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, enrollBean.*"%>
<html>
	<head>
		<%@ include file="meta_css.html" %>
		<title>수강신청 조회</title>
	<head>
	<body>
		<%@ include file="top.jsp" %>

		<% if (session_id==null) response.sendRedirect("login.jsp"); %>
		<div class="container">
			<table class="table table-striped" style="margin-bottom: 30px;">
				<thead>
					<tr>
						<th>과목번호</th>
						<th>분반</th>
						<th>과목명</th>
						<th>학점</th>
						<th>배팅포인트</th>
						<th>성공여부</th>
					</tr>
				</thead>
				<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" />
				<tbody>
				<%
					Vector vlist = null;
					int year, semester;

					if (request.getParameter("year") == null && request.getParameter("semester") == null) {
						year = enrollMgr.getCurrentYear();
						semester = enrollMgr.getCurrentSemester();
					} else {
						year = Integer.parseInt(request.getParameter("year"));
						semester = Integer.parseInt(request.getParameter("semester"));
					}

					vlist = enrollMgr.getEnrollList(session_id, year, semester);
					int counter = vlist.size();
					int totUnit = 0;
					int successUnit = 0;

					for(int i=0; i<vlist.size(); i++) {
						Enroll en = (Enroll)vlist.elementAt(i);
						Boolean success = en.getESuccess();
						totUnit += en.getCUnit();
						if (success) {
							successUnit += en.getCUnit();
						}
						%>
						<tr>
						<td><%=en.getCId()%></td>
						<td><%=en.getCIdNo()%></td>
						<td><%=en.getCName()%></td>
						<td><%=en.getCUnit()%></td>
						<td><%= en.getPAmount() %></td>
						<% if (success) { %>
							<td>성공</td>
						<% } else { %>
							<td>미확정</td>
						<% } %>

					<%	}  %>

					</tr>
				</tbody>
			</table>
				<br>
			<table class="table" style="margin-bottom: 70px;">
				<tr>
					<th>총신청과목수</th>
					<td align="center"><%= counter %></td>
				</tr>
				<tr>
					<th>총신청학점</th>
					<td align="center"><%= totUnit %></td>
				</tr>
				<tr>
					<th>총확정학점</th>
					<td align="center"><%= successUnit %></td>
				</tr>
			</table>
			<hr>
			<h3>수강신청 내역 조회하기</h3>
			<form method="post" action="select_verify.jsp" >
				<div class="form-group">
					<label for="year">년도</label>
					<input type="number" name="year" value=<%= year %> class="form-control">
					<label for="semester">학기</label>
					<input type="number" name="semester" value=<%= semester %> min="1" max="2" class="form-control">
				</div>
				<input TYPE="submit" NAME="Submit" VALUE="조회" class="btn btn-primary">
			</form>
		</div>
		<%@ include file="js.html" %>
	</body>
</html>
