<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*, studentBean.*"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="meta_css.html" %>
    <title>수강신청 입력</title>
  </head>
  <body>
    <%@ include file="top.jsp" %>
    <%
      if (session_id==null) response.sendRedirect("login.jsp");

      Connection myConn = null;
    	Statement stmt = null;
    	ResultSet myResultSet = null;
    	String mySQL = "";

    	String dburl  = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
    	String user="ST2015110417";
    	String passwd="ST2015110417";
    	String dbdriver = "oracle.jdbc.driver.OracleDriver";

    	try {
  	    Class.forName(dbdriver);
  	    myConn =  DriverManager.getConnection (dburl, user, passwd);
  	    stmt = myConn.createStatement();
       } catch(SQLException ex) {
	      System.err.println("SQLException: " + ex.getMessage());
  	   }
       mySQL = "SELECT c_id, c_id_no, c_name, c_unit FROM course WHERE c_id not in (SELECT c_id FROM enroll WHERE s_id='" + session_id + "')";
       myResultSet = stmt.executeQuery(mySQL);
     %>
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
          <%
          	if (myResultSet != null) {
              while (myResultSet.next()) {
              String c_id = myResultSet.getString("c_id");
              int c_id_no = myResultSet.getInt("c_id_no");
              String c_name = myResultSet.getString("c_name");
              int c_unit = myResultSet.getInt("c_unit");
              String t_max = "";
              String enrolls_count = "";

              CallableStatement cstmt = myConn.prepareCall("{call getCourseInfo(?, ?, ?)}");
              cstmt.setString(1, c_id);
              cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
              cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
              try {
                cstmt.execute();
                t_max = cstmt.getString(2);
              %>
              <tr>
                <th scope="row"><%= c_id %></th>
                <td><%= c_id_no %></td>
                <td><a href="#" id="c_name_<%= c_id %>"><%= c_name %></a></td>
                <td><%= c_unit %></td>
                <td><a href="#" data-toggle="modal" data-target="#modal-<%= c_id %>">수강신청</a></td>
              </tr>
              <div class="modal fade" id="modal-<%= c_id %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalCenterTitle">(<%= c_id %>)<%= c_name %></h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form method="post" action="insert_verify.jsp">
                       <div class="modal-body">
                        <div class="form-group">
                          <input type="hidden" name="c_id" value="<%= c_id %>">
                          <input type="hidden" name="c_id_no" value="<%= c_id_no %>">
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
                $('#c_name_<%= c_id %>').click(function(){
                  alert('모집인원은 <%= t_max %>명입니다.');
                });
              </script>
              <%
                } catch (SQLException ex) {
                  System.err.println("SQLException: " + ex.getMessage());
                }
                cstmt.close();
              }
            }
            stmt.close();
            myConn.close();
          %>
        </tbody>
      </table>
    </div>
  </body>
</html>
