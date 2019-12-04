<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
	Connection myConn = null;
	int result;
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
	String user = "ST2015110417";   // 본인 아이디(ex.ST0000000000)
	String passwd = "ST2015110417";  // 본인 비밀번호(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	String sql = "";

	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
	} catch (SQLException ex) {
		System.err.println("SQLException : " + ex.getMessage());
	}

	try {
		sql = "Insert into Member(id, name) values (?,  '홍길동')";
		PreparedStatement pstmt = myConn.prepareStatement(sql);

		for (int i=8; i<=10; i++) {
			pstmt.setInt(1, i);
			if (pstmt.executeUpdate() != 0){
				out.println("<h3>" + i + "번 레코드를 등록하였습니다.</h3>");
			}
		}
	} catch (Exception ex) {
		ex.printStackTrace();
		System.err.println("SQLException : " + ex.getMessage());
	}
%>
