package cn.ac.big.dp.bean;

import java.sql.Date;

public class Visit {
	
	private String id;
	private String visitId;
	private String patientId;
	private String patientName;
	private Date admissionDateTime;
	private String admissionTo;
	private String deptDischargeFrom;
	private Date dischargeDateTime;
	private String patientClass;
	private String admissionCause;
	private String consultingDoctor;
	private String attendingDoctor;
	
	public String getDeptDischargeFrom() {
		return deptDischargeFrom;
	}
	public void setDeptDischargeFrom(String deptDischargeFrom) {
		this.deptDischargeFrom = deptDischargeFrom;
	}
	public Date getDischargeDateTime() {
		return dischargeDateTime;
	}
	public void setDischargeDateTime(Date dischargeDateTime) {
		this.dischargeDateTime = dischargeDateTime;
	}
	public String getPatientClass() {
		return patientClass;
	}
	public void setPatientClass(String patientClass) {
		this.patientClass = patientClass;
	}
	public String getAdmissionCause() {
		return admissionCause;
	}
	public void setAdmissionCause(String admissionCause) {
		this.admissionCause = admissionCause;
	}
	public String getConsultingDoctor() {
		return consultingDoctor;
	}
	public void setConsultingDoctor(String consultingDoctor) {
		this.consultingDoctor = consultingDoctor;
	}
	public String getAttendingDoctor() {
		return attendingDoctor;
	}
	public void setAttendingDoctor(String attendingDoctor) {
		this.attendingDoctor = attendingDoctor;
	}
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	public Date getAdmissionDateTime() {
		return admissionDateTime;
	}
	public void setAdmissionDateTime(Date admissionDateTime) {
		this.admissionDateTime = admissionDateTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	@Override
	public String toString() {
		return "Visit [id=" + id + ", visitId=" + visitId
				+ ", admissionDateTime=" + admissionDateTime + "]";
	}
	public String getAdmissionTo() {
		return admissionTo;
	}
	public void setAdmissionTo(String admissionTo) {
		this.admissionTo = admissionTo;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}
	
}
