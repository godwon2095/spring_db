<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>수강신청 시스템 로그인</title>
  </head>
  <body>
    <%@ include file="top.jsp" %>

    <div class="container">
      <table width="75%" align="center" bgcolor="#FFFF99" border>
        <tr>
          <td>
            <div align="center">
              아이디와 패스워드를 입력하세요
            </div>
          </td>
        </tr>
      </table>
      <table width="75%" align="center" bgcolor="#FFFF99" border>
        <form method="post" action="login_verify.jsp">
          <tr>
            <td>
              <div align="center">
                아이디
              </div>
            </td>
            <td>
              <div align="center">
                <input type="text" name="userID">
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div align="center">
                패스워드
              </div>
            </td>
            <td>
              <div align="center">
                <input type="password" name="userPassword">
              </div>
            </td>
          </tr>
          <tr>
            <td colspan=2>
              <div align="center">
                <input type="submit" class="btn btn-primary" name="Submit" value="로그인">
                <input type="reset" class="btn btn-outline-primary" value="취소">
              </div>
            </td>
          </tr>
        </form>
      </table>
    </div>

    <%@ include file="js.html" %>
  </body>
</html>
