<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<%
  String session_id = (String)session.getAttribute("user");
  String session_name = (String)session.getAttribute("name");

  String log;
  if (session_id == null)
    log="<a href=login.jsp class='nav-link'>로그인</a>";
  else
    log="<a href=logout.jsp class='nav-link'>로그아웃</a>";
 %>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="main.jsp">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="insert.jsp">수강신청 입력</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="delete.jsp">수강신청 삭제</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="select.jsp">수강신청 조회</a>
      </li>
      <li class="nav-item">
        <%= log %>
      </li>
      <% if (session_id != null) { %>
      <li class="nav-item">
        <a class="nav-link" href="update.jsp">사용자 정보 수정</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"><%= session_name %>님 방문을 환영합니다.</a>
      </li>
      <% } else { %>
      <li class="nav-item">
        <a class="nav-link">로그인한 후 사용하세요.</a>
      </li>
      <%
      }
      %>
    </ul>
  </div>
</nav>
