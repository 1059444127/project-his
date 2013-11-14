package cn.ac.big.dp.test;

public class NewWb {
	
	private String id;
	private String dictName;
	private String unit;
	private int type;
	private String examLabFlag;
	private String stauts;
	private String context;
	
	public NewWb(String dictName, String unit, String context) {
		super();
		this.type = 1;
		this.examLabFlag = "检验";
		this.stauts = "1";
		this.dictName = dictName;
		this.unit = unit;
		this.context = context;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDictName() {
		return dictName;
	}
	public void setDictName(String dictName) {
		this.dictName = dictName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getExamLabFlag() {
		return examLabFlag;
	}
	public void setExamLabFlag(String examLabFlag) {
		this.examLabFlag = examLabFlag;
	}
	public String getStauts() {
		return stauts;
	}
	public void setStauts(String stauts) {
		this.stauts = stauts;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
}
