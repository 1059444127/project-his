package cn.ac.big.dp.util;

import java.beans.PropertyDescriptor;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.TestItem;
import cn.ac.big.dp.bean.Visit;
import cn.ac.big.dp.test.DBManager;
import cn.ac.big.dp.test.DBUtils;
import cn.ac.big.dp.test.UUID;


public class ExcelUtils{
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public Map<String, String> fieldEnToChMap = new HashMap<String, String>();

	private ExcelUtils() {
	}
	
	/**
	 * 根据字段列表导出带药模板
	 * @param beanPropertyAsList
	 * @return
	 */
	public static Workbook createDurgTemplate(List<String> beanPropertyAsList) {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("检索结果");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		int cellNum = 0;
		
		row = sheet.createRow(rowNum++);
		cell = row.createCell(cellNum);
		cell.setCellValue("带药");
		
		row = sheet.createRow(rowNum++);
		cell = row.createCell(cellNum);
		cell.setCellValue("药品清单");
		
		row = sheet.createRow(rowNum);
		
		for(String ele : beanPropertyAsList) {
			cell = row.createCell(cellNum++);
			cell.setCellValue(ele);
		}
		return wb;
	}
	/***
	 * 根据界面选择的检查、检验、诊断、带药大小项导出特定模板
	 * @param allKeyWords
	 * @param excelType 
	 * @return
	 */
	public static Workbook createTedTemplate(Map<String, List<String>> allKeyWords, int excelType) {
		Iterator<Map.Entry<String, List<String>>> it = allKeyWords.entrySet().iterator();
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("检索结果");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		int cellNum = 0;
		
		row = sheet.createRow(rowNum);
		cell = row.createCell(cellNum);
		switch(excelType){
		case 0:cell.setCellValue("检查");break;
		case 1:cell.setCellValue("检验");break;
		case 2:cell.setCellValue("诊断");break;
		}
		
		while(it.hasNext()) {
			cellNum = 0;
			row = sheet.createRow(++rowNum);
			Map.Entry<String, List<String>> entry = it.next();
			String key = entry.getKey();
			cell = row.createCell(cellNum);
			cell.setCellValue(key+"[时间]");
			
			row = sheet.createRow(++rowNum);
			
			List<String> values = entry.getValue();
			for(String o : values) {
				cell = row.createCell(cellNum++);
				cell.setCellValue(o);
			}
			
			rowNum++;
		}
		
		return wb;
	}

	public void initMap(int type) {
		if (type == 0) {
			List<Dict> dictList = new ArrayList<Dict>();
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("paramName", "level");
			paramMap.put("paramValue", 1);
			dictList = getSqlSessionTemplate().selectList("selectDictByParam",paramMap);
			for (Dict dict : dictList) {
				fieldEnToChMap.put(dict.getDictNameEn(), dict.getDictName());
			}
		} else if (type == 1) {
			fieldEnToChMap.put("reportItemName", "项目名称");
			fieldEnToChMap.put("result", "结果");
			fieldEnToChMap.put("units", "单位");
			fieldEnToChMap.put("low", "低");
			fieldEnToChMap.put("high", "高");
			fieldEnToChMap.put("resultDateTime", "报告时间");
		} else if (type == 2) {
			fieldEnToChMap.put("examItem", "项目名称");
			fieldEnToChMap.put("description", "结果");
			fieldEnToChMap.put("impression", "印象");
			fieldEnToChMap.put("examParameter", "检查参数");
			fieldEnToChMap.put("resultDateTime", "报告时间");
		} else if (type == 3) {
			fieldEnToChMap.put("value", "值");
			fieldEnToChMap.put("date", "日期");
		} else if (type == 4) {
			fieldEnToChMap.put("patientName", "姓名");
			fieldEnToChMap.put("sex", "性别");
			fieldEnToChMap.put("age", "年龄");
			fieldEnToChMap.put("operResult", "手术结果");
			fieldEnToChMap.put("operConclusion", "结论");
			fieldEnToChMap.put("operDate", "手术日期");
			fieldEnToChMap.put("patientId", "病人ID");
			fieldEnToChMap.put("visitId", "入院院次");
			fieldEnToChMap.put("smoke", "吸烟史");
			fieldEnToChMap.put("alcohol", "饮酒史");
			fieldEnToChMap.put("curIllness", "现病史");
			fieldEnToChMap.put("hisIllness", "既往史");
			fieldEnToChMap.put("perHis", "个人史");
			fieldEnToChMap.put("familyHis", "家族史");
			fieldEnToChMap.put("specialItem", "特殊项");
			fieldEnToChMap.put("leaveDia", "出院诊断");
			fieldEnToChMap.put("leaveTips", "出院医嘱");
		}
	}
	
