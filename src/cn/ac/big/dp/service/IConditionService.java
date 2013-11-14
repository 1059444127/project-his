package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.GroupCondition;
import cn.ac.big.dp.bean.SearchForm;

public interface IConditionService {

	public List<Condition> insertCondition(SearchForm searchForm, String saveName);

	public abstract void deleteCondition(String conId);

	public abstract List<GroupCondition> selectAllCondition();

	public List<Condition> selectCondByGroupId(String groupId);
}