package cn.ac.big.dp.bean;

public class Drug {
	
	private String id;
	private String ITEM_NO; 
	private String DRUG_CODE;
	private String DRUG_NAME; 
	private String DRUG_SPEC; 
	private String FIRM_ID;
	private String PACKAGE_SPEC;
	private String PACKAGE_UNITS;
	private String QUANTITY;
	private String DOSAGE;
	private String DOSAGE_UNITS;
	private String ADMINISTRATION;
	private String FREQUENCY;
	private String DIAGNOSIS;
	private String MEMO;
	private String patientid;
	private String visitid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getITEM_NO() {
		return ITEM_NO;
	}
	public void setITEM_NO(String iTEM_NO) {
		ITEM_NO = iTEM_NO;
	}
	public String getDRUG_CODE() {
		return DRUG_CODE;
	}
	public void setDRUG_CODE(String dRUG_CODE) {
		DRUG_CODE = dRUG_CODE;
	}
	public String getDRUG_NAME() {
		return DRUG_NAME;
	}
	public void setDRUG_NAME(String dRUG_NAME) {
		DRUG_NAME = dRUG_NAME;
	}
	public String getDRUG_SPEC() {
		return DRUG_SPEC;
	}
	public void setDRUG_SPEC(String dRUG_SPEC) {
		DRUG_SPEC = dRUG_SPEC;
	}
	public String getFIRM_ID() {
		return FIRM_ID;
	}
	public void setFIRM_ID(String fIRM_ID) {
		FIRM_ID = fIRM_ID;
	}
	public String getPACKAGE_SPEC() {
		return PACKAGE_SPEC;
	}
	public void setPACKAGE_SPEC(String pACKAGE_SPEC) {
		PACKAGE_SPEC = pACKAGE_SPEC;
	}
	public String getPACKAGE_UNITS() {
		return PACKAGE_UNITS;
	}
	public void setPACKAGE_UNITS(String pACKAGE_UNITS) {
		PACKAGE_UNITS = pACKAGE_UNITS;
	}
	public String getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(String qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public String getDOSAGE() {
		return DOSAGE;
	}
	public void setDOSAGE(String dOSAGE) {
		DOSAGE = dOSAGE;
	}
	public String getDOSAGE_UNITS() {
		return DOSAGE_UNITS;
	}
	public void setDOSAGE_UNITS(String dOSAGE_UNITS) {
		DOSAGE_UNITS = dOSAGE_UNITS;
	}
	public String getADMINISTRATION() {
		return ADMINISTRATION;
	}
	public void setADMINISTRATION(String aDMINISTRATION) {
		ADMINISTRATION = aDMINISTRATION;
	}
	public String getFREQUENCY() {
		return FREQUENCY;
	}
	public void setFREQUENCY(String fREQUENCY) {
		FREQUENCY = fREQUENCY;
	}
	public String getDIAGNOSIS() {
		return DIAGNOSIS;
	}
	public void setDIAGNOSIS(String dIAGNOSIS) {
		DIAGNOSIS = dIAGNOSIS;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
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
	@Override
	public String toString() {
		return "Drug [id=" + id + ", ITEM_NO=" + ITEM_NO + ", DRUG_CODE="
				+ DRUG_CODE + ", DRUG_NAME=" + DRUG_NAME + ", DRUG_SPEC="
				+ DRUG_SPEC + ", FIRM_ID=" + FIRM_ID + ", PACKAGE_SPEC="
				+ PACKAGE_SPEC + ", PACKAGE_UNITS=" + PACKAGE_UNITS
				+ ", QUANTITY=" + QUANTITY + ", DOSAGE=" + DOSAGE
				+ ", DOSAGE_UNITS=" + DOSAGE_UNITS + ", ADMINISTRATION="
				+ ADMINISTRATION + ", FREQUENCY=" + FREQUENCY + ", DIAGNOSIS="
				+ DIAGNOSIS + ", MEMO=" + MEMO + "]";
	}
}
