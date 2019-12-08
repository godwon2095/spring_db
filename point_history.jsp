<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*, pointBean.*"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>포인트 사용내역</title>
  </head>
  <body>
    <%@ include file="top.jsp" %>
    <% if (session_id==null) response.sendRedirect("login.jsp"); %>
    <div class="container">
      <h1>포인트 사용내역</h1>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">순서</th>
            <th scope="col">내용</th>
            <th scope="col">포인트</th>
            <th scope="col">시간</th>
          </tr>
        </thead>
        <tbody>
          <jsp:useBean id="pointMgr" class="pointBean.PointMgr" />
          <%
            Vector vlist = pointMgr.getPointHistories(session_id);
						int counter = vlist.size();
						for (int i = 0; i < vlist.size(); i++) {
							Point pt = (Point) vlist.elementAt(i);
              String pointType = null;
              String ptype = pt.getPType();
              String sign = null;
              if (ptype.contains("delete_enroll")) {
                sign = "+";
                pointType = "배팅 취소";
              } else if (ptype.contains("charge")) {
                sign = "+";
                pointType = "충전";
              } else if (ptype.contains("deduction")) {
                sign = "-";
                pointType = "차감";
              } else if (ptype.contains("enroll")) {
                sign = "-";
                pointType = "수강신청 배팅";
              }
           %>
           <tr>
             <td><%= i + 1 %></td>
             <td><%= sign + pt.getPAmount() %></td>
             <td><%= pointType %></td>
             <td><%= pt.getPCreatedAt() %></td>
           </tr>
           <%
            }
            %>
        </tbody>
      </table>
    </div>
  </body>
</html>
