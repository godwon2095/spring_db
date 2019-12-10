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
			<a href="#" style="margin-bottom: 20px;" data-toggle="modal" data-target=".bd-example-modal-lg">내 시간표 조회</a>
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

					for(int i=0; i< counter; i++) {
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

			<%
				System.out.println(year);
				System.out.println(semester);
				Vector vlist2 = null;
				vlist2 = enrollMgr.getTimeTableList(session_id, year, semester);
				int counter2 = vlist2.size();
				String class1_name = "";
				String class2_name = "";
				String class3_name = "";
				String class4_name = "";
				String class5_name = "";
				String class6_name = "";
				String class7_name = "";
				String class8_name = "";

				for(int i=0; i< counter2; i++) {
					EnrolledTime en = (EnrolledTime)vlist2.elementAt(i);
					int class_time = en.getTTime();
					switch (class_time) {
					case 1:
						class1_name = en.getCName();
						break;
					case 2:
						class2_name = en.getCName();
						break;
					case 3:
						class3_name = en.getCName();
						break;
					case 4:
						class4_name = en.getCName();
						break;
					case 5:
						class5_name = en.getCName();
						break;
					case 6:
						class6_name = en.getCName();
						break;
					case 7:
						class7_name = en.getCName();
						break;
					case 8:
						class8_name = en.getCName();
						break;
					}
				}
			 %>

			<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">내 시간표</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
						<div class="modal-body">
							<table class="table table-striped">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">수업명</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">1교시</th>
							      <td><%= class1_name %></td>
							    </tr>
							    <tr>
							      <th scope="row">2교시</th>
							      <td><%= class2_name %></td>
							    </tr>
							    <tr>
							      <th scope="row">3교시</th>
							      <td><%= class3_name %></td>
							    </tr>
							    <tr>
							      <th scope="row">4교시</th>
							      <td><%= class4_name %></td>
							    </tr>
									<tr>
							      <th scope="row">5교시</th>
							      <td><%= class5_name %></td>
							    </tr>
									<tr>
							      <th scope="row">6교시</th>
							      <td><%= class6_name %></td>
							    </tr>
									<tr>
							      <th scope="row">7교시</th>
							      <td><%= class7_name %></td>
							    </tr>
									<tr>
							      <th scope="row">8교시</th>
							      <td><%= class8_name %></td>
							    </tr>
							  </tbody>
							</table>
						</div>
			    </div>
			  </div>
			</div>

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
