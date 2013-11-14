package cn.ac.big.dp.bean;

import java.io.Serializable;

public class TestItem implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String item;
	private String subject;
	private String reportName;
	private String result;
	
	@Override
	public String toString() {
		return "TestItem [item=" + item + ", subject=" + subject
				+ ", reportName=" + reportName + ", result=" + result + "]";
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
}
