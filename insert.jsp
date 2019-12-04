<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"  %>
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
    <div class="container">
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
                enrolls_count = cstmt.getString(3);
              %>
              <tr>
                <th scope="row"><%= c_id %></th>
                <td><%= c_id_no %></td>
                <td><a href="#" id="c_name_<%= c_id %>"><%= c_name %></a></td>
                <td><%= c_unit %></td>
                <td><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">수강신청</a></td>
              </tr>
              <script>
                $('#c_name_<%= c_id %>').click(function(){
                  var remained = parseInt('<%= t_max %>') - parseInt('<%= enrolls_count %>');
                  alert('모집인원은 <%= t_max %>명이며, 현재 수강신청을 할 수 있는 인원은 ' + remained + '명입니다.');
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
