package cn.ac.big.dp.action;

import java.util.List;

import cn.ac.big.dp.bean.DiagnoseResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.service.IDiagnoseService;
import cn.ac.big.dp.service.IItemService;
import cn.ac.big.dp.service.ISubItemInfoService;
import cn.ac.dp.chart.ChartJson;

import com.opensymphony.xwork2.ActionSupport;

public class ItemAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IItemService itemService;
	private ISubItemInfoService subItemInfoService;
	private IDiagnoseService diagnoseService;
	
	private List<Item> itemList;
	private List<SubItemInfo> subItemList;
	private List<Drug> drugList;
	private DiagnoseResult diagResult;
	
	private String patientId;
	private String visitId;
	private String testNo;
	private ChartJson tips;
	private String examNo;
	private String itemName;
	
	public String findLabItem(){
		itemList = itemService.selectLabItemByIds(patientId, visitId);
		return SUCCESS;
	}
	public String findExamItem(){
		itemList =itemService.selectExamItemByIds(patientId, visitId);
		return SUCCESS;
	}
	public String findSubLabItem(){
		subItemList = subItemInfoService.selectSubLabItemInfoByTestNo(testNo);
		return SUCCESS;
	}
	public String findSubExamItem(){
		subItemList = subItemInfoService.selectSubExamItemInfoByTestNo(examNo);
		return SUCCESS;
	}
	public String findDiagnose(){
		diagResult = diagnoseService.selectDiagnoseResultByParams(patientId, visitId);
		return SUCCESS;
	}
	public String findDrug() {
		drugList = diagnoseService.selectDrugsByParams(patientId, visitId);
		return SUCCESS;
	}
	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}

	public void setItemService(IItemService itemService) {
		this.itemService = itemService;
	}
	public void setSubItemInfoService(ISubItemInfoService subItemInfoService) {
		this.subItemInfoService = subItemInfoService;
	}
	public List<Item> getItemList() {
		return itemList;
	}
	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}
	public List<SubItemInfo> getSubItemList() {
		return subItemList;
	}
	public void setSubItemList(List<SubItemInfo> subItemList) {
		this.subItemList = subItemList;
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

	public String getTestNo() {
		return testNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public List<Drug> getDrugList() {
		return drugList;
	}

	public void setDrugList(List<Drug> drugList) {
		this.drugList = drugList;
	}

	public void setTestNo(String testNo) {
		this.testNo = testNo;
	}
	public String getExamNo() {
		return examNo;
	}
	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}

	public ChartJson getTips() {
		return tips;
	}
	public void setTips(ChartJson tips) {
		this.tips = tips;
	}
	public DiagnoseResult getDiagResult() {
		return diagResult;
	}

	public void setDiagResult(DiagnoseResult diagResult) {
		this.diagResult = diagResult;
	}
}
