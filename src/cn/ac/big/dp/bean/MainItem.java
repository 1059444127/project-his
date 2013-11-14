package cn.ac.big.dp.bean;

import java.util.List;

public class MainItem {
	
	private String execDate;
	private List<Item> itemList;
	public String getExecDate() {
		return execDate;
	}
	public void setExecDate(String execDate) {
		this.execDate = execDate;
	}
	public List<Item> getItemList() {
		return itemList;
	}
	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}
	
}
