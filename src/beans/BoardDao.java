package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class BoardDao extends Dao{
	
	public int addBoard(String no, String writer, String title, Date leftdate, String content, String good, String attach ) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into message(no, writer, title, leftdate, content, good, attach) values(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, no);
			ps.setString(2, writer);
			ps.setString(3, title);
			ps.setDate(4, leftdate);
			ps.setString(5, content);
			ps.setString(6, good);
			ps.setString(7, attach);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	

	public List<Map> getBoard(String writer) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from message where writer=? order by senddate desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, writer);
			ResultSet rs = ps.executeQuery();
			List<Map> ret;
			if (rs.next()) {
				ret = new ArrayList<>();
				do {
					Map one = new LinkedHashMap<>();
					one.put("no", rs.getString("no"));
					one.put("writer", rs.getString("writer"));
					one.put("title", rs.getString("title"));
					one.put("leftdate", rs.getDate("leftdate"));
					one.put("content", rs.getString("content"));
					one.put("good", rs.getString("good"));
					one.put("attach", rs.getString("attach"));
					ret.add(one);
				} while (rs.next());
			} else {
				ret = null;
			}
			conn.close();
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}