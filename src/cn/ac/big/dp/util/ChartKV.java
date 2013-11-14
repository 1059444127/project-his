package cn.ac.big.dp.util;

public class ChartKV {
	
	private String value;
	private String date;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getValue() {
		return value;
	}
	public ChartKV() {
		super();
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public ChartKV(String value, String date) {
		super();
		this.value = value;
		this.date = date;
	}
	
}
