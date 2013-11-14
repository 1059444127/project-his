package cn.ac.dp.chart;

import java.util.List;

public class StackChartJson extends ChartJson{
	private StackChart chart;
	private List<Categories> categories;
	private List<DataSet> dataset;
	private Styles styles;
	
	public StackChart getChart() {
		return chart;
	}
	public void setChart(StackChart chart) {
		this.chart = chart;
	}
	public List<Categories> getCategories() {
		return categories;
	}
	public void setCategories(List<Categories> categories) {
		this.categories = categories;
	}
	public List<DataSet> getDataset() {
		return dataset;
	}
	public void setDataset(List<DataSet> dataset) {
		this.dataset = dataset;
	}
	public Styles getStyles() {
		return styles;
	}
	public void setStyles(Styles styles) {
		this.styles = styles;
	}
	public StackChartJson(StackChart chart, List<Categories> categories, List<DataSet> dataset, Styles styles) {
		super();
		this.chart = chart;
		this.categories = categories;
		this.dataset = dataset;
		this.styles = styles;
	}
	
}	
