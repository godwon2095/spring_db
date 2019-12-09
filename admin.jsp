<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<%
  String admin_session_id = (String)session.getAttribute("admin_user");
  if (admin_session_id == null) response.sendRedirect("admin_login.jsp");
%>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>수강신청 시스템 관리자</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">수강신청 시스템 관리자</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a href="#" class="btn btn-outline-success" data-confirm="정말 수강신청을 마감하시겠습니까?">마감하기</a>
    </nav>

    <%@ include file="js.html" %>
  </body>
</html>
