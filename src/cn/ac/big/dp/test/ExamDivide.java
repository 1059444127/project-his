package cn.ac.big.dp.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;


public class ExamDivide {
	
	@Test
	public void test01() throws SQLException {
		Connection conn = DBManager.getConnection();
		String sql = "select exam_no,exam_item, description from tb_examresultinfo where exam_item = '超声心动图检查'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		PreparedStatement pstmt = null;
		Set<String> keyMap = new HashSet<String>();
		int count = 0;
		while(rs.next()) {
			String examNo = rs.getString(1);
			String examItem = rs.getString(2);
			String description = rs.getString(3);
			if(description==null||"".equals(description.trim())){
				continue;
			}
			Pattern p = Pattern.compile("([\u4e00-\u9fa5]+)(\\d{2})(\\w{1,2})");
			Matcher m = p.matcher(description);
			while(m.find()) {
				String key = m.group(1);
				if(key!=null&&!key.trim().equals("")&&(key.indexOf("左")!=-1||key.indexOf("右")!=-1)){
				String value = m.group(2);
				keyMap.add(key);
				/*System.out.println(key+":"+value);
				sql = "insert into tb_examresultinfo(id,exam_no,exam_item, impression) values (?,?,?,?)";
				pstmt = conn.prepareCall(sql);
				pstmt.setString(1, UUID.create());
				pstmt.setString(2, examNo);
				pstmt.setString(3, key);
				pstmt.setString(4, value);
				pstmt.execute();
				*/}
			}
			count++;
		}
		System.out.println(count);
		for(String key:keyMap) {
			
			stmt.execute("insert into tb_dict(p_dict_name, dict_name, display_flag,type,unit,exam_lab_flag,dict_parent_id,level, status, item) values ('超声','"+key+"',1,4,'','检查',5753,'1',0,'超声"+key+"')");
		}
	}
	
}
