package cn.ac.dp.chart;

import java.util.List;

public class PyramidChartJson extends ChartJson{
	
	private Chart chart;
	private List<Data> data;
	private Styles styles;
	
	public PyramidChartJson(Chart chart, List<Data> data, Styles styles) {
		super();
		this.chart = chart;
		this.data = data;
		this.styles = styles;
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
