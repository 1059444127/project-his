package cn.ac.big.dp.bean;

public class NormalDiagnose {
	private int id;
	private String patientId;
	private String visitId;
	private String height;
	private String weight;
	private String bmi;
	private String pushPressure;
	private String flatPressure;
	private String heartRate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	public String getPushPressure() {
		return pushPressure;
	}
	public void setPushPressure(String pushPressure) {
		this.pushPressure = pushPressure;
	}
	public String getFlatPressure() {
		return flatPressure;
	}
	public void setFlatPressure(String flatPressure) {
		this.flatPressure = flatPressure;
	}
	public String getHeartRate() {
		return heartRate;
	}
	public void setHeartRate(String heartRate) {
		this.heartRate = heartRate;
	}
}
