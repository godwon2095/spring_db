package adminUserBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import adminUserBean.*;

public class AdminUserMgr {
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public AdminUserMgr() {
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

  public Vector getAdminUser(String email, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();
			String mySQL = "select a_id from admin_user where a_email = ? and a_pwd = ?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				AdminUser au = new AdminUser();
				au.setAID(rs.getInt("a_id"));
				vecList.add(au);
			}
			pstmt.close();
			conn.close();


		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public void finishEnroll() {
		
	}
}
