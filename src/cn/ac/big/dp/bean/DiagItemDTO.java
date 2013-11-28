package cn.ac.big.dp.bean;

public class DiagItemDTO {
	
	private String id;
	private String patient_id;
	private String visit_id;
	private String name;
	private String diagnosis_desc;
	private String diagnosis_value;
	private String diagnosis_date;
	private String diagnosis_no;
	private String treat_days;
	private String treat_result;
	private String xy;
	private String yj;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiagnosis_desc() {
		return diagnosis_desc;
	}
	public void setDiagnosis_desc(String diagnosis_desc) {
		this.diagnosis_desc = diagnosis_desc;
	}
	public String getDiagnosis_value() {
		return diagnosis_value;
	}
	public void setDiagnosis_value(String diagnosis_value) {
		this.diagnosis_value = diagnosis_value;
	}
	public String getDiagnosis_date() {
		return diagnosis_date;
	}
	public void setDiagnosis_date(String diagnosis_date) {
		this.diagnosis_date = diagnosis_date;
	}
	public String getXy() {
		return xy;
	}
	public void setXy(String xy) {
		this.xy = xy;
	}
	public String getYj() {
		return yj;
	}
	public void setYj(String yj) {
		this.yj = yj;
	}
	public String getDiagnosis_no() {
		return diagnosis_no;
	}
	public void setDiagnosis_no(String diagnosis_no) {
		this.diagnosis_no = diagnosis_no;
	}
	public String getTreat_days() {
		return treat_days;
	}
	public void setTreat_days(String treat_days) {
		this.treat_days = treat_days;
	}
	public String getTreat_result() {
		return treat_result;
	}
	public void setTreat_result(String treat_result) {
		this.treat_result = treat_result;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
