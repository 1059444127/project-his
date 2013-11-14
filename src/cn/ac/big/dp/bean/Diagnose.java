package cn.ac.big.dp.bean;

public class Diagnose {
	
	private String id;
	private String patientName;
	private String sex;
	private String age;
	private String operResult;
	private String operConclusion;
	private String operDate;
	private String patientId;
	private String visitId;
	private String smoke;
	private String alcohol;
	private String curIllness;
	private String hisIllness;
	private String perHis;
	private String familyHis;
	private String specialItem;
	private String leaveDia;
	private String leaveTips;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(String alcohol) {
		this.alcohol = alcohol;
	}
	public String getCurIllness() {
		return curIllness;
	}
	public void setCurIllness(String curIllness) {
		this.curIllness = curIllness;
	}
	public String getHisIllness() {
		return hisIllness;
	}
	public void setHisIllness(String hisIllness) {
		this.hisIllness = hisIllness;
	}
	public String getPerHis() {
		return perHis;
	}
	public void setPerHis(String perHis) {
		this.perHis = perHis;
	}
	public String getFamilyHis() {
		return familyHis;
	}
	public void setFamilyHis(String familyHis) {
		this.familyHis = familyHis;
	}
	public String getSpecialItem() {
		return specialItem;
	}
	public void setSpecialItem(String specialItem) {
		this.specialItem = specialItem;
	}
	public String getLeaveDia() {
		return leaveDia;
	}
	public void setLeaveDia(String leaveDia) {
		this.leaveDia = leaveDia;
	}
	public String getLeaveTips() {
		return leaveTips;
	}
	public void setLeaveTips(String leaveTips) {
		this.leaveTips = leaveTips;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getOperResult() {
		return operResult;
	}
	public void setOperResult(String operResult) {
		this.operResult = operResult;
	}
	public String getOperConclusion() {
		return operConclusion;
	}
	public void setOperConclusion(String operConclusion) {
		this.operConclusion = operConclusion;
	}
	public String getOperDate() {
		return operDate;
	}
	public void setOperDate(String operDate) {
		this.operDate = operDate;
	}
	@Override
	public String toString() {
		return "Diagnose [id=" + id + ", patientName=" + patientName + ", sex="
				+ sex + ", age=" + age + ", operResult=" + operResult
				+ ", operConclusion=" + operConclusion + ", operDate="
				+ operDate + ", patientId=" + patientId + ", visitId="
				+ visitId + ", smoke=" + smoke + ", alcohol=" + alcohol
				+ ", curIllness=" + curIllness + ", hisIllness=" + hisIllness
				+ ", perHis=" + perHis + ", familyHis=" + familyHis
				+ ", specialItem=" + specialItem + ", leaveDia=" + leaveDia
				+ ", leaveTips=" + leaveTips + "]";
	}
	
}	