	public static void readFromExcel(String path) throws InvalidFormatException, FileNotFoundException, IOException {
		Workbook wb = WorkbookFactory.create(new FileInputStream(path));
		Sheet sheet = wb.getSheetAt(0);
		int rowCount = sheet.getLastRowNum();
		String preSubject = "";
		String testNo = "";
		for(int x=1;x<rowCount;x++) {
			Row row = sheet.getRow(x);
			String patientId = "D118855";
			String visitId = "1";
			Cell cell = row.getCell(4);
			if(cell==null) {
				continue;
			}
			String subject = cell.getStringCellValue();
			cell = row.getCell(10);
			String executeDate = getFitStringValue(cell);
			Connection conn = DBManager.getConnection();
			
			if(!preSubject.equals(subject)){
				preSubject = subject;
				String mainId = UUID.create();
				String mainSubjec = subject;
				testNo = UUID.create();
				String[] strs = new String[]{mainId, patientId,visitId,testNo,mainSubjec, executeDate};
				System.out.println(Arrays.toString(strs));
				DBUtils.insertObject(conn, "insert into tb_labmasterinfo(id,patient_id, visit_id, test_no, subject, execute_date) values(?,?,?,?,?,?)", strs);
			}
			cell = row.getCell(6);
			String reportItemName = getFitStringValue(cell);
			cell = row.getCell(7);
			String result = getDoubleFitStringValue(cell);
			cell = row.getCell(8);
			String units = getFitStringValue(cell);
			
			String[] strs1 = new String[]{UUID.create(), testNo, reportItemName, result, units, executeDate};
			System.out.println(Arrays.toString(strs1));
			DBUtils.insertObject(conn, "insert into tb_labresultinfo(id, test_no, report_item_name, result, units, result_date_time) values(?,?,?,?,?,?)", strs1);
		}
	}
	
