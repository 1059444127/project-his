package cn.ac.dp.chart;

import java.util.List;

public class DataSet {
	
	 private String seriesname;
     private String color;
     private String anchorbordercolor;
     private String anchorbgcolor;
     private List<Data> data;
         
         
	public String getSeriesname() {
		return seriesname;
	}
	public void setSeriesname(String seriesname) {
		this.seriesname = seriesname;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getAnchorbordercolor() {
		return anchorbordercolor;
	}
	public void setAnchorbordercolor(String anchorbordercolor) {
		this.anchorbordercolor = anchorbordercolor;
	}
	public String getAnchorbgcolor() {
		return anchorbgcolor;
	}
	public void setAnchorbgcolor(String anchorbgcolor) {
		this.anchorbgcolor = anchorbgcolor;
	}
	public List<Data> getData() {
		return data;
	}
	public void setData(List<Data> data) {
		this.data = data;
	}
	public DataSet(String seriesname, String color,
			String anchorbordercolor, String anchorbgcolor,
			List<Data> data) {
		this.seriesname = seriesname;
		this.color = color;
		this.anchorbordercolor = anchorbordercolor;
		this.anchorbgcolor = anchorbgcolor;
		this.data = data;
	}
         
         
}
