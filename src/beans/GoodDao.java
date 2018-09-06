package beans;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class GoodDao extends MybatisDao{

	public GoodDao() throws IOException {
		super();
	}
	
	public int addLog(Map map) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("goodlog.addDataUsingMap", map);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Map> getAllDatas() {
		SqlSession sql =factory.openSession();	// JDBC ÀÇ Connect°úÁ¤
		try {
			List<Map> p = sql.selectList("goodlog.getSomeDataByActor");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

}
