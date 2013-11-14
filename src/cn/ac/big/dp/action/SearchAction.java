package cn.ac.big.dp.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.GroupCondition;
import cn.ac.big.dp.bean.OrderCondition;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SearchForm;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.Visit;
import cn.ac.big.dp.service.IConditionService;
import cn.ac.big.dp.service.IDictService;
import cn.ac.big.dp.service.IDrugService;
import cn.ac.big.dp.service.IPatientService;
import cn.ac.big.dp.service.ITestService;
import cn.ac.big.dp.util.CommonUtils;
import cn.ac.big.dp.util.Page;

import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IDictService dictService;
	private ITestService testSearchService;
	private IPatientService patientService;
	private IDrugService drugService;
	private List<Dict> dictList;
	private List<SearchResult> testResultList;
	private SearchForm searchForm;
	private String saveName;
	private int dictId;
	private Dict dict;
	private IConditionService conditionService;
	private List<OrderCondition> condList;
	private int condId;
	private Condition condition;
	private int saveFlag;
	private String groupId;
	private List<String> curConditionDis;
	private List<PatientVisit> patVisitList;
	private List<Visit> visitList;
	private List<Drug> drugList;
	private String testType;
	private String keyWord;
	private String keyfill;
	
	private int pageNo;
	private int rowCount;
	private int pageSize;
	private Page page;
	private int isFirstSerachFlag;
	private int simpleSearch;
	private List<String> patList;
	private Patient patient;
	private String patientId;
	
	public String queryDictInfo() {
		dictList = dictService.getAllDict("1");
		return SUCCESS;
	}
	public String queryAllDrug() {
		drugList = drugService.getAllDrugs();
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String queryPatientName() {
		patList = (List<String>) ServletActionContext.getRequest().getSession().getAttribute("ajaxPatList");
		if(patList==null) {
			patList = this.patientService.selectAllPatientName();
			ServletActionContext.getRequest().getSession().setAttribute("ajaxPatList", patList);
		}
		List<String> filterResult = new ArrayList<String>();
		for(String name:patList) {
			if(name!=null&&!"".equals(name.trim())) {
				if(name.contains(keyWord)) {
					filterResult.add(name);
				}
			}
		}
		patList = filterResult;
		return SUCCESS;
	}
	public String querySubDictInfo() {
		dictList = dictService.selectAllSubDict(testType);
		List<Dict> resultList = new ArrayList<Dict>();
		if(keyfill!=null && "1".equals(keyfill)) {
			for(int i=0;i<dictList.size();i++) {
				String text = dictList.get(i).getDictName();
				if(text.contains(keyWord)) {
					resultList.add(dictList.get(i));
				}
			}
			dictList = resultList;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryAllDictInfo() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();

		if (isFirstSerachFlag == 1) {
			dictList = dictService.getAllDict(null);
			session.setAttribute("dictList", dictList);
			page = new Page(dictList.size());
		} else {
			dictList = (List<Dict>) session.getAttribute("dictList");
			page = new Page(rowCount, pageNo, pageSize);
		}
		page.setLinkHref(requestPath+"?1=1");
		dictList = dictList.subList(page.getRowFrom(), page.getRowTo()+1);
		return SUCCESS;
	}

	public String queryDictByPdId() {
		dictList = dictService.getDictByParam("dict_parent_id", dictId);
		return SUCCESS;
	}
	
	public String queryPatient() {
		patient = patientService.selectPatientByPatientId(patientId);
		return SUCCESS;
	}
	
	public String queryVisit() {
		visitList = patientService.selectVisitByPatientId(patientId);
		return SUCCESS;
	}

	public String updateDict() {
		dictService.updateDict(dict);
		dictList = dictService.getAllDict(null);
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryTestInfo() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		
		dictList = dictService.selectSubDictByParam("display_flag", 1);
		for(Dict d: dictList) {
			System.out.println(d);
		}
		List<Condition> condList = null;
		
		if (isFirstSerachFlag == 1) {
			if (saveFlag == 1) {
				condList = conditionService.insertCondition(searchForm, saveName);
			} else {
				condList = CommonUtils.revertFormToList(searchForm);
			}
			curConditionDis = CommonUtils.reverseToStringCond1(condList);
			patVisitList = testSearchService.searchPatientVisit(condList, simpleSearch);
			session.setAttribute("patVisit", patVisitList);
			session.setAttribute("curConditionDis", curConditionDis);
			session.setAttribute("condList", condList);
			page = new Page(patVisitList.size(),30);
			
		} else {
			patVisitList = (List<PatientVisit>) session.getAttribute("patVisit");
			condList  = (List<Condition>) session.getAttribute("condList");
			page = new Page(rowCount, pageNo, pageSize);
			
		}
		System.out.println(page);
		patVisitList = patVisitList.subList(page.getRowFrom(), page.getRowTo()+1);
		page.setLinkHref(requestPath);
		testResultList = testSearchService.searchTestResultByCondition(patVisitList, condList, simpleSearch);
		session.setAttribute("testResultList", testResultList);
		return SUCCESS;
	}

	public String deleteCondition() {
		conditionService.deleteCondition(groupId);
		return "del_success";
	}

	public String selectAllConds() {
		List<GroupCondition> groupList = conditionService.selectAllCondition();
		condList = CommonUtils.reverseToStringCond(groupList);
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String queryTestInfoFC() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		List<Condition> condList = null;
		dictList = dictService.selectSubDictByParam("display_flag", 1);
		
		if (isFirstSerachFlag == 1) {
			condList = conditionService.selectCondByGroupId(groupId);
			curConditionDis = CommonUtils.reverseToStringCond1(condList);
			patVisitList = testSearchService.searchPatientVisit(condList, simpleSearch);
			session.setAttribute("patVisit", patVisitList);
			session.setAttribute("curConditionDis", curConditionDis);
			session.setAttribute("condList", condList);
			page = new Page(patVisitList.size(),30);
			
		}  else {
			patVisitList = (List<PatientVisit>) session.getAttribute("patVisit");
			condList  = (List<Condition>) session.getAttribute("condList");
			page = new Page(rowCount, pageNo, pageSize);
		}
		patVisitList = patVisitList.subList(page.getRowFrom(), page.getRowTo()+1);
		page.setLinkHref(requestPath);
		testResultList = testSearchService.searchTestResultByCondition(patVisitList, condList, simpleSearch);
		session.setAttribute("testResultList", testResultList);
		return SUCCESS;
	}

	public void setDictService(IDictService dictSerivce) {
		this.dictService = dictSerivce;
	}

	public List<Dict> getDictList() {
		return dictList;
	}

	public int getIsFirstSerachFlag() {
		return isFirstSerachFlag;
	}

	public void setIsFirstSerachFlag(int isFirstSerachFlag) {
		this.isFirstSerachFlag = isFirstSerachFlag;
	}

	public void setDictList(List<Dict> dictList) {
		this.dictList = dictList;
	}

	public int getDictId() {
		return dictId;
	}

	public void setDictId(int dictId) {
		this.dictId = dictId;
	}

	public SearchForm getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(SearchForm searchForm) {
		this.searchForm = searchForm;
	}

	public void setTestSearchService(ITestService testSearchService) {
		this.testSearchService = testSearchService;
	}

	public List<SearchResult> getTestResultList() {
		return testResultList;
	}

	public void setTestResultList(List<SearchResult> testResultList) {
		this.testResultList = testResultList;
	}

	public Dict getDict() {
		return dict;
	}

	public void setDict(Dict dict) {
		this.dict = dict;
	}

	public List<OrderCondition> getCondList() {
		return condList;
	}

	public void setCondList(List<OrderCondition> condList) {
		this.condList = condList;
	}

	public int getCondId() {
		return condId;
	}

	public void setCondId(int condId) {
		this.condId = condId;
	}

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public void setConditionService(IConditionService conditionService) {
		this.conditionService = conditionService;
	}

	public int getSaveFlag() {
		return saveFlag;
	}

	public void setSaveFlag(int saveFlag) {
		this.saveFlag = saveFlag;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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

	public List<String> getCurConditionDis() {
		return curConditionDis;
	}

	public void setCurConditionDis(List<String> curConditionDis) {
		this.curConditionDis = curConditionDis;
	}

	public List<PatientVisit> getPatVisitList() {
		return patVisitList;
	}

	public void setPatVisitList(List<PatientVisit> patVisitList) {
		this.patVisitList = patVisitList;
	}

	public int getSimpleSearch() {
		return simpleSearch;
	}

	public void setSimpleSearch(int simpleSearch) {
		this.simpleSearch = simpleSearch;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getKeyfill() {
		return keyfill;
	}

	public List<String> getPatList() {
		return patList;
	}

	public void setPatList(List<String> patList) {
		this.patList = patList;
	}

	public void setKeyfill(String keyfill) {
		this.keyfill = keyfill;
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
	public List<Visit> getVisitList() {
		return visitList;
	}
	public void setVisitList(List<Visit> visitList) {
		this.visitList = visitList;
	}
	public List<Drug> getDrugList() {
		return drugList;
	}
	public void setDrugList(List<Drug> drugList) {
		this.drugList = drugList;
	}public void setDrugService(IDrugService drugService) {
		this.drugService = drugService;
	}
}
