<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*, studentBean.*"%>
<%@ page import="java.util.*, courseBean.*"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>수강신청 입력</title>
  </head>
  <body>
    <%@ include file="top.jsp" %>
    <% if (session_id==null) response.sendRedirect("login.jsp"); %>
     <jsp:useBean id="studentInfo" class="studentBean.StudentInfo" />
     <% int point = studentInfo.getStudentsPoint(session_id); %>
    <div class="container">
      <h4>사용 가능 포인트 : <%= point %></h4>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">과목번호</th>
            <th scope="col">분반</th>
            <th scope="col">과목명</th>
            <th scope="col">학점</th>
            <th scope="col">수강신청</th>
          </tr>
        </thead>
        <tbody>
          <%@ include file="js.html" %>
          <jsp:useBean id="courseMgr" class="courseBean.CourseMgr" />
          <%
            Vector vlist = courseMgr.getCourseList(session_id);
						int counter = vlist.size();
						for (int i = 0; i < counter; i++) {
							Course course = (Course) vlist.elementAt(i);
          %>
          <tr>
            <th scope="row"><%= course.getCId() %></th>
            <td><%= course.getCId() %></td>
            <td><a href="#" id="c_name_<%= course.getCId() %>"><%= course.getCName() %></a></td>
            <td><%= course.getCUnit() %></td>
            <td><a href="#" data-toggle="modal" data-target="#modal-<%= course.getCId() %>">수강신청</a></td>
          </tr>
          <div class="modal fade" id="modal-<%= course.getCId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalCenterTitle">(<%= course.getCId() %>)<%= course.getCName() %></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <form method="post" action="insert_verify.jsp">
                   <div class="modal-body">
                    <div class="form-group">
                      <input type="hidden" name="c_id" value="<%= course.getCId() %>">
                      <input type="hidden" name="c_id_no" value="<%= course.getCIdNo() %>">
                      <label for="message-text" class="col-form-label">배팅할 포인트</label>
                      <input type="number" min="0" max="<%= point %>" name="p_amount" class="form-control" id="message-text" required></input>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <input type="submit" class="btn btn-primary" value="수강신청">
                  </div>
                </form>
              </div>
            </div>
          </div>
          <script>
            $('#c_name_<%= course.getCId() %>').click(function(){
              alert('모집인원은 <%= course.getTMax() %>명이고, 현재 신청인원은 <%= course.getEnrollsCount() %>명 입니다.');
            });
          </script>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
  </body>
</html>
