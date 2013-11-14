package cn.ac.big.dp.action;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.service.IDiagnoseService;
import cn.ac.big.dp.service.IItemService;
import cn.ac.big.dp.service.ISubItemInfoService;
import cn.ac.big.dp.test.DiagMap;
import cn.ac.big.dp.util.ChartKV;
import cn.ac.big.dp.util.Page;
import cn.ac.dp.chart.ChartJson;
import cn.ac.dp.chart.ChartUtils;

import com.opensymphony.xwork2.ActionSupport;

public class ChartAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private ChartJson tips;
	private List<String> diagNames;
	private String diagName;
	private DiagItemDTO diagItem;
	private List<DiagCountDTO> diagCount;
	List<DiagItemDTO> diagItemList;
	Map<String, List<DiagCountDTO>> dividedCategoryList;
	private Page page;
	private String patientId;
	private String visitId;
	private String itemName;
	private String xRay;
	private String category;
	private int hasDiag;
	
	private IDiagnoseService diagnoseService;
	private ISubItemInfoService subItemInfoService;
	private IItemService itemService;
	
	/*
	 * 自定义Chart显示
	 */
	public String findMyChart() {
		dividedCategoryList = diagnoseService.selectMyDiagNameCount(diagNames, category);
		List<String> patientDiags = null;
		if(patientId!=null && !patientId.trim().equals("")) {
			patientDiags = diagnoseService.selectPatientDiagByPVId(patientId, visitId);
		}
		tips = ChartUtils.produceStack2DChart(diagNames, dividedCategoryList, patientDiags, patientId);
		return SUCCESS;
	}
	
	public String findDiagCountChart() {
		diagCount = diagnoseService.selectDiagCountByCondition(DiagMap.getValue(diagName), category);
		Object result = null;
		if(patientId!=null && !patientId.trim().equals("")) {
			result = diagnoseService.selectPropertyByParam("patient_id", patientId, category);
		}
		tips = ChartUtils.producePyramidChart(diagCount, category, DiagMap.getValue(diagName), result, patientId, hasDiag);
		return SUCCESS;
	}
	
	public String findSameItemChart(){
		List<ChartKV> chartValueList = subItemInfoService.selectSameItemValue(patientId, visitId, itemName);
		String[] references = itemService.selectReferenceValue(itemName);
		tips = ChartUtils.produceHeightLineChart(chartValueList, references);
		return SUCCESS;
	}
	public String findDiagChart() {
		System.out.println(Arrays.toString(diagNames.toArray()));
		Map<String,DiagCountDTO> result = diagnoseService.selectAllDiagNameCount(diagNames);
		tips = ChartUtils.produceColumnChart(diagNames, result);
		return SUCCESS;
	}
	public String findDetailDiagChart() {
		Map<String,DiagCountDTO> result = diagnoseService.selectSubDiagNameCount(DiagMap.getValue(diagName));
		tips = ChartUtils.productPieChart(DiagMap.getValue(diagName), result);
		return SUCCESS;
	}
	@SuppressWarnings("unchecked")
	public String findDiagItemPager() {
		String requestPath = "http://"
				+ ServletActionContext.getRequest().getServerName() + ":"
				+ ServletActionContext.getRequest().getServerPort()
				+ ServletActionContext.getRequest().getContextPath()
				+ ServletActionContext.getRequest().getServletPath();
		diagItem.setDiagnosis_desc(DiagMap.getValue(diagItem.getDiagnosis_desc()));
		diagItem.setDiagnosis_value(DiagMap.getValue(diagItem.getDiagnosis_value()));
		Map<String, Object> resultMap = this.diagnoseService.selectDiagItemPager(diagItem);
		page = (Page) resultMap.get("page");
		if(diagItem==null) {
			page.setLinkHref(requestPath+"?1=1");
		} else{
			String patient_id = diagItem.getPatient_id()==null?"":diagItem.getPatient_id();
			String visit_id = diagItem.getVisit_id()==null?"":diagItem.getVisit_id();
			String name = diagItem.getName()==null?"":diagItem.getName();
			String diagnosis_desc = diagItem.getDiagnosis_desc()==null?"":diagItem.getDiagnosis_desc();
			String diagnosis_value = diagItem.getDiagnosis_value()==null?"":diagItem.getDiagnosis_value();
			String xy = diagItem.getXy()==null?"":diagItem.getXy();
			String yj = diagItem.getYj()==null?"":diagItem.getYj();
			page.setLinkHref(requestPath+
					"?diagItem.patient_id="+ patient_id +"&" +
					"diagItem.visit_id="+ visit_id +"&" +
					"diagItem.name="+ name +"&" +
					"diagItem.diagnosis_desc="+ diagnosis_desc +"&" +
					"diagItem.diagnosis_value="+ diagnosis_value +"&" +
					"diagItem.xy="+ xy +"&" +
					"diagItem.yj="+ yj);
			System.out.println(page.getLinkHref());
		}
		System.out.println(page);
		diagItemList = (List<DiagItemDTO>) resultMap.get("diagItemList");
		return SUCCESS;
	}
	public ChartJson getTips() {
		return tips;
	}
	public void setTips(ChartJson tips) {
		this.tips = tips;
	}
	public List<String> getDiagNames() {
		return diagNames;
	}
	public void setDiagNames(List<String> diagNames) {
		this.diagNames = diagNames;
	}
	public String getDiagName() {
		return diagName;
	}
	public void setDiagName(String diagName) {
		this.diagName = diagName;
	}
	public void setDiagnoseService(IDiagnoseService diagnoseService) {
		this.diagnoseService = diagnoseService;
	}
	public DiagItemDTO getDiagItem() {
		return diagItem;
	}
	public void setDiagItem(DiagItemDTO diagItem) {
		this.diagItem = diagItem;
	}
	public List<DiagItemDTO> getDiagItemList() {
		return diagItemList;
	}
	public void setDiagItemList(List<DiagItemDTO> diagItemList) {
		this.diagItemList = diagItemList;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
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
	public void setItemService(IItemService itemService) {
		this.itemService = itemService;
	}
	public String getxRay() {
		return xRay;
	}
	public void setxRay(String xRay) {
		this.xRay = xRay;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public Map<String, List<DiagCountDTO>> getDividedCategoryList() {
		return dividedCategoryList;
	}

	public void setDividedCategoryList(
			Map<String, List<DiagCountDTO>> dividedCategoryList) {
		this.dividedCategoryList = dividedCategoryList;
	}

	public List<DiagCountDTO> getDiagCount() {
		return diagCount;
	}

	public void setDiagCount(List<DiagCountDTO> diagCount) {
		this.diagCount = diagCount;
	}

	public int getHasDiag() {
		return hasDiag;
	}

	public void setHasDiag(int hasDiag) {
		this.hasDiag = hasDiag;
	}

}
