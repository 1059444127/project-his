package cn.ac.big.dp.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.junit.Test;

import cn.ac.big.dp.util.ExcelUtils;


public class MyTest {
	@Test
	public void test01() throws InvalidFormatException, FileNotFoundException, IOException{
		ExcelUtils.readFromExcel("D:/test.xls");
	}
	@Test
	public void test02() throws IOException, NumberFormatException, SQLException {
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream("D:/ids.txt")));
		String line = null;
		String sql = "delete from tb_diagnosisinfo where pkid = ";
		Connection conn = DBManager.getConnection();
		while((line = br.readLine())!=null) {
			sql += Integer.parseInt(line);
			Statement stmt = conn.createStatement();
			stmt.execute(sql);
		}
	}
	public static void main(String[] args) throws Exception {
		getDongmaiZhou("恶性肿瘤", "diagnosis_desc like '%癌%' or diagnosis_desc like '%恶性肿瘤%' or diagnosis_desc like '%肉瘤%'", "恶性肿瘤", "恶性肿瘤");
		getDongmaiZhou2("淋巴瘤", "diagnosis_desc like '%霍奇金氏病%' or diagnosis_desc like '%淋巴瘤%'", "恶性肿瘤", "淋巴瘤");
		getDongmaiZhou2("黑色素瘤", "diagnosis_desc like '%黑色素瘤%' or diagnosis_desc like '%恶性黑瘤%'", "恶性肿瘤", "黑色素瘤");
		getDongmaiZhou2("多发性骨髓瘤", "diagnosis_desc like '%多发性骨髓瘤%'", "恶性肿瘤", "多发性骨髓瘤");
		getDongmaiZhou2("间皮瘤", "diagnosis_desc like '%间皮瘤%'", "恶性肿瘤", "间皮瘤");
		
		getDongmaiZhou("慢性阻塞性肺疾病", "diagnosis_desc like '%慢性阻塞性肺疾病%' or diagnosis_desc like '%COPD%' or diagnosis_desc like '%慢阻肺%'", "呼吸系统疾病", "慢性阻塞性肺疾病");
		getDongmaiZhou("肾功能不全", "diagnosis_desc like '%肾功能不全%' or diagnosis_desc like '%慢性肾脏病%'", "消化系统疾病", "肾功能不全");
		getDongmaiZhou("肝功能不全", "diagnosis_desc like '%肝功能不全%' or diagnosis_desc like '%肝衰竭%' or diagnosis_desc like '%肝损害%' or diagnosis_desc like '%肝功能衰竭%'", "消化系统疾病", "肝功能不全");
		//getDongmaiZhou("guanxinbing" ,"diagnosis_desc like '%冠心病%' or diagnosis_desc like '%冠状动脉粥样硬化性心脏病%' or diagnosis_desc like '%缺血性心脏病%'", "冠心病", "冠心病");
		//getDongmaiZhou("suozhaixingxinbaoyan", "diagnosis_desc like '%缩窄性心包炎%'", "心包疾病", "缩窄性心包炎");
		//getDongmaiZhou("亚急性感染性心内膜炎", "diagnosis_desc like '%亚急性感染性心内膜炎%'", "感染性心内膜炎", "亚急性感染性心内膜炎");
		//getXindongguosu("心动过速", "diagnosis_desc like '%心动过速%'", "心律失常", "心动过速");
		//getDongmaiZhou("窦性心动过缓", "diagnosis_desc like '%窦性心动过缓%'", "心律失常", "窦性心动过缓");
		//getDongmaiZhou("窦性停搏", "diagnosis_desc like '%窦性停搏%'", "心律失常", "窦性停搏");
		//getDongmaiZhou("病态窦房结综合征", "diagnosis_desc like '%病态窦房结综合征%'", "心律失常", "病态窦房结综合征");
		//getDongmaiZhou("预激综合征", "diagnosis_desc like '%预激综合征%'", "心律失常", "预激综合征");
		//getDongmaiZhou("房性期前收缩", "diagnosis_desc like '%房性期前收缩%' or diagnosis_desc like '房早'", "心律失常", "房性期前收缩");
		//getDongmaiZhou("心房扑动", "diagnosis_desc like '%心房扑动%'", "心律失常", "心房扑动");
		//getDongmaiZhou("室性期前收缩", "diagnosis_desc like '%室性期前收缩%' or diagnosis_desc like '室早'", "心律失常", "室性期前收缩");
		//getDongmaiZhou("心室扑动", "diagnosis_desc like '%心室扑动%'", "心律失常", "心室扑动");
		//getDongmaiZhou("心室颤动", "diagnosis_desc like '%心室颤动%' or diagnosis_desc like '室颤'", "心律失常", "心室颤动");
		//getDongmaiZhou("窦房传导阻滞", "diagnosis_desc like '%窦房传导阻滞%'", "心律失常", "窦房传导阻滞");
		//getXindongguosu(new String[]{"初发性","阵发性","持续性","永久性"},"心房颤动", "diagnosis_desc like '%心房颤动%' or diagnosis_desc like '%房颤%'", "心律失常", "心房颤动");
		//getXindongguosu(new String[]{"左","右","双束支","三束支"},"束支传导阻滞", "diagnosis_desc like '%束支传导阻滞%'", "心律失常", "束支传导阻滞");
		//getXindongguosu(new String[]{"左","右","双束支","三束支"},"束支传导阻滞", "diagnosis_desc like '%束支传导阻滞%'", "心律失常", "束支传导阻滞");
		/*
		Map<String,List<String>> keyMap = new HashMap<String,List<String>>();
		List<String> one = new ArrayList<String>();
		one.add("1度");
		one.add("一度");
		one.add("Ⅰ");
		one.add("I");
		one.add("1");
		List<String> two = new ArrayList<String>();
		two.add("2度");
		two.add("二度");
		two.add("Ⅱ");
		two.add("II");
		two.add("2");
		List<String> three = new ArrayList<String>();
		three.add("3度");
		three.add("三度");
		three.add("Ⅲ");
		three.add("III");
		three.add("完全");
		three.add("3");
		
		keyMap.put("一度", one);
		keyMap.put("二度", two);
		keyMap.put("三度", three);
		getXindongguosu(keyMap,"房室传导阻滞", "diagnosis_desc like '%房室传导阻滞%'", "心律失常", "房室传导阻滞");
		*/
		//getDongmaiZhou("扩张性心肌病", "diagnosis_desc like '%扩张型心肌病%' or diagnosis_desc like '%扩张性心肌病%' or diagnosis_desc like '%扩心病%'", "心肌病", "扩张性心肌病");
		//getXindongguosu(new String[]{"梗阻","非梗阻"},"肥厚型心肌病", "diagnosis_desc like '%肥厚型心肌病%' or diagnosis_desc like '%肥厚性心肌病%' or diagnosis_desc like '%肥心病%'", "心肌病", "肥厚型心肌病");
		//getDongmaiZhou("限制型心肌病", "diagnosis_desc like '%限制型心肌病%' or diagnosis_desc like '%限制性心肌病%'", "心肌病", "限制型心肌病");
		//getDongmaiZhou("心肌淀粉样变性", "diagnosis_desc like '%心肌淀粉样变性%'","心肌病","心肌淀粉样变性");
		//getDongmaiZhou("心肌致密化不全", "diagnosis_desc like '%心肌致密化不全%'","心肌病","心肌致密化不全");
		//getDongmaiZhou("酒精性心肌病", "diagnosis_desc like '%酒精性心肌病%'","心肌病","酒精性心肌病");
		//getDongmaiZhou("围生期心肌病", "diagnosis_desc like '%围生期心肌病%'","心肌病","围生期心肌病");
		//getDongmaiZhou("缺血性心肌病", "diagnosis_desc like '%缺血性心肌病%'","心肌病","缺血性心肌病");
		//getDongmaiZhou("高血压性心肌病", "diagnosis_desc like '%高血压性心肌病%'","心肌病","高血压性心肌病");
		//getDongmaiZhou("高血压性心肌病", "diagnosis_desc like '%高血压性心肌病%'","心肌病","高血压性心肌病");
		//getDongmaiZhou("克山病", "diagnosis_desc like '%克山病%' or diagnosis_desc like '%地方性心肌病%'","心肌病","克山病");
		//getDongmaiZhou("病毒性心肌炎", "diagnosis_desc like '%病毒性心肌炎%'","心肌炎","病毒性心肌炎");
		//getDongmaiZhou("心肌炎", "diagnosis_desc like '%心肌炎%'","心肌炎","心肌炎");
		
		/*
		getDongmaiZhou("心血管神经症", "diagnosis_desc like '%心血管神经症%' or diagnosis_desc like '%心脏神经官能症%'","心血管神经症","心血管神经症");
		getDongmaiZhou("肺动脉高压", "diagnosis_desc like '%肺动脉高压%'","肺动脉高压","肺动脉高压");
		getDongmaiZhou("肺心病", "diagnosis_desc like '%肺心病%' or diagnosis_desc like '%肺源性心脏病%'","肺心病","肺心病");
		*/
		
		/*
		getDongmaiZhou("先天性心脏病", "diagnosis_desc ='先天性心脏病' or diagnosis_desc ='先心病' or diagnosis_desc ='先天型心脏病'","先天性心脏病","先天性心脏病");
		getDongmaiZhou2("动脉导管未闭", "diagnosis_desc like '%动脉导管未闭%' or diagnosis_desc like '%PDA%'","先天性心脏病","动脉导管未闭");
		getDongmaiZhou2("二叶主动脉瓣", "diagnosis_desc like '%二叶主动脉瓣%'","先天性心脏病","二叶主动脉瓣");
		getDongmaiZhou2("三尖瓣下移畸形", "diagnosis_desc like '%三尖瓣下移畸形%' or diagnosis_desc like '%埃勃斯坦畸形%'","先天性心脏病","三尖瓣下移畸形");
		getDongmaiZhou2("主动脉窦瘤", "diagnosis_desc like '%主动脉窦瘤%'","先天性心脏病","主动脉窦瘤");
		getDongmaiZhou2("法洛四联症", "diagnosis_desc like '%法洛四联症%'","先天性心脏病","法洛四联症");

		getXindongguosu(new String[]{"原发孔","继发孔"},"房间隔缺损", "diagnosis_desc like '%房间隔缺损%' or diagnosis_desc like '%房缺%'", "先天性心脏病", "房间隔缺损");
		Map<String,List<String>> keyMap = new HashMap<String,List<String>>();
		List<String> one = new ArrayList<String>();
		one.add("肌型");
		one.add("肌部");
		keyMap.put("肌型", one);
		List<String> two = new ArrayList<String>();
		two.add("膜周型");
		two.add("膜周部");
		keyMap.put("膜周型", two);
		List<String> three = new ArrayList<String>();
		three.add("动脉瓣下");
		keyMap.put("动脉瓣下", three);
		getXindongguosu(keyMap,"室间隔缺损", "diagnosis_desc like '%室间隔缺损%' or diagnosis_desc like '%室缺%'", "先天性心脏病", "室间隔缺损");
		*/
		
		/*
		 * 心功能不全
		 */
		/*
		getDongmaiZhou("心功能不全", "diagnosis_desc in('心功能不全','心功能不全？','心功能不全?')","心功能不全","心功能不全");
		Map<String,List<String>> keyMap = new HashMap<String,List<String>>();
		List<String> one = new ArrayList<String>();
		one.add("Ⅰ");
		one.add("1");
		one.add("一");
		one.add("I");
		keyMap.put("Ⅰ级", one);
		List<String> two = new ArrayList<String>();
		two.add("Ⅱ");
		two.add("2");
		two.add("二");
		two.add("II");
		keyMap.put("Ⅱ", two);
		List<String> three = new ArrayList<String>();
		three.add("Ⅲ级");
		three.add("3");
		three.add("三");
		three.add("III");
		keyMap.put("Ⅲ级", three);
		getXindongguosu2(keyMap,"急性心力衰竭", "diagnosis_desc like '%急性心力衰竭%' or diagnosis_desc like '%急性心衰%'", "心功能不全", "急性心力衰竭");
		getXindongguosu2(keyMap,"慢性心力衰竭", "diagnosis_desc like '%慢性心力衰竭%' or diagnosis_desc like '%慢性心衰%'", "心功能不全", "慢性心力衰竭");
		getXindongguosu2(keyMap,"舒张性心力衰竭", "diagnosis_desc like '%舒张性心力衰竭%' or diagnosis_desc like '%舒张型心力衰竭%'", "心功能不全", "舒张性心力衰竭");
		getXindongguosu2(keyMap,"收缩性心力衰竭", "diagnosis_desc like '%收缩性心力衰竭%' or diagnosis_desc like '%收缩性心力衰竭%'", "心功能不全", "收缩性心力衰竭");
		getXindongguosu2(keyMap,"左心衰竭", "diagnosis_desc like '%左心衰竭%' or diagnosis_desc like '%左心衰%'", "心功能不全", "左心衰竭");
		getXindongguosu2(keyMap,"右心衰竭", "diagnosis_desc like '%右心衰竭%' or diagnosis_desc like '%右心衰%'", "心功能不全", "左心衰竭");
		getXindongguosu2(keyMap,"全心衰竭", "diagnosis_desc like '%全心衰竭%' or diagnosis_desc like '%全心衰%'", "心功能不全", "左心衰竭");
		getDongmaiZhou2("舒张功能不全", "diagnosis_desc like '%舒张功能不全%'","心功能不全","舒张功能不全");
		*/
		/*
		 * 低血压
		 */
		//getDongmaiZhou("低血压", "diagnosis_desc like '%低血压%'","低血压病","低血压");
		
		/*
		 * 风心病 
		 */
		//getDongmaiZhou("风心病", "diagnosis_desc = '风心病' or diagnosis_desc = '风湿性心脏病'","风心病","风心病");
		//getXindongguosu2(new String[]{"狭窄","关闭不全","狭窄并关闭不全"},"风心病二尖瓣", "(diagnosis_desc like '%风心病%' or diagnosis_desc like '%风湿性%' or diagnosis_desc like '%风湿性心脏病%') and diagnosis_desc like '%二尖瓣%'", "风心病", "二尖瓣");
		//getXindongguosu2(new String[]{"狭窄","关闭不全","狭窄并关闭不全"},"风心病三尖瓣", "(diagnosis_desc like '%风心病%' or diagnosis_desc like '%风湿性%' or diagnosis_desc like '%风湿性心脏病%') and diagnosis_desc like '%三尖瓣%'", "风心病", "三尖瓣");
		//getXindongguosu2(new String[]{"狭窄","关闭不全","狭窄并关闭不全"},"风心病主动脉瓣", "(diagnosis_desc like '%风心病%' or diagnosis_desc like '%风湿性%' or diagnosis_desc like '%风湿性心脏病%') and diagnosis_desc like '%主动脉瓣%'", "风心病", "主动脉瓣");
		//getDongmaiZhou2("风湿性心肌炎", "diagnosis_desc like '%风湿性心肌炎%'","风心病","风湿性心肌炎");
		//getDongmaiZhou2("风湿性心包炎", "diagnosis_desc like '%风湿性心包炎%'","风心病","风湿性心包炎");
		

		/*
		 * 非风湿性心脏病
		 */
		//getDongmaiZhou("非风湿性心脏病", "(diagnosis_desc like '%二尖瓣%' or diagnosis_desc like '%三尖瓣%' or diagnosis_desc like '%主动脉瓣%' or diagnosis_desc like '%肺动脉瓣%') and diagnosis_desc not like '%风心病%' and diagnosis_desc not like '%风湿性心脏病%' and diagnosis_desc not like '%风湿性%' or diagnosis_desc like '%非风湿性心脏病%'","非风湿性心脏病","非风湿性心脏病");
		
		
	}
	private static void getXindongguosu2(String[] options, String fileName,
			String condition, String subject, String uniqueName) throws IOException {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				for(String option:options) {
					if(d.getDiagnosis_desc().indexOf(option)>0) {
						d.setDiagnosis_value(option);
						break;
					}
					d.setDiagnosis_value("1");
				}
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				sb.append(getStringBuilder(d));
				
				d.setDiagnosis_desc(subject);
				d.setDiagnosis_value("1");
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	private static void getDongmaiZhou2(String fileName, String condition, String subject, String uniqueName) throws Exception {
		
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				d.setDiagnosis_value("1");
				sb.append(getStringBuilder(d));
				
				d.setDiagnosis_desc(subject);
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	public static void getXindongguosu2(Map<String, List<String>> options, String fileName, String condition, String subject, String uniqueName) throws Exception {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				Iterator<String> it = options.keySet().iterator();
				boolean flag = false;
				while(it.hasNext()) {
					String key = it.next();
					List<String> names = options.get(key);
					for(String name:names) {
						if(d.getDiagnosis_desc().indexOf(name)>0) {
							d.setDiagnosis_value(key);
							flag = true;
							break;
						}
					}
					if(flag) {
						break;
					}
				}
				if(!flag) {
					d.setDiagnosis_value("1");
				}
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				sb.append(getStringBuilder(d));
				
				d.setDiagnosis_desc(subject);
				d.setDiagnosis_value("1");
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	
	public static void getXindongguosu(Map<String, List<String>> options, String fileName, String condition, String subject, String uniqueName) throws Exception {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				Iterator<String> it = options.keySet().iterator();
				boolean flag = false;
				while(it.hasNext()) {
					String key = it.next();
					List<String> names = options.get(key);
					for(String name:names) {
						if(d.getDiagnosis_desc().indexOf(name)>0) {
							d.setDiagnosis_value(key);
							flag = true;
							break;
						}
					}
					if(flag) {
						break;
					}
				}
				if(!flag) {
					d.setDiagnosis_value("1");
				}
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	public static void getXindongguosu(String[] options, String fileName, String condition, String subject, String uniqueName) throws Exception {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				for(String option:options) {
					if(d.getDiagnosis_desc().indexOf(option)>0) {
						d.setDiagnosis_value(option);
						break;
					}
					d.setDiagnosis_value("1");
				}
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	public static void getDongmaiZhou(String fileName, String condition, String subject, String uniqueName) throws Exception {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where "+ condition + "GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())){
				existDiag.add(d.getPatient_id()+d.getVisit_id());
				d.setSubject(subject);
				d.setDiagnosis_desc(uniqueName);
				d.setDiagnosis_value("1");
				sb.append(getStringBuilder(d));
			}
		}
		writeToFile(fileName+".txt", sb);
		
	}
	public static void getGaoxueyao() throws Exception {
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo_full where diagnosis_desc like '%高血压%' GROUP BY CONCAT(patient_id,visit_id,diagnosis_desc)", Diagnosis.class);
		String className = null;
		String className1 = null;
		StringBuilder sb = new StringBuilder();
		Set<String> existDiag = new HashSet<String>();
		for(Diagnosis d:diagList) {
			String desc = d.getDiagnosis_desc();
			if(desc.indexOf("继发性高血压")>-1) {
				d.setDiagnosis_desc("继发性高血压");
				className = "";
				className1 = "";
			} else {
				d.setDiagnosis_desc("高血压");
				
				if(desc.indexOf("1级")>-1||desc.indexOf("一级")>-1||desc.indexOf("Ⅰ级")>-1){
					className = "1级";
				} else if(desc.indexOf("2级")>-1||desc.indexOf("二级")>-1||desc.indexOf("Ⅱ级")>-1){
					className = "2级";
				} else if(desc.indexOf("3级")>-1||desc.indexOf("三级")>-1||desc.indexOf("Ⅲ级")>-1) {
					className = "3级";
				} else {
					className = "";
				}
				
				if(desc.indexOf("低危")>-1||desc.indexOf("低危组")>-1) {
					className1 = "低危";
				} else if(desc.indexOf("中危")>-1||desc.indexOf("中危组")>-1) {
					className1 = "中危";
				} else if(desc.indexOf("极高危")>-1||desc.indexOf("极高危组")>-1) {
					className1 = "极高危";
				} else if(desc.indexOf("高危")>-1||desc.indexOf("高危组")>-1) {
					className1 = "高危";
				} else  {
					className1 = "";
				}
			}
			d.setDiagnosis_value("1");
			System.out.println(d.getPkid()+":"+d.getDiagnosis_desc()+":"+className+":"+className1);
			if(!existDiag.contains(d.getPatient_id()+d.getVisit_id())) {
				sb.append(getStringBuilder(d).toString());
			}
			if(!"".equals(className)) {
				d.setDiagnosis_desc("高血压分级");
				d.setDiagnosis_value(className);
				sb.append(getStringBuilder(d).toString());
			}
			if(!"".equals(className1)) {
				d.setDiagnosis_desc("高血压危险分层");
				d.setDiagnosis_value(className1);
				sb.append(getStringBuilder(d).toString());
			}
			existDiag.add(d.getPatient_id()+d.getVisit_id());
		}
		writeToFile("gaoxueya.txt",sb);
		System.out.println("finished");
	}
	private static void writeToFile(String string, StringBuilder sb) throws IOException {
		BufferedWriter br = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D:/diagnosis/"+string)));
		br.append(sb.toString());
		br.close();
	}
	private static StringBuilder getStringBuilder(Diagnosis diag) throws IOException {
		StringBuilder sb =  new StringBuilder();
		sb.append(diag.getId());
		sb.append("\t");
		sb.append(diag.getPatient_id());
		sb.append("\t");
		sb.append(diag.getVisit_id());
		sb.append("\t");
		sb.append(diag.getDiagnosis_type());
		sb.append("\t");
		sb.append(diag.getDiagnosis_no());
		sb.append("\t");
		sb.append(diag.getDiagnosis_desc());
		sb.append("\t");
		sb.append(diag.getDiagnosis_date());
		sb.append("\t");
		sb.append(diag.getTreat_days());
		sb.append("\t");
		sb.append(diag.getTreat_result());
		sb.append("\t");
		sb.append(diag.getCode_version());
		sb.append("\t");
		sb.append(diag.getDiagnosis_value());
		sb.append("\t");
		sb.append(diag.getSubject());
		sb.append("\t");
		sb.append("\r\n");
		
		return sb;
	}
	public static void getDiagnose() throws IOException {
		BufferedWriter br = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D:/tb_diagnosisinfo_full")));
		Connection conn = DBManager.getConnection();
		List<Diagnosis> diagList = new ArrayList<Diagnosis>();
		diagList = DBUtils.getAllObjectList(conn, "select * from tb_diagnosisinfo", Diagnosis.class);
		System.out.println("finished");
		StringBuilder sb = null;
		int index = 1;
		for(Diagnosis diag:diagList) {
			String diagDesc = diag.getDiagnosis_desc().replaceAll("\\d[。.、;:；：,，；\\s]|[、;:；：,，；]", " ").trim();
			String[] diagDescs = diagDesc.split("(?<!\\（.{1,100})\\s");
			for(String dd: diagDescs) {
				if(!"".equals(dd.trim())) {
					sb = new StringBuilder();
					sb.append(index++);
					sb.append("\t");
					sb.append(diag.getId());
					sb.append("\t");
					sb.append(diag.getPatient_id());
					sb.append("\t");
					sb.append(diag.getVisit_id());
					sb.append("\t");
					sb.append(diag.getDiagnosis_type());
					sb.append("\t");
					sb.append(diag.getDiagnosis_no());
					sb.append("\t");
					sb.append(dd);
					sb.append("\t");
					sb.append(diag.getDiagnosis_date());
					sb.append("\t");
					sb.append(diag.getTreat_days());
					sb.append("\t");
					sb.append(diag.getTreat_result());
					sb.append("\t");
					sb.append(diag.getCode_version());
					br.append(sb.toString());
					br.append("\r\n");
				}
				System.out.println(index);
			}
		}
		br.close();
	}
}
