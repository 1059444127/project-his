package cn.ac.big.dp.bean;

public class SQLCondition {
	
	private String paramName;
	private Object paramValue;
	public SQLCondition(String paramName, Object paramValue) {
		this.paramName = paramName;
		this.paramValue = paramValue;
	}
	public SQLCondition() {
		super();
	}
	public String getParamName() {
		return paramName;
	}
	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
	public Object getParamValue() {
		return paramValue;
	}
	public void setParamValue(Object paramValue) {
		this.paramValue = paramValue;
	}
	
	
	
}
