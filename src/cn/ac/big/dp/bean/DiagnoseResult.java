package cn.ac.big.dp.bean;

import java.util.ArrayList;
import java.util.List;

public class DiagnoseResult {
	
	private String patientid;
	private String visitid;
	private int treat_days;
	
	private List<DResult> diagResult = new ArrayList<DResult>();

	public String getPatientid() {
		return patientid;
	}

	public void setPatientid(String patientid) {
		this.patientid = patientid;
	}

	public String getVisitid() {
		return visitid;
	}

	public void setVisitid(String visitid) {
		this.visitid = visitid;
	}

	public int getTreat_days() {
		return treat_days;
	}

	public void setTreat_days(int treat_days) {
		this.treat_days = treat_days;
	}

	public List<DResult> getDiagResult() {
		return diagResult;
	}

	public void setDiagResult(List<DResult> diagResult) {
		this.diagResult = diagResult;
	}
	
}
