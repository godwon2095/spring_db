<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html><head><title> CallableStatement Test </title></head>
<body>
<%
	Connection myConn = null;
	String result = null;
	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
	String user = "ST2015110417";   // 본인 아이디(ex.ST0000000000)
	String passwd = "ST2015110417";  // 본인 비밀번호(ex.ST0000000000)
	String dbdriver = "oracle.jdbc.driver.OracleDriver";

	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
	} catch (SQLException ex) {
		System.err.println("SQLException : " + ex.getMessage());
	}
	CallableStatement cstmt = myConn.prepareCall("{call test(?, ?)}");
	cstmt.setInt(1, 20011234);
	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);

	try {
		cstmt.execute();
		result = cstmt.getString(2);
%>
<script>
	alert("<%= result %>");
</script>
<%
	} catch (SQLException ex) {
		System.err.println("SQLException : " + ex.getMessage());
	} finally {
		if (cstmt != null)
			try {
				myConn.commit();
				cstmt.close();
				myConn.close();
			} catch (SQLException ex) {

			}
	}
%>
</body></html>
