package cn.ac.big.dp.bean;

import java.util.List;

public class OrderCondition {
	
	private String CondId;
	private List<String> CondDisplay;
	
	public String getCondId() {
		return CondId;
	}
	public void setCondId(String condId) {
		CondId = condId;
	}
	public OrderCondition(String condId, List<String> condDisplay) {
		super();
		CondId = condId;
		CondDisplay = condDisplay;
	}
	public List<String> getCondDisplay() {
		return CondDisplay;
	}
	public void setCondDisplay(List<String> condDisplay) {
		CondDisplay = condDisplay;
	}
	@Override
	public String toString() {
		return "OrderCondition [CondId=" + CondId + ", CondDisplay="
				+ CondDisplay + "]";
	}
}
