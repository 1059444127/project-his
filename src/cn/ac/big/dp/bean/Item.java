package cn.ac.big.dp.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Item {
	
	@Override
	public String toString() {
		return "LabItem [id="+ id +", testNo=" + testNo + ", subject=" + subject
				+ ", subItemList=" + subItemList + "]";
	}
	private String id;
	private String testNo;
	private String subject;
	private String specimen;
	private String examSubClass;
	private Date executeTime;
	private String patientId;
	private String visitId;
	private List<SubItemInfo> subItemList = new ArrayList<SubItemInfo>();
	
	public String getTestNo() {
		return testNo;
	}
	public void setTestNo(String testNo) {
		this.testNo = testNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public List<SubItemInfo> getSubItemList() {
		return subItemList;
	}
	public void setSubItemList(List<SubItemInfo> subItemList) {
		this.subItemList = subItemList;
	}
	public String getExamSubClass() {
		return examSubClass;
	}
	public void setExamSubClass(String examSubClass) {
		this.examSubClass = examSubClass;
	}
	public Date getExecuteTime() {
		return executeTime;
	}
	public void setExecuteTime(Date executeTime) {
		this.executeTime = executeTime;
	}
	public String getSpecimen() {
		return specimen;
	}
	public void setSpecimen(String specimen) {
		this.specimen = specimen;
	}
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
}
