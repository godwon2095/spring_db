<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, studentBean.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>수강신청 사용자 정보 수정</title>
  </head>
  <body>
    <%@ include file="top.jsp" %>

    <% if (session_id==null) response.sendRedirect("login.jsp"); %>

    <jsp:useBean id="studentInfo" class="studentBean.StudentInfo" />
    <%
      Vector vlist = studentInfo.getSessionInfos(session_id);
      int counter = vlist.size();
      for (int i = 0; i < vlist.size(); i++) {
        Student st = (Student) vlist.elementAt(i);
    %>
    <div class="container">
      <form method="post" action="update_verify.jsp">
        <input type="hidden" name="s_id" size="30" value="<%= session_id %>">
        <table width="75%" align="center" border>
           <tr><th>주소</th>
               <td><input type="text" name="s_addr" size="50" value="<%= st.getSAddr() %>"> </td>
           </tr>
           <tr><th>패스워드</th>
               <td><input type="password" name="s_pwd" size="20"  value="<%= st.getSPwd() %>"></td>
           </tr>
           <tr><th>학부</th>
               <td><input type="text" name="s_college" size="20"  value="<%= st.getSCollege() %>"></td>
           </tr>
            <tr><th>전공</th>
                <td><input type="text" name="s_major" size="20"  value="<%= st.getSMajor() %>"></td>
            </tr>
      <%
      	}
      %>
      <tr>
      	<td colspan="2" align="center">
      	<input type="submit" class="btn btn-outline-primary" value="수정">
      	</td>
      </tr>
      </table>
      </form>
    </div>
    <%@ include file="js.html" %>
  </body>
</html>