	public static String getFitStringValue(Cell cell) {
		String value = "";
		try {
			value = cell.getStringCellValue();
		} catch (Exception e) {
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				value = sdf.format(cell.getDateCellValue());
			} catch (Exception e1) {
				try {
					value = Double.toString(cell.getNumericCellValue());
				} catch (Exception e2) {
					value = "";
				}
			}
		}
		return value;
	}
	public static String getDoubleFitStringValue(Cell cell) {
		String value = "";
		try {
			value = cell.getStringCellValue();
		} catch (Exception e) {
				try {
					value = Double.toString(cell.getNumericCellValue());
				} catch (Exception e2) {
					value = "";
				}
		}
		return value;
	}
	
	public static Map<String, Object> readProperties(FileInputStream fis) throws InvalidFormatException, IOException, IllegalAccessException, InvocationTargetException, InstantiationException {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Workbook wb = WorkbookFactory.create(fis);
		Sheet sheet = wb.getSheetAt(0);
		int rowCount = sheet.getLastRowNum();
		int basicInfoLine = -1;
		int hospitalInfoLine = -1;
		int examInfoLine = -1;
		int labInfoLine = -1;
		int diagInfoLine = -1;
		int drugInfoLine = -1;
		
		for(int row=0;row<rowCount;row++) {
			int cellCount = sheet.getRow(row).getLastCellNum();
			for(int col=0;col<cellCount;col++) {
				Cell topic = sheet.getRow(row).getCell(col);
				String theme = getStringCellValue(topic);
				if(theme!=null&&"基本信息".equals(theme)) {
					basicInfoLine = row;
					break;
				} else if(theme!=null&&"住院信息".equals(theme)){
					hospitalInfoLine = row;
					break;
				} else if(theme!=null && "检查".equals(theme)) {
					examInfoLine = row;
					resultMap.put("tedFlag", "检查");
					break;
				} else if(theme!=null && "检验".equals(theme)) {
					labInfoLine = row;
					resultMap.put("tedFlag", "检验");
					break;
				} else if(theme!=null && "诊断".equals(theme)) {
					resultMap.put("tedFlag", "诊断");
					diagInfoLine = row;
					break;
				} else if(theme!=null && "带药".equals(theme)) {
					resultMap.put("tedFlag", "带药");
					drugInfoLine = row;
					break;
				}
			}
		}
		
		InputStream is = ExcelUtils.class.getResourceAsStream("/basic.properties");
		Properties props = new Properties();
		props.load(is);
		
		if(basicInfoLine!=-1) {
			Patient p = (Patient) fillValueToBean(sheet, Patient.class ,basicInfoLine, props);
			resultMap.put("patient", p);
		}
		if(hospitalInfoLine!=-1) {
			Visit v = (Visit) fillValueToBean(sheet, Visit.class, hospitalInfoLine, props);
			resultMap.put("visit", v);
		}
		if(examInfoLine!=-1) {
			resultMap.put("exam", fillValueToBeanMapList(sheet, examInfoLine));
		}
		if(labInfoLine!=-1) {
			resultMap.put("lab", fillValueToBeanMapList(sheet, labInfoLine));
		}
		if(diagInfoLine!=-1) {
			resultMap.put("diag", fillValueToBeanMapList(sheet, diagInfoLine));
		}
		if(drugInfoLine!=-1) {
			resultMap.put("drug", fillValueToBeanMapList(sheet, drugInfoLine));
		}
		return resultMap;
	}
	
	private static Map<String, List<TestItem>> fillValueToBeanMapList(Sheet sheet, int infoLine) {
		Map<String, List<TestItem>> mapList = new HashMap<String, List<TestItem>>();
		
		Row keyRow = null;
		Row valueRow = null;
		Row subjectRow = null;
		
		Cell subjectCell = null;
		Cell keyCell = null;
		Cell valueCell = null;
		int rowNum = infoLine + 1;
		int rowCount = sheet.getLastRowNum();
		int cellCount = 0;
		TestItem ti = null;
		List<TestItem> testItems = null;
		
		for(;rowNum<=rowCount;) {
			//大项名称
			testItems = new ArrayList<TestItem>();
			subjectRow = sheet.getRow(rowNum++);
			subjectCell = subjectRow.getCell(0);
			
			//获取小项key-value
			keyRow = sheet.getRow(rowNum++);
			valueRow = sheet.getRow(rowNum++);
			
			cellCount = keyRow.getLastCellNum();
			
			for(int i=0; i<cellCount; i++) {
				ti = new TestItem();
				keyCell = keyRow.getCell(i);
				valueCell = valueRow.getCell(i);
				
				ti.setItem(getStringCellValue(keyCell));
				ti.setResult(getStringCellValue(valueCell));
				
				if("".equals(ti.getResult().trim())){
					continue;
				}
				testItems.add(ti);
			}
			if(testItems!=null && testItems.size()>0) {
				mapList.put(subjectCell.getStringCellValue(), testItems);
			}
		}
		return mapList;
	}
	
	/**
	 * 将Excel表格中的数据导出成javaBean
	 * 
	 * @param sheet
	 * @param clazz
	 * @param infoLine 标题行号
	 * @param props	中文\属性名称映射
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws InstantiationException
	 */
	private static Object fillValueToBean(Sheet sheet, Class<?> clazz, int infoLine, Properties props) throws IllegalAccessException, InvocationTargetException, InstantiationException {
		
		Row row = sheet.getRow(infoLine+1);
		Map<Integer, String> keyMap = new HashMap<Integer, String>();
		for(int x=0;x<row.getLastCellNum();x++) {
			Cell cell = row.getCell(x);
			String keyCn = getStringCellValue(cell);
			String keyEn = props.getProperty(keyCn);
			keyMap.put(x, keyEn);
		}
		Iterator<Integer> it =  keyMap.keySet().iterator();
		row = sheet.getRow(infoLine+2);
		Object obj = null;
		if(row!=null&&keyMap.keySet()!=null&&keyMap.keySet().size()>0) {
			obj = clazz.newInstance();
			while(it.hasNext()){
				int position = it.next();
				String key = keyMap.get(position);
				String value = getStringCellValue(row.getCell(position));
				System.out.println(key+":"+value);
				BeanUtils.setProperty(obj, key, value);
			}
		}
		return obj;
	}
	private static String getStringCellValue(Cell cell) {
		if(cell==null) return "";
		switch(cell.getCellType()){
			case Cell.CELL_TYPE_NUMERIC:return Double.toString(cell.getNumericCellValue());
			case Cell.CELL_TYPE_STRING:return cell.getStringCellValue();
			case Cell.CELL_TYPE_BLANK:return "";
			default:return "";
		}
	}
	public <T> Workbook createWorkbookByBeanList(List<T> beanList, String[] fieldNames, Class<T> clazz) throws Exception {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("检索结果");
		Row row = null;
		Cell cell = null;

		/**
		 * 写字段信息
		 */
		row = sheet.createRow(0);
		for (int x = 0; x < fieldNames.length; x++) {
			cell = row.createCell(x);
			String fieldNameEn = fieldNames[x];
			String fieldNameCh = fieldEnToChMap.get(fieldNameEn);
			cell = row.createCell(x);
			cell.setCellType(Cell.CELL_TYPE_STRING);
			cell.setCellValue(fieldNameCh);
		}
		/**
		 * 写数据信息
		 */
		for (int i = 1; i <= beanList.size(); i++) {
			Object o = beanList.get(i - 1);
			row = sheet.createRow(i);
			for (int j = 0; j < fieldNames.length; j++) {
				String fieldName = fieldNames[j];
				cell = row.createCell(j);
				PropertyDescriptor pd = new PropertyDescriptor(fieldName, clazz);
				Method method = pd.getReadMethod();
				Object value = method.invoke(o, new Object[] {});
				converCellType(cell, method.getReturnType(), value);
			}
		}

		return wb;
	}

	public Workbook createWorkbookByBeanList(Map<String, List<?>> listMap,
			String[] fieldNames, Class<?> clazz) throws Exception {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = null;
		Row row = null;
		Cell cell = null;

		/**
		 * 写数据信息
		 */
		for (String key : listMap.keySet()) {
			sheet = wb.createSheet(key);
			List<?> list = listMap.get(key);
			/**
			 * 写字段信息
			 */
			row = sheet.createRow(0);
			for (int x = 0; x < fieldNames.length; x++) {
				cell = row.createCell(x);
				String fieldNameEn = fieldNames[x];
				String fieldNameCh = fieldEnToChMap.get(fieldNameEn);
				cell = row.createCell(x);
				cell.setCellType(Cell.CELL_TYPE_STRING);
				cell.setCellValue(fieldNameCh);
			}
			for (int i = 1; i <= list.size(); i++) {
				Object o = list.get(i - 1);
				row = sheet.createRow(i);
				for (int j = 0; j < fieldNames.length; j++) {
					String fieldName = fieldNames[j];
					cell = row.createCell(j);
					PropertyDescriptor pd = new PropertyDescriptor(fieldName,
							clazz);
					Method method = pd.getReadMethod();
					Object value = method.invoke(o, new Object[] {});
					converCellType(cell, method.getReturnType(), value);
				}
			}
		}
		return wb;
	}

	public Workbook createWorkbookByFixedList(List<SearchResult> testResultList, String[] fieldNames) {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = null;
		Row row = null;
		Cell cell = null;
		int cellNum = 8;
		int rowNum = 1;
		/**
		 * 写字段信息
		 */
		sheet = wb.createSheet();
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue("姓名");
		cell = row.createCell(1);
		cell.setCellValue("病人ID");
		cell = row.createCell(2);
		cell.setCellValue("病次ID");
		cell = row.createCell(3);
		cell.setCellValue("性别");
		cell = row.createCell(4);
		cell.setCellValue("年龄");
		cell = row.createCell(5);
		cell.setCellValue("吸烟史");
		cell = row.createCell(6);
		cell.setCellValue("饮酒史");
		
		for (String fieldName : fieldNames) {
			if (fieldName != null && !"".equals(fieldName.trim())) {
				cell = row.createCell(cellNum++);
				cell.setCellValue(fieldName);
			}
		}
		/**
		 * 写数值信息
		 */
		for (SearchResult sr : testResultList) {
			cellNum = 8;
			row = sheet.createRow(rowNum++);
			String patName = sr.getPatientName();
			cell = row.createCell(0);
			cell.setCellValue(patName);
			String patId = sr.getPatientId();
			cell = row.createCell(1);
			cell.setCellValue(patId);
			String visitId = sr.getVisitId();
			cell = row.createCell(2);
			cell.setCellValue(visitId);
			String sex = sr.getSex();
			cell = row.createCell(3);
			cell.setCellValue(sex);
			String age = sr.getAge();
			cell = row.createCell(4);
			cell.setCellValue(age);
			String smokeHis = sr.getSmokeHis();
			cell = row.createCell(5);
			cell.setCellValue(smokeHis);
			String alcoholHis = sr.getAlcoholHis();
			cell = row.createCell(6);
			cell.setCellValue(alcoholHis);
			
			Map<String, String> resultMap = sr.getResultMap();
			String result = null;
			CellStyle cellStyle = wb.createCellStyle();

			for (String key : fieldNames) {
				result = resultMap.get(key);
				cellStyle.setWrapText(true);
				cell = row.createCell(cellNum++);
				cell.setCellStyle(cellStyle);
				converCellType(cell, result);
			}
		}
		return wb;
	}
	
	private void converCellType(Cell cell, Object value) {
		if(value==null) {
			cell.setCellType(Cell.CELL_TYPE_STRING);
			cell.setCellValue("");
		} else{
			try {
				Double result = Double.parseDouble(value.toString());
				cell.setCellType(Cell.CELL_TYPE_NUMERIC);
				cell.setCellValue(result);
			} catch (NumberFormatException e) {
				cell.setCellType(Cell.CELL_TYPE_STRING);
				cell.setCellValue(value.toString());
			}
		}
	}

	private void converCellType(Cell cell, Class<?> clazz, Object value) {
		if (value != null) {
			if (clazz.isAssignableFrom(Integer.class)) {
				cell.setCellType(Cell.CELL_TYPE_NUMERIC);
				int intVal = Integer.parseInt(value.toString());
				cell.setCellValue(intVal);
			} else if (clazz.isAssignableFrom(Double.class)) {
				cell.setCellType(Cell.CELL_TYPE_NUMERIC);
				double doubleVal = Double.parseDouble(value.toString());
				cell.setCellValue(doubleVal);
			} else {
				try {
					Double result = Double.parseDouble(value.toString());
					cell.setCellType(Cell.CELL_TYPE_NUMERIC);
					cell.setCellValue(result);
				} catch (NumberFormatException e) {
					cell.setCellType(Cell.CELL_TYPE_STRING);
					cell.setCellValue(value.toString());
				}
			}
		} else {
			cell.setCellType(Cell.CELL_TYPE_STRING);
			String stringVal = "";
			cell.setCellValue(stringVal);
		}
	}

}
