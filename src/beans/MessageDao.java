package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Map;

public class MessageDao extends Dao{
	public int addMessage (String code, String sender, String reciver, String content, Date createdate, Date receivedate) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into account values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, sender);
			ps.setString(3, reciver);
			ps.setString(4, content);
			ps.setDate(5, createdate);
			ps.setDate(6, receivedate);
			int n = ps.executeUpdate(); // send → receive 작업을 함.
			conn.close();
			return n;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map> getMessage(String id){
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from message where code";
			String sqll = "select * from message where id";
			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement pss = conn.prepareStatement(sqll);
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
}

