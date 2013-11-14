package cn.ac.dp.chart;

import java.util.List;


public class ColumnChartJson extends ChartJson {
	
	private Chart chart;
	private List<Data> data;
	private Styles styles;
	
	public void setChart(LineChart chart) {
		this.chart = chart;
	}
	public Chart getChart() {
		return chart;
	}
	public void setChart(Chart chart) {
		this.chart = chart;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
	public Styles getStyles() {
		return styles;
	}
	public void setStyles(Styles styles) {
		this.styles = styles;
	}
}
