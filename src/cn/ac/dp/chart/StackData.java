package cn.ac.dp.chart;

public class StackData extends Data {
	private String link;
	
	public StackData(String value) {
		super(value);
	}

	public StackData(String value, String link) {
		super(value);
		this.link = link;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
}
