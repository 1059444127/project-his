package cn.ac.big.dp.test;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DiagMap {
	public static Map<String, String> diagMap;
	static {
		Connection conn = DBManager.getConnection();
		List<String> descs = DBUtils.getOneColumnList(conn, "select DISTINCT(diagnosis_desc) as descd from tb_diagnosisinfo", "descd");
		
		diagMap = new HashMap<String, String>();
		diagMap.put("1", "高血压病");
		diagMap.put("2", "风心病");
		diagMap.put("3", "非风湿性心脏瓣膜病");
		diagMap.put("4", "心肌病");
		diagMap.put("5", "心肌炎");
		diagMap.put("6", "先天性心脏病");
		diagMap.put("7", "心功能不全");
		diagMap.put("8", "冠心病");
		diagMap.put("9", "消化系统疾病");
		diagMap.put("10", "呼吸系统疾病");
		diagMap.put("11", "恶性肿瘤");
		diagMap.put("12", "心包疾病");
		diagMap.put("13", "心律失常");
		int i = 14;
		for(String desc : descs) {
			diagMap.put(Integer.toString(i++), desc);
		}
		descs = DBUtils.getOneColumnList(conn, "select DISTINCT(diagnosis_value) as descd from tb_diagnosisinfo", "descd");
		for(String desc : descs) {
			diagMap.put(Integer.toString(i++), desc);
		}
	}
	public static String getValue(String key) {
		return diagMap.get(key);
	}
	public static String getKey(String value) {
		String v = null;
		for(String key : diagMap.keySet()) {
			v = diagMap.get(key);
			if(v!=null && v.equals(value)) {
				return key;
			}
		}
		return null;
	}
}
