<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
  Connection conn = null;
  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
  Boolean connect = false;

  try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, "ST2015110417", "ST2015110417");
    connect = true;
    conn.close();
  } catch(Exception e){
    connect = false;
    out.print(e);
  }
 %>
<html>
  <head></head>
  <body>
    <% if(connect == true) {
      out.print("연결 되었습니다.");
    } else {
      out.print("연결에 실패하였습니다.");
    } %>
  </body>
</html>
