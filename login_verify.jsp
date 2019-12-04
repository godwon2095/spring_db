<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user = "ST2015110417";
	String passwd = "ST2015110417";
	String dbdriver = "oracle.jdbc.OracleDriver";

	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();

	mySQL = "select s_id, s_name from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'";

	ResultSet myResultSet = stmt.executeQuery(mySQL);
	System.out.println(mySQL);

	if (myResultSet.next()) {
		session.setAttribute("user", userID);
		session.setAttribute("name", myResultSet.getString("s_name"));
		response.sendRedirect("main.jsp");
	} else {
%>

<script>
	alert("사용자아이디 혹은 암호가 틀렸습니다.");
	location.href = "login.jsp";
</script>
<%
	}
	stmt.close();
	myConn.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
