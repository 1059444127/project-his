package cn.ac.big.dp.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.bean.TestItem;
import cn.ac.big.dp.bean.Visit;
import cn.ac.big.dp.service.IDiagnoseService;
import cn.ac.big.dp.service.IPatientService;
import cn.ac.big.dp.util.Page;

import com.opensymphony.xwork2.ActionSupport;

public class PatientAction extends ActionSupport{

	/**
	 * 
	 */
	private String patientId;
	private static final long serialVersionUID = 1L;
	private IPatientService patientService;
	private IDiagnoseService diagnoseService;
	private Patient patient;
	private DiagItemDTO diagItem;
	private int pageNo;
	private int rowCount;
	private int pageSize;
	private Page page;
	private List<Item> item = new ArrayList<Item>();
	private List<Item> iteme = new ArrayList<Item>();
	private List<DResult> diag = new ArrayList<DResult>();
	private List<Drug> drug = new ArrayList<Drug>();
	private List<Patient> patList = new ArrayList<Patient>();
	private List<Visit> visitList = new ArrayList<Visit>();
	List<DiagItemDTO> diagItemList = new ArrayList<DiagItemDTO>();
	private int isFirstSerachFlag;
	private String id;
	
	private Visit visit;
	private int checkType;
	private String visitId;
	
