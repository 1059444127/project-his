package cn.ac.big.dp.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;

import cn.ac.big.dp.util.ExcelUtils;


public class Test 
{
	public static void main(String args[]) throws InvalidFormatException, IllegalAccessException, InvocationTargetException, InstantiationException, IOException, SQLException
	{
		System.out.println("ok");
	}
	public static void test01() {
		Pattern p = Pattern.compile("([\u4e00-\u9fa5]+)(\\d{2})mm");
		Matcher m = p.matcher("升主动脉内径37mm 左房前后径35mm 主肺动脉内径mm 左室舒张末期内径48mm 左室收缩末内径32mm 缩短分数（FS）33% 舒张末期容量111ml 收缩末期容量42ml 室间隔厚度10mm 左室后壁厚度10mm 射血分数（EF）62% 右房内径35mm 右室内径36mm 心包检查未见异常 升主动脉增宽，心脏各房、室大小正常，室间隔与左室后壁厚度正常，运动协调，静息状态下未见明显室壁运动异常，左室整体收缩功能正常。大血管内径正常。房、室间隔延续完整。 主动脉瓣可见点状钙化，呈退行性改变，前向血流速度略快，流速2.2m/s，压差20mmHg。余瓣膜形态结构未见异常。 彩色多普勒显示：三尖瓣中度反流，流速2.8m/s，压差32mmHg；主动脉瓣、肺动脉瓣及二尖瓣轻度反流。 二尖瓣血流频谱： E峰流速81cm/s，A峰流速96cm/s，E/A<1");
		boolean b = m.find();
		if(b) {
			System.out.println(m.group(1));
		}
	}
	public static void test02() throws InvalidFormatException, IllegalAccessException, InvocationTargetException, InstantiationException, IOException {
		FileInputStream fis = new FileInputStream("D:/template.xls");
		ExcelUtils.readProperties(fis);
	}
	
	public static void test03() throws SQLException {
		Connection conn = DBManager.getConnection();
		Statement stmt = conn.createStatement();
		Statement stmt0 = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		List<String> resultMap = new ArrayList<String>();
		String sql = "select patient_id , visit_id from tb_exammasterinfo";
		ResultSet rs = stmt.executeQuery(sql);
		int count = 0;
		while(rs.next()) {
			String patientId = rs.getString(1);
			String visitId = rs.getString(2);
			if(visitId==null||visitId.trim().equals("")) {
				continue;
			}
			resultMap.add(patientId+"_"+visitId);
			if(count++==10000){
				break;
			}
		}
		sql = "select exam_no from examresultinfo_detail";
		ResultSet rs0 = stmt0.executeQuery(sql);
		Random random = new Random();
		while(rs0.next()) {
			String examNo = rs0.getString(1);
			String full = resultMap.get(random.nextInt(10000));
			String patientId = full.substring(0,full.indexOf("_"));
			String visitId = full.substring(full.indexOf("_")+1);
			sql = "update examresultinfo_detail set patient_id='"+patientId+"', visit_id='"+visitId+"' where exam_no = '"+examNo+"'";
			System.out.println(sql);
			stmt1.execute(sql);
		}
	}
	private static String getStringValue(Cell cell) {
		
		String value = "";
		try {
			value = cell.getStringCellValue();
		} catch (Exception e) {
			
			try {
				value = Double.toString(cell.getNumericCellValue());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return value;
	}
	
	
}
