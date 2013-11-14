package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.GroupCondition;

public interface IConditionDao {

	public abstract void insertCondition(Condition condition);

	public abstract void deleteCondition(String conId);

	public abstract List<GroupCondition> selectAllCondition();

	public List<Condition> selectCondByParam(String paramName, Object paramValue);
}