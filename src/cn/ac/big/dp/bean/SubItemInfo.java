package cn.ac.big.dp.bean;

public class SubItemInfo {
	
	private String id;
	private String reportItemName;
	private String result;
	private String units;
	private String resultDateTime;
	private String examNo;
	private String subject;
	private String examItem;
	private String description;
	private String impression;
	private String low;
	private String high;
	private String examParameter;
	
	public String getReportItemName() {
		return reportItemName;
	}
	public void setReportItemName(String reportItemName) {
		this.reportItemName = reportItemName;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return id+":"+result+":"+ examNo +":"+reportItemName;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public String getResultDateTime() {
		return resultDateTime;
	}
	public void setResultDateTime(String resultDateTime) {
		this.resultDateTime = resultDateTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExamNo() {
		return examNo;
	}
	public void setExamNo(String examNo) {
		this.examNo = examNo;
	}
	public String getExamItem() {
		return examItem;
	}
	public void setExamItem(String examItem) {
		this.examItem = examItem;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImpression() {
		return impression;
	}
	public void setImpression(String impression) {
		this.impression = impression;
	}
	public String getExamParameter() {
		return examParameter;
	}
	public void setExamParameter(String examParameter) {
		this.examParameter = examParameter;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
