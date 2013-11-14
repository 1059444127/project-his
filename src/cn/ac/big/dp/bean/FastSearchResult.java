package cn.ac.big.dp.bean;

import java.util.List;

public class FastSearchResult {
	private String id;
	private String patient_id;
	private String visit_id;
	private List<TestItem> itemResults;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(String patient_id) {
		this.patient_id = patient_id;
	}
	public String getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(String visit_id) {
		this.visit_id = visit_id;
	}
	public List<TestItem> getItemResults() {
		return itemResults;
	}
	public void setItemResults(List<TestItem> itemResults) {
		this.itemResults = itemResults;
	}
	
	
}
