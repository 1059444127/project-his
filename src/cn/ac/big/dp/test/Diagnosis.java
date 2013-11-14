package cn.ac.big.dp.test;

public class Diagnosis {
	
	private int pkid;
	private String id;
	private String yId;
	private String patient_id;
	private String visit_id;
	private String diagnosis_type;
	private String diagnosis_no;
	private String diagnosis_desc;
	private String diagnosis_date;
	private String treat_days;
	private String treat_result;
	private String code_version;
	private String diagnosis_value;
	private String subject;
	
	public int getPkid() {
		return pkid;
	}
	public void setPkid(int pkid) {
		this.pkid = pkid;
	}
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
	public String getDiagnosis_type() {
		return diagnosis_type;
	}
	public void setDiagnosis_type(String diagnosis_type) {
		this.diagnosis_type = diagnosis_type;
	}
	public String getDiagnosis_no() {
		return diagnosis_no;
	}
	public void setDiagnosis_no(String diagnosis_no) {
		this.diagnosis_no = diagnosis_no;
	}
	public String getDiagnosis_desc() {
		return diagnosis_desc;
	}
	public void setDiagnosis_desc(String diagnosis_desc) {
		this.diagnosis_desc = diagnosis_desc;
	}
	public String getDiagnosis_date() {
		return diagnosis_date;
	}
	public void setDiagnosis_date(String diagnosis_date) {
		this.diagnosis_date = diagnosis_date;
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
	public String getCode_version() {
		return code_version;
	}
	public void setCode_version(String code_version) {
		this.code_version = code_version;
	}
	public String getDiagnosis_value() {
		return diagnosis_value;
	}
	public void setDiagnosis_value(String diagnosis_value) {
		this.diagnosis_value = diagnosis_value;
	}
	@Override
	public String toString() {
		return "Diagnosis [pkid=" + pkid + ", id=" + id + ", patient_id="
				+ patient_id + ", visit_id=" + visit_id + ", diagnosis_type="
				+ diagnosis_type + ", diagnosis_no=" + diagnosis_no
				+ ", diagnosis_desc=" + diagnosis_desc + ", diagnosis_date="
				+ diagnosis_date + ", treat_days=" + treat_days
				+ ", treat_result=" + treat_result + ", code_version="
				+ code_version + "]";
	}
	public String getyId() {
		return yId;
	}
	public void setyId(String yId) {
		this.yId = yId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