	@SuppressWarnings("unchecked")
	public String findPatientPager() {
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		Map<String, Object> resultMap = this.patientService.selectPatientPager(patient);
		page = (Page) resultMap.get("page");
		if(patient==null) {
			page.setLinkHref(requestPath+"?1=1");
		} else{
			page.setLinkHref(requestPath+"?patient.patientName="+patient.getPatientName()+"&" +
					"patient.sex="+patient.getSex()+"&" +
					"patient.patientId="+patient.getPatientId());
		}
		System.out.println(page);
		patList = (List<Patient>) resultMap.get("patList");
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String findDiagItemPager() {
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		Map<String, Object> resultMap = this.diagnoseService.selectDiagItemPager(diagItem);
		page = (Page) resultMap.get("page");
		if(diagItem==null) {
			page.setLinkHref(requestPath+"?1=1");
		} else{
			page.setLinkHref(requestPath+"?diagItem.patient_id="+diagItem.getPatient_id()+"&" +
					"diagItem.visit_id="+diagItem.getVisit_id()+"&" +
					"diagItem.name="+diagItem.getName() +"&" +
					"diagItem.diagnosis_desc="+diagItem.getDiagnosis_desc()+"&" +
					"diagItem.diagnosis_value="+ diagItem.getDiagnosis_value() +"&" +
					"diagItem.xy="+ diagItem.getXy() +"&" +
					"diagItem.yj="+ diagItem.getYj());
		}
		System.out.println(page);
		diagItemList = (List<DiagItemDTO>) resultMap.get("diagItemList");
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String findVisitPager() {
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		Map<String, Object> resultMap = this.patientService.selectVisitPager(visit);
		page = (Page) resultMap.get("page");
		if(visit==null) {
			page.setLinkHref(requestPath+"?1=1");
		} else{
			page.setLinkHref(requestPath+"?visit.patientName="+visit.getPatientName()+"&" +
					"visit.patientId="+visit.getPatientId()+"&" +
					"visit.visitId="+visit.getVisitId() +"&" +
					"visit.deptDischargeFrom="+visit.getDeptDischargeFrom());
		}
		System.out.println(page);
		visitList = (List<Visit>) resultMap.get("visitList");
		return SUCCESS;
	}
	
	public void checkTestNo() throws IOException {
		ServletActionContext.getResponse().getWriter().print(true);
	}
	
	public void checkExamNo() throws Exception {
		ServletActionContext.getResponse().getWriter().print(true);
	}
	
	public String findPatient(){
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		patient = patientService.selectPatientByPatientId(patientId);
		
		if (isFirstSerachFlag == 1) {
			page = new Page(patient.getVisitList().size());
		} else {
			page = new Page(rowCount, pageNo, pageSize);
		}
		page.setLinkHref(requestPath+"?patientId="+patientId);
		List<Visit> visitList = patient.getVisitList();
		patient.setVisitList(visitList.subList(page.getRowFrom(), page.getRowTo()+1));
		return SUCCESS;
	}
	
	/**
	 * 保存Excel表格中的病例
	 * @return
	 * @throws ParseException 
	 */
	@SuppressWarnings("unchecked")
	public String addPatientInfoExcel() throws ParseException {
		Map<String, Object> excelTedMap = new HashMap<String, Object>();
		List<Item> labItem = null;
		List<Item> examItem = null;
		List<DResult> diagItem = null;
		List<Drug> drugItem = null;
		
		//解析检验
		excelTedMap = (Map<String, Object>) ServletActionContext.getRequest().getSession().getAttribute("lab");
		labItem = excelTedMap==null?new ArrayList<Item>():makeUpItemList(excelTedMap);
		
		//解析检查
		excelTedMap = (Map<String, Object>) ServletActionContext.getRequest().getSession().getAttribute("exam");
		examItem = excelTedMap==null?new ArrayList<Item>():makeUpItemList(excelTedMap);
		
		//解析诊断
		excelTedMap = (Map<String, Object>) ServletActionContext.getRequest().getSession().getAttribute("diag");
		diagItem = excelTedMap==null?new ArrayList<DResult>():makeUpDiagList(excelTedMap);
		
		//解析带药
		excelTedMap = (Map<String, Object>) ServletActionContext.getRequest().getSession().getAttribute("drug");
		drugItem = excelTedMap==null?new ArrayList<Drug>():makeUpDrugList(excelTedMap);
		
		patientService.savePatientInfo(patient, visit, labItem, examItem, diagItem, drugItem);
		return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	private List<Drug> makeUpDrugList(Map<String, Object> excelTedMap) {
		List<Drug> items = new ArrayList<Drug>();
		Drug drug = null;
		List<TestItem> subItem = new ArrayList<TestItem>();
		
		for(String key : excelTedMap.keySet()) {
			subItem = (List<TestItem>) excelTedMap.get(key);
			for(TestItem ti : subItem) {
				drug = new Drug();
				drug.setDRUG_NAME(ti.getItem());
				drug.setDOSAGE(ti.getResult());
				items.add(drug);
			}
		}
		return items;
	}
	@SuppressWarnings("unchecked")
	private List<DResult> makeUpDiagList(Map<String, Object> excelTedMap) {
		
		List<DResult> items = new ArrayList<DResult>();
		DResult diag = null;
		List<TestItem> subItem = new ArrayList<TestItem>();
		
		for(String key : excelTedMap.keySet()) {
			subItem = (List<TestItem>) excelTedMap.get(key);
			for(TestItem ti : subItem) {
				diag = new DResult();
				diag.setSubject(key.substring(0, key.indexOf("[")));
				diag.setDiagnosis_date(resolveStringTimeFromSubject(key));
				diag.setDiagnosis_desc(ti.getItem());
				diag.setSubject(ti.getSubject());
				diag.setDiagnosis_value(ti.getResult());
				items.add(diag);
			}
		}
		return items;
	}
	
	private String resolveStringTimeFromSubject(String key) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String timeStr = null;
		try {
			timeStr = key.substring(key.indexOf("[")+1, key.indexOf("]"));
		} catch (Exception e) {
			e.printStackTrace();
			timeStr = sdf.format(new Date());
		} 
		return timeStr;
	}
	@SuppressWarnings("unchecked")
	private List<Item> makeUpItemList(Map<String, Object> excelTedMap) throws ParseException {
		
		List<Item> items = new ArrayList<Item>();
		Item item = null;
		List<TestItem> subItem = null;
		SubItemInfo sii = null;
		List<SubItemInfo> subItemInfo = null;

		for(String key : excelTedMap.keySet()) {
			subItem = (List<TestItem>) excelTedMap.get(key);
			subItemInfo = new ArrayList<SubItemInfo>();
			item = new Item();
			
			item.setExecuteTime(resolveDateTimeFromSubject(key));
			item.setSubject(key.substring(0, key.indexOf("[")));
			
			for(TestItem ti : subItem) {
				sii = new SubItemInfo();
				sii.setSubject(item.getSubject());
				sii.setResult(ti.getResult());
				sii.setReportItemName(ti.getItem());
				subItemInfo.add(sii);
			}
			item.setSubItemList(subItemInfo);
			items.add(item);
		}
		return items;
	}
	
	private Date resolveDateTimeFromSubject(String key) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = null;
		try {
			String timeStr = key.substring(key.indexOf("[")+1, key.indexOf("]"));
			time = sdf.parse(timeStr);
		} catch (ParseException e) {
			e.printStackTrace();
			time = new Date();
		} 
		return time;
	}
	/**
	 * 保存病例
	 * @param patientService
	 */
	
	public String addPatientInfo() {
		this.patientService.savePatientInfo(patient, visit, item, iteme, diag, drug);
		return SUCCESS;
	}
	
	public String addPatientBasicInfo() {
		this.patientService.savePatientBasicInfo(patient);
		return SUCCESS;
	}
	
	public String addPatientVisitInfo() {
		this.patientService.savePatientVisitInfo(patient, visit);
		return SUCCESS;
	}
	
	public String addPatientTEDInfo() {
		this.patientService.savePatientTED(patient, visit, item, iteme, diag, drug);
		return SUCCESS;
	}
	
	/**
	 * 删除病人所有信息
	 * @return
	 */
	public String deletePatientAllInfo() {
		this.patientService.deletePatient(patientId, visitId);
		return SUCCESS;
	}
	
	public String deleteDiagInfo() {
		this.patientService.deleteDiagnose(id);
		return SUCCESS;
	}
	

	public void setPatientService(IPatientService patientService) {
		this.patientService = patientService;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getIsFirstSerachFlag() {
		return isFirstSerachFlag;
	}

	public void setIsFirstSerachFlag(int isFirstSerachFlag) {
		this.isFirstSerachFlag = isFirstSerachFlag;
	}

	public Visit getVisit() {
		return visit;
	}

	public void setVisit(Visit visit) {
		this.visit = visit;
	}

	public List<Item> getItem() {
		return item;
	}

	public void setItem(List<Item> item) {
		this.item = item;
	}

	public List<Item> getIteme() {
		return iteme;
	}

	public void setIteme(List<Item> iteme) {
		this.iteme = iteme;
	}

	public List<DResult> getDiag() {
		return diag;
	}

	public void setDiag(List<DResult> diag) {
		this.diag = diag;
	}

	public int getCheckType() {
		return checkType;
	}

	public void setCheckType(int checkType) {
		this.checkType = checkType;
	}

	public List<Patient> getPatList() {
		return patList;
	}

	public void setPatList(List<Patient> patList) {
		this.patList = patList;
	}
	public List<Visit> getVisitList() {
		return visitList;
	}
	public void setVisitList(List<Visit> visitList) {
		this.visitList = visitList;
	}
	public List<DiagItemDTO> getDiagItemList() {
		return diagItemList;
	}
	public void setDiagItemList(List<DiagItemDTO> diagItemList) {
		this.diagItemList = diagItemList;
	}
	public DiagItemDTO getDiagItem() {
		return diagItem;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setDiagItem(DiagItemDTO diagItem) {
		this.diagItem = diagItem;
	}
	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}
	public List<Drug> getDrug() {
		return drug;
	}
	public void setDrug(List<Drug> drug) {
		this.drug = drug;
	}
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
}
