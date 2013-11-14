package cn.ac.dp.chart;


public class PieData extends Data{
	
	private String label;
	private String link;
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public PieData(String label, String value) {
		super(value);
		this.setLabel(label);
	}
	public PieData(String label, String value, String link) {
		super(value);
		this.label = label;
		this.link = link;
	}
}
