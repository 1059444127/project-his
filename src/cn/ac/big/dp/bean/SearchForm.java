package cn.ac.big.dp.bean;

import java.util.Arrays;

public class SearchForm {
	private String[] mainItem;
	private String[] subItem;
	private String[] subItemEn;
	private String[] operator;
	private String[] itemValue1;
	private String[] itemValue2;
	private String[] relation;
	private String[] testType;
	
	public String[] getMainItem() {
		return mainItem;
	}
	public void setMainItem(String[] mainItem) {
		this.mainItem = mainItem;
	}
	public String[] getSubItem() {
		return subItem;
	}
	public void setSubItem(String[] subItem) {
		this.subItem = subItem;
	}
	public String[] getOperator() {
		return operator;
	}
	public void setOperator(String[] operator) {
		this.operator = operator;
	}
	public String[] getItemValue1() {
		return itemValue1;
	}
	public void setItemValue1(String[] itemValue1) {
		this.itemValue1 = itemValue1;
	}
	public String[] getItemValue2() {
		return itemValue2;
	}
	public void setItemValue2(String[] itemValue2) {
		this.itemValue2 = itemValue2;
	}
	public String[] getRelation() {
		return relation;
	}
	public void setRelation(String[] relation) {
		this.relation = relation;
	}
	public String[] getTestType() {
		return testType;
	}
	public void setTestType(String[] testType) {
		this.testType = testType;
	}
	public String[] getSubItemEn() {
		return subItemEn;
	}
	public void setSubItemEn(String[] subItemEn) {
		this.subItemEn = subItemEn;
	}
	@Override
	public String toString() {
		return "SearchForm [mainItem=" + Arrays.toString(mainItem)
				+ ", subItem=" + Arrays.toString(subItem) + ", subItemEn="
				+ Arrays.toString(subItemEn) + ", operator="
				+ Arrays.toString(operator) + ", itemValue1="
				+ Arrays.toString(itemValue1) + ", itemValue2="
				+ Arrays.toString(itemValue2) + ", relation="
				+ Arrays.toString(relation) + ", testType="
				+ Arrays.toString(testType) + "]";
	}
}
