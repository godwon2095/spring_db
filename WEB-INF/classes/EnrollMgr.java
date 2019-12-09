package enrollBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import enrollBean.*;

public class EnrollMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public EnrollMgr() {
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

	public Vector getEnrollList(String s_id, int nYear, int nSemester) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select e.e_id eid, c.c_id cid, c.c_id_no cid_no, c.c_name cname, c.c_unit cunit, p.p_amount pamount, e.e_success esuccess from course c, enroll e, point_history p where p.e_id = e.e_id and e.c_id = c.c_id and e.c_id_no = c.c_id_no and e.s_id=?and e.e_year=? and e.e_semester=? and p.e_id is not null";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			pstmt.setInt(2, nYear);
			pstmt.setInt(3, nSemester);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Enroll en = new Enroll();
				en.setEId(rs.getInt("eid"));
				en.setCId(rs.getString("cid"));
				en.setCIdNo(rs.getInt("cid_no"));
				en.setCName(rs.getString("cname"));
				en.setCUnit(rs.getInt("cunit"));
				en.setPAmount(rs.getInt("pamount"));
				en.setESuccess(rs.getBoolean("esuccess"));
				vecList.add(en);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public int getCurrentYear() {
		int nYear = 0;
		Connection conn = null;
		CallableStatement cstmt = null;
		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nYear = cstmt.getInt(1);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nYear;
	}

	public int getCurrentSemester() {
		int nSemester = 0;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nSemester = cstmt.getInt(1);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nSemester;
	}

	public String insertEnroll(String s_id, String c_id, int c_id_no, int point) {
		Connection conn = null;
		String result = null;
		String err_msg = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{call InsertEnroll(?, ?, ?, ?, ?)}");
			cstmt.setString(1, s_id);
			cstmt.setString(2, c_id);
			cstmt.setInt(3, c_id_no);
			cstmt.setInt(4, point);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			System.out.println(s_id+ "," + c_id+ "," + c_id_no+ "," + java.sql.Types.VARCHAR);
			cstmt.execute();
			result = cstmt.getString(5);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			err_msg = "Exception" + ex;
			result = err_msg;
			System.out.println(err_msg);
		}
		return result;
	}

	public String deleteEnroll(int e_id, String s_id) {
		Connection conn = null;
		String result = null;
		String err_msg = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{call DeleteEnroll(?, ?, ?)}");
			cstmt.setInt(1, e_id);
			cstmt.setString(2, s_id);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.execute();
			result = cstmt.getString(3);
			System.out.println(result);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			err_msg = "Exception" + ex;
			result = err_msg;
			System.out.println(err_msg);
		}
		return result;
	}
}
