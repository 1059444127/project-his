package cn.ac.big.dp.action;


import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.service.IDiagnoseService;
import cn.ac.big.dp.service.ISubItemInfoService;
import cn.ac.big.dp.service.ITestService;
import cn.ac.big.dp.service.impl.DictService;
import cn.ac.big.dp.service.impl.DrugService;
import cn.ac.big.dp.util.ChartKV;
import cn.ac.big.dp.util.CommonUtils;
import cn.ac.big.dp.util.ExcelUtils;

import com.opensymphony.xwork2.ActionSupport;

public class ExportFileAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ISubItemInfoService subItemInfoService;
	private IDiagnoseService diagnoseService;
	private ITestService testService;
	
	private String[] fieldNames;
	private String fileName;
	private ExcelUtils excelUtils;
	private int exportType;
	private String[] testNos;
	private String patientId;
	private String visitId;
	private String itemName;
	private Integer[] itemIds;
	private DictService dictService;
	private DrugService drugService;
	private int drugFlag;
	private int excelType;
	
	@SuppressWarnings("unchecked")
	public InputStream getInputStream()
	{
		Workbook wb = null;
		ByteArrayInputStream  bais = null;
		excelUtils.initMap(exportType);
		List<PatientVisit> patVisitList = null;
		
		if(exportType==0){
			patVisitList = (List<PatientVisit>) ServletActionContext.getRequest().getSession().getAttribute("patVisit");
			List<SearchResult> testResultList = testService.searchTestResultByCondition(patVisitList);
			try {
				wb = excelUtils.createWorkbookByFixedList(testResultList, fieldNames);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(exportType==2 || exportType==1) {
			String[] paramName = null;
			Map<String, List<?>> resultMap = new HashMap<String,List<?>>();
			
			if(exportType==1){
				paramName = new String[]{"reportItemName","result","units","low","high","resultDateTime"};
				for(String testNo : testNos){
					resultMap.put(testNo, subItemInfoService.selectSubLabItemInfoByTestNo(testNo));
				}
			}
			else{
				paramName = new String[]{"examItem","description","impression","examParameter","resultDateTime"};
				for(String examNo : testNos){
					resultMap.put(examNo, subItemInfoService.selectSubExamItemInfoByTestNo(examNo));
				}
			}
			try {
				wb = excelUtils.createWorkbookByBeanList(resultMap, paramName, SubItemInfo.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(exportType==3) {
			String[] paramName = new String[]{"value","date"};
			List<ChartKV> resultList = subItemInfoService.selectSameItemValue(patientId, visitId, itemName);
			try {
				wb = excelUtils.createWorkbookByBeanList(resultList, paramName, ChartKV.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(exportType==4) {
			String[] paramName = new String[]{"patientName","sex","age","operResult","operConclusion","operDate","patientId","visitId","smoke","alcohol","curIllness","hisIllness","perHis","familyHis","specialItem","leaveDia","leaveTips"};
			List<Diagnose> diagList = diagnoseService.selectDiagByParams(patientId, visitId);
			try {
				wb = excelUtils.createWorkbookByBeanList(diagList, paramName, Diagnose.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				System.out.println(drugFlag);
				if(drugFlag==0) {
					wb = this.exportTedTemplate();
				} else {
					wb = this.exportDrugTemplate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ByteArrayOutputStream bos = null;
		try {
			bos = new ByteArrayOutputStream();
			wb.write(bos);
			bais = new ByteArrayInputStream(bos.toByteArray());
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return bais;
	}
	
	public Workbook exportDrugTemplate() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{
		List<Drug> drugList = drugService.getDrugsIn(Arrays.asList(itemIds));
		//写入Excel模板
		Workbook wb = ExcelUtils.createDurgTemplate(CommonUtils.getBeanPropertyAsList(drugList, Drug.class, "DRUG_NAME"));
		return wb;
	}
	public Workbook exportTedTemplate() throws IOException {
		Dict dict = null;
		Map<String, List<String>> dictNameMap = new HashMap<String, List<String>>();
		List<String> dictList = null;
		List<SQLCondition> sqlList = null;
		SQLCondition sqlCondition = null;
		
		//循环大项，取得小项名称
		for(int id : itemIds) {
			sqlList = new ArrayList<SQLCondition>();
			sqlCondition = new SQLCondition("dict_id", id);
			sqlList.add(sqlCondition);
			dict = dictService.getDictByParams(sqlList).get(0);
			dictList = dictService.getDictNameByParentDictId(id);
			dictNameMap.put(dict.getDictName(), dictList);
		}
		//写入Excel模板
		Workbook wb = ExcelUtils.createTedTemplate(dictNameMap, excelType);
		return wb;
	}
	
	public String exportToExcel() throws Exception{
		fileName = Long.toString(new Date().getTime())+".xls";
		return SUCCESS;
	}

	public String[] getFieldNames() {
		return fieldNames;
	}

	public void setFieldNames(String[] fieldNames) {
		this.fieldNames = fieldNames;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public ExcelUtils getExcelUtils() {
		return excelUtils;
	}
	public void setExcelUtils(ExcelUtils excelUtils) {
		this.excelUtils = excelUtils;
	}
	public int getExportType() {
		return exportType;
	}
	public void setExportType(int exportType) {
		this.exportType = exportType;
	}
	public String[] getTestNos() {
		return testNos;
	}
	public void setTestNos(String[] testNos) {
		this.testNos = testNos;
	}
	public void setSubItemInfoService(ISubItemInfoService subItemInfoService) {
		this.subItemInfoService = subItemInfoService;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}
	public Integer[] getItemIds() {
		return itemIds;
	}

	public void setItemIds(Integer[] itemIds) {
		this.itemIds = itemIds;
	}

	public int getDrugFlag() {
		return drugFlag;
	}

	public void setDrugFlag(int drugFlag) {
		this.drugFlag = drugFlag;
	}

	public int getExcelType() {
		return excelType;
	}

	public void setExcelType(int excelType) {
		this.excelType = excelType;
	}

	public void setDrugService(DrugService drugService) {
		this.drugService = drugService;
	}
	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}

	public void setTestService(ITestService testService) {
		this.testService = testService;
	}
}
