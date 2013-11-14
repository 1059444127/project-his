package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.GroupCondition;
import cn.ac.big.dp.dao.IConditionDao;

public class ConditionDao implements IConditionDao{
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	
	public void insertCondition(Condition condition){
	    getSqlSessionTemplate().insert("insertCondition", condition);
	}
	public void deleteCondition(String conId){
		getSqlSessionTemplate().delete("deleteCondition",conId);
	}
	public List<GroupCondition> selectAllCondition(){
		List<GroupCondition> condList = new ArrayList<GroupCondition>();
		condList = getSqlSessionTemplate().selectList("selectCondition");
		return condList;
	}
	public List<Condition> selectCondByParam(String paramName, Object paramValue){
		List<Condition> condList = new ArrayList<Condition>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		condList = getSqlSessionTemplate().selectList("selectConditionByParam", paramMap);
		return condList;
	}
}
