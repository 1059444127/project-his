package cn.ac.dp.chart;

public class Definition {
	
	private String name;
	private String type;
	private String param;
	private String start;
	private String duration;
	
	public Definition(String name, String type, String param, String start, String duration) {
		super();
		this.name = name;
		this.type = type;
		this.param = param;
		this.start = start;
		this.duration = duration;
	}
	
	public Definition(String name, String type, String param, String start) {
		super();
		this.name = name;
		this.type = type;
		this.param = param;
		this.start = start;
	}

	public Definition(String name, String type) {
		super();
		this.name = name;
		this.type = type;
	}

	public Definition(String name) {
		super();
		this.name = name;
	}

	public Definition(String name, String type, String param) {
		super();
		this.name = name;
		this.type = type;
		this.param = param;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
}
