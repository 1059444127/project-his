package cn.ac.big.dp.bean;

import java.util.List;

public class GroupCondition {
	
	private String group;
	private List<Condition> groupList;
	
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public List<Condition> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<Condition> groupList) {
		this.groupList = groupList;
	}
	@Override
	public String toString() {
		return "GroupCondition [group=" + group + ", groupList=" + groupList
				+ "]";
	}
}
