package cn.ac.dp.chart;

public class LineDefinition extends Definition {
	
	private String size;

	public LineDefinition(String name, String type, String size) {
		super(name, type);
		this.size = size;
	}

	public LineDefinition(String name, String type) {
		super(name, type);
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
}
