package cn.ac.big.dp.bean;

import java.sql.Date;
import java.util.List;

public class Patient {
	
	private String id;
	private String patientId;
	private String patientName;
	private String sex;
	private Date birthday;
	private String birthPlace;
	private String nation;
	private String identity;
	private String mailAddress;
	private String phoneNumberBussness;
	private String nextOfKin;
	private String nextOfKinAddr;
	private String nextOfKinPhone;
	private String operatorName;
	private String maritalStatus;
	private String citizenship;
	private String IdNo;
	private String chargeType;
	private String unitInContract;
	private String zipCode;
	private String phoneNumberHome;
	private String mobileNumber;
	private String emailAddress;
	private String lastVisitDate;
	private List<Visit> visitList;
	private String vipIndicator;
	private String createDate;
	private Integer addFlag;
	
	@Override
	public String toString() {
		return "Patient [id=" + id + ", patientId=" + patientId
				+ ", patientName=" + patientName + ", sex=" + sex
				+ ", birthday=" + birthday + ", nation=" + nation
				+ ", identity=" + identity + ", mailAddress=" + mailAddress
				+ ", phoneNumberBussness=" + phoneNumberBussness
				+ ", nextOfKin=" + nextOfKin + ", nextOfKinAddr="
				+ nextOfKinAddr + ", nextOfKinPhone=" + nextOfKinPhone
				+ ", operatorName=" + operatorName + ", maritalStatus="
				+ maritalStatus + ", citizenship=" + citizenship + ", IdNo="
				+ IdNo + ", chargeType=" + chargeType + ", unitInContract="
				+ unitInContract + ", zipCode=" + zipCode
				+ ", phoneNumberHome=" + phoneNumberHome + ", mobileNumber="
				+ mobileNumber + ", emailAddress=" + emailAddress
				+ ", lastVisitDate=" + lastVisitDate + ", visitList="
				+ visitList + ", vipIndicator=" + vipIndicator
				+ ", createDate=" + createDate + "]";
	}
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getCitizenship() {
		return citizenship;
	}
	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}
	public String getIdNo() {
		return IdNo;
	}
	public void setIdNo(String idNo) {
		IdNo = idNo;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getUnitInContract() {
		return unitInContract;
	}
	public void setUnitInContract(String unitInContract) {
		this.unitInContract = unitInContract;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getPhoneNumberHome() {
		return phoneNumberHome;
	}
	public void setPhoneNumberHome(String phoneNumberHome) {
		this.phoneNumberHome = phoneNumberHome;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getLastVisitDate() {
		return lastVisitDate;
	}
	public void setLastVisitDate(String lastVisitDate) {
		this.lastVisitDate = lastVisitDate;
	}
	public String getVipIndicator() {
		return vipIndicator;
	}
	public void setVipIndicator(String vipIndicator) {
		this.vipIndicator = vipIndicator;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getPatientId() {
		return patientId;
	}
	public void setPatientId(String patientId) {
		this.patientId = patientId;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	public String getPhoneNumberBussness() {
		return phoneNumberBussness;
	}
	public void setPhoneNumberBussness(String phoneNumberBussness) {
		this.phoneNumberBussness = phoneNumberBussness;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNextOfKin() {
		return nextOfKin;
	}
	public void setNextOfKin(String nextOfKin) {
		this.nextOfKin = nextOfKin;
	}
	public String getNextOfKinAddr() {
		return nextOfKinAddr;
	}
	public void setNextOfKinAddr(String nextOfKinAddr) {
		this.nextOfKinAddr = nextOfKinAddr;
	}
	public String getNextOfKinPhone() {
		return nextOfKinPhone;
	}
	public void setNextOfKinPhone(String nextOfKinPhone) {
		this.nextOfKinPhone = nextOfKinPhone;
	}
	public List<Visit> getVisitList() {
		return visitList;
	}
	public void setVisitList(List<Visit> visitList) {
		this.visitList = visitList;
	}
	public String getOperatorName() {
		return operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public Integer getAddFlag() {
		return addFlag;
	}
	public void setAddFlag(Integer addFlag) {
		this.addFlag = addFlag;
	}
}
