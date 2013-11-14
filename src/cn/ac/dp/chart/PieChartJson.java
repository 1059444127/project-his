package cn.ac.dp.chart;

import java.util.List;


public class PieChartJson extends ChartJson {
	
	private Chart chart;
	private List<Data> data;
	
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
	
}
