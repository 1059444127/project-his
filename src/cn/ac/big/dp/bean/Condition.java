package cn.ac.big.dp.bean;

import java.io.Serializable;
import java.util.List;

public class Condition implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int freCondId;
	private String mainFieldName;
	private String mainFieldNameEn;
	private String fieldName;
	private String fieldNameEn;
	private String operator;
	private Object value1;
	private List<Object> value1s;
	private Object value2;
	private String andOr;
	private String group;
	private String item;
	private String testType;
	private List<Condition> groupList;
	
	public Condition(String mainFieldName, String fieldName) {
		super();
		this.mainFieldName = mainFieldName;
		this.fieldName = fieldName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((fieldName == null) ? 0 : fieldName.hashCode());
		result = prime * result
				+ ((mainFieldName == null) ? 0 : mainFieldName.hashCode());
		return result;
	}

	public List<Object> getValue1s() {
		return value1s;
	}

	public void setValue1s(List<Object> value1s) {
		this.value1s = value1s;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Condition other = (Condition) obj;
		if (fieldName == null) {
			if (other.fieldName != null)
				return false;
		} else if (!fieldName.equals(other.fieldName))
			return false;
		if (mainFieldName == null) {
			if (other.mainFieldName != null)
				return false;
		} else if (!mainFieldName.equals(other.mainFieldName))
			return false;
		return true;
	}
	public Condition(){}
	
	public Condition(String item, String testType, String mainFieldName, String fieldName,String fieldNameEn, String operator, Object value1, List<Object> value1s, Object value2, String andOr) {
		super();
		this.item = item;
		this.testType = testType;
		this.mainFieldName = mainFieldName;
		this.fieldName = fieldName;
		this.fieldNameEn = fieldNameEn;
		this.operator = operator;
		this.value1 = value1;
		this.value2 = value2;
		this.andOr = andOr;
		this.value1s = value1s;
	}
	
	public Condition(int freCondId, Object value1, Object value2) {
		super();
		this.freCondId = freCondId;
		this.value1 = value1;
		this.value2 = value2;
	}

	public Condition(int freCondId, String fieldName, String operator,
			Object value1, Object value2, String andOr) {
		super();
		this.freCondId = freCondId;
		this.fieldName = fieldName;
		this.operator = operator;
		this.value1 = value1;
		this.value2 = value2;
		this.andOr = andOr;
	}
	public String getMainFieldName() {
		return mainFieldName;
	}

	public void setMainFieldName(String mainFieldName) {
		this.mainFieldName = mainFieldName;
	}

	public String getMainFieldNameEn() {
		return mainFieldNameEn;
	}

	public void setMainFieldNameEn(String mainFieldNameEn) {
		this.mainFieldNameEn = mainFieldNameEn;
	}

	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public Object getValue1() {
		return value1;
	}
	public void setValue1(Object value1) {
		this.value1 = value1;
	}
	public Object getValue2() {
		return value2;
	}
	public void setValue2(Object value2) {
		this.value2 = value2;
	}
	public String getAndOr() {
		return andOr;
	}
	public void setAndOr(String andOr) {
		this.andOr = andOr;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public int getFreCondId() {
		return freCondId;
	}
	public void setFreCondId(int freCondId) {
		this.freCondId = freCondId;
	}
	@Override
	public String toString() {
		return "Condition [freCondId=" + freCondId + ", mainFieldName="
				+ mainFieldName + ", mainFieldNameEn=" + mainFieldNameEn
				+ ", fieldName=" + fieldName + ", fieldNameEn=" + fieldNameEn
				+ ", operator=" + operator + ", value1=" + value1 + ", value2="
				+ value2 + ", andOr=" + andOr + ", group=" + group
				+ ", testType=" + testType + ", groupList=" + groupList + "]";
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public List<Condition> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<Condition> groupList) {
		this.groupList = groupList;
	}

	public String getFieldNameEn() {
		return fieldNameEn;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public void setFieldNameEn(String fieldNameEn) {
		this.fieldNameEn = fieldNameEn;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}
}
