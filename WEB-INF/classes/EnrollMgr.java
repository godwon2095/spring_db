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

	public Vector getEnrollList(String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		CallableStatement cstmt1 = null;
		CallableStatement cstmt2 = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			cstmt1 = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
			cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt1.execute();
			int nYear = cstmt1.getInt(1);

			cstmt2 = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
			cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt2.execute();
			int nSemester = cstmt2.getInt(1);

			String mySQL = "select c.c_id cid, c.c_id_no cid_no, c.c_name cname, c.c_unit cunit, p.p_amount pamount from course c, enroll e, point_history p where p.e_id = e.e_id and e.c_id = c.c_id and e.c_id_no = c.c_id_no and e.s_id=?and e.e_year=? and e.e_semester=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			pstmt.setInt(2, nYear);
			pstmt.setInt(3, nSemester);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Enroll en = new Enroll();
				en.setCId(rs.getString("cid"));
				en.setCIdNo(rs.getInt("cid_no"));
				en.setCName(rs.getString("cname"));
				en.setCUnit(rs.getInt("cunit"));
				en.setPAmount(rs.getInt("pamount"));
				vecList.add(en);
			}
			cstmt1.close();
			cstmt2.close();
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

	public void deleteEnroll(String s_id, String c_id, int c_id_no) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;
		int p_amount = 0;
		try {
			conn = pool.getConnection();

			String mySQL2 = "select p_amount from point_history where s_id=? and c_id=? and c_id_no=? and p_type='usage'";
			pstmt2 = conn.prepareStatement(mySQL2);
			pstmt2.setString(1, s_id);
			pstmt2.setString(2, c_id);
			pstmt2.setInt(3, c_id_no);
			rs = pstmt2.executeQuery();

			while (rs.next()) {
				p_amount = rs.getInt("p_amount");
			}
			pstmt2.close();

			String mySQL3 = "update student set s_point=s_point+? where s_id=?";
			pstmt3 = conn.prepareStatement(mySQL3);
			pstmt3.setInt(1, p_amount);
			pstmt3.setString(2, s_id);
			pstmt3.executeUpdate();
			pstmt3.close();

			String mySQL4 = "insert into point_history(s_id, c_id, c_id_no, p_amount, p_type) values (?, ?, ?, ?, 'cancel')";
			pstmt4 = conn.prepareStatement(mySQL4);
			pstmt4.setString(1, s_id);
			pstmt4.setString(2, c_id);
			pstmt4.setInt(3, c_id_no);
			pstmt4.setInt(4, p_amount);
			pstmt4.executeUpdate();

			String mySQL1 = "delete from enroll where s_id=? and c_id=? and c_id_no=?";
			pstmt1 = conn.prepareStatement(mySQL1);
			pstmt1.setString(1, s_id);
			pstmt1.setString(2, c_id);
			pstmt1.setInt(3, c_id_no);
			pstmt1.executeUpdate();
			pstmt1.close();

			pstmt4.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
	}
}
