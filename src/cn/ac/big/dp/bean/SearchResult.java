package cn.ac.big.dp.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchResult implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String patientName;
	private String sex;
	private String age;
	private String smokeHis;
	private String alcoholHis;
	private String diagnose;
	private String patientId;
	private String visitId;
	private String height;
	private String weight;
	private String bmi;
	private String pushPressure;
	private String flatPressure; 
	private String heartRate;
	
	private Map<String, String> resultMap = new HashMap<String, String>();
	private List<DResult> diags;
	
	public List<DResult> getDiags() {
		return diags;
	}
	public void setDiags(List<DResult> diags) {
		this.diags = diags;
	}

	public String getPatientId() {
		return patientId;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
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
	public Map<String, String> getResultMap() {
		return resultMap;
	}
	public void setResultMap(Map<String, String> resultMap) {
		this.resultMap = resultMap;
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

	public String getSmokeHis() {
		return smokeHis;
	}

	public void setSmokeHis(String smokeHis) {
		this.smokeHis = smokeHis;
	}

	public String getAlcoholHis() {
		return alcoholHis;
	}

	public void setAlcoholHis(String alcoholHis) {
		this.alcoholHis = alcoholHis;
	}
	public String getDiagnose() {
		return diagnose;
	}
	public void setDiagnose(String diagnose) {
		this.diagnose = diagnose;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "SearchResult [id=" + id + ", patientName=" + patientName
				+ ", sex=" + sex + ", age=" + age + ", smokeHis=" + smokeHis
				+ ", alcoholHis=" + alcoholHis + ", patientId=" + patientId
				+ ", visitId=" + visitId + ", resultMap=" + resultMap + "]";
	}
	
}
