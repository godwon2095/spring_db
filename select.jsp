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
			<table class="table table-striped">
				<thead>
					<tr>
						<th>과목번호</th>
						<th>분반</th>
						<th>과목명</th>
						<th>학점</th>
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

					for(int i=0; i<vlist.size(); i++) {
						Enroll en = (Enroll)vlist.elementAt(i);
						totUnit += en.getCUnit();
				%>

					<tr>
					<td align="center"><%=en.getCId()%></td>
					<td align="center"><%=en.getCIdNo()%></td>
					<td align="center"><%=en.getCName()%></td>
					<td align="center"><%=en.getCUnit()%></td>

					<%	}  %>

					</tr>
				</tbody>
			</table>
				<br>
			<table class="table">
				<tr>
					<th>총신청과목수</th>
					<td align="center"><%= counter %></td>
				</tr>
				<tr>
					<th>총신청학점</th>
					<td align="center"><%= totUnit %></td>
				</tr>
			</table>
			<hr>
			<form method="post" action="select_verify.jsp" >
				<div class="form-group">
					<label for="year">년도</label>
					<input type="text" name="year" value=<%= year %> class="form-control" size=4>
					<label for="semester">학기</label>
					<input type="text" name="semester" value=<%= semester %> class="form-control" size=1>
				</div>
				<input TYPE="submit" NAME="Submit" VALUE="조회" class="btn btn-primary">
			</form>
		</div>
		<%@ include file="js.html" %>
	</body>
</html>
