package studentBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import studentBean.*;

public class StudentInfo {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public StudentInfo() {
		try {
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:dblab");
			ocpds.setUser("ST2015110417");
			ocpds.setPassword("ST2015110417");
			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}

	public Vector getSessionInfos(String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mySQL = "";
		Vector vecList = new Vector();

  	try {
  	  conn = pool.getConnection();
			mySQL = "select s_addr, s_pwd, s_college, s_major from student where s_id=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Student st = new Student();
				st.setSAddr(rs.getString("s_addr"));
				st.setSPwd(rs.getString("s_pwd"));
				st.setSCollege(rs.getString("s_college"));
				st.setSMajor(rs.getString("s_major"));
				vecList.add(st);
			}

			pstmt.close();
			conn.close();
    } catch(SQLException ex) {
	    System.err.println("SQLException: " + ex.getMessage());
  	}
		return vecList;
	}
}
