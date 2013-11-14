package cn.ac.dp.chart;

public class PyramidData extends Data{
	private String label;

	public PyramidData(String label, String value) {
		super(value);
		this.label = label;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
}
