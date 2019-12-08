package courseBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import courseBean.Course;

public class CourseMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public CourseMgr() {
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

	public Vector getCourseList(String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mySQL = "";
		Vector vecList = new Vector();
		CallableStatement cstmt = null;

  	try {
  	  conn = pool.getConnection();
			mySQL = "SELECT c_id, c_id_no, c_name, c_unit FROM course WHERE c_id not in (SELECT c_id FROM enroll WHERE s_id=?)";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				cstmt = conn.prepareCall("{call getCourseInfo(?, ?, ?)}");
				cstmt.setString(1, rs.getString("c_id"));
				cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
				cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				cstmt.execute();

				Course course = new Course();
				course.setCId(rs.getString("c_id"));
				course.setCIdNo(rs.getString("c_id_no"));
				course.setCName(rs.getString("c_name"));
				course.setCUnit(rs.getString("c_unit"));
				course.setTMax(cstmt.getInt(2));
				course.setEnrollsCount(cstmt.getInt(3));
				vecList.add(course);
			}

			pstmt.close();
			cstmt.close();
			conn.close();
    } catch(SQLException ex) {
	    System.err.println("SQLException: " + ex.getMessage());
  	}
		return vecList;
	}
}
