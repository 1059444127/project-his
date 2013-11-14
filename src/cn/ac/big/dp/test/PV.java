package cn.ac.big.dp.test;

public class PV {
	
	private String patient_id;
	private String visit_id;
	@Override
	public String toString() {
		return "PV [patient_id=" + patient_id + ", visit_id=" + visit_id + "]";
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
	
}
