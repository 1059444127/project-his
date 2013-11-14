package cn.ac.big.dp.test;

import java.util.List;

import cn.ac.big.dp.bean.SubItemInfo;

public class LabItem {
	
	@Override
	public String toString() {
		return "LabItem [testNo=" + testNo + ", subject=" + subject
				+ ", subItemList=" + subItemList + "]";
	}
	private String testNo;
	private String subject;
	private List<SubItemInfo> subItemList;
	
	public String getTestNo() {
		return testNo;
	}
	public void setTestNo(String testNo) {
		this.testNo = testNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public List<SubItemInfo> getSubItemList() {
		return subItemList;
	}
	public void setSubItemList(List<SubItemInfo> subItemList) {
		this.subItemList = subItemList;
	}
	
}
