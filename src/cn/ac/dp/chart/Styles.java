package cn.ac.dp.chart;

import java.util.List;


public class Styles {
	
	public Styles() {
		super();
	}
	private List<Definition> definition;
	private List<Application> application;
	
	public List<Application> getApplication() {
		return application;
	}
	public void setApplication(List<Application> application) {
		this.application = application;
	}
	public List<Definition> getDefinition() {
		return definition;
	}
	public void setDefinition(List<Definition> definition) {
		this.definition = definition;
	}
	public Styles(List<Definition> definition, List<Application> application) {
		this.definition = definition;
		this.application = application;
	}
}
