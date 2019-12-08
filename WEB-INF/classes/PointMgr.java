package pointBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import pointBean.Point;

public class PointMgr {
  private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public PointMgr() {
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

  public Vector getPointHistories(String s_id) {
    Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String mySQL = "";
		Vector vecList = new Vector();

    try {
      conn = pool.getConnection();
      mySQL = "select p_amount, p_type, to_char(p_created_at) created_at from point_history where s_id=? order by p_created_at desc";
      pstmt = conn.prepareStatement(mySQL);
      pstmt.setString(1, s_id);
      rs = pstmt.executeQuery();

      while(rs.next()) {
        Point pt = new Point();
        pt.setPAmount(rs.getInt("p_amount"));
        pt.setPType(rs.getString("p_type"));
        pt.setPCreatedAt(rs.getString("created_at"));
        vecList.add(pt);
      }

      pstmt.close();
      conn.close();
    } catch(SQLException ex) {
      System.err.println("SQLException: " + ex.getMessage());
    }
    return vecList;
  }
}
