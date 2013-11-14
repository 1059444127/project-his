package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.dao.ISubItemInfoDao;
import cn.ac.big.dp.util.ChartKV;

public class SubItemInfoDao implements ISubItemInfoDao{
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	/* (non-Javadoc)
	 * @see cn.ac.big.dp.dao.impl.ISubLabItemInfoDao#selectSubLabItemInfoByParam(java.lang.String, java.lang.Object)
	 */
	public List<SubItemInfo> selectSubLabItemInfoByParam(String paramName, Object paramValue){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<SubItemInfo> slii = new ArrayList<SubItemInfo>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		slii = getSqlSessionTemplate().selectList("selectLabSubItemInfoByParam", paramMap);
		return slii;
	}

	public List<SubItemInfo> selectSubExamItemInfoByParam(String paramName, Object paramValue) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<SubItemInfo> slii = new ArrayList<SubItemInfo>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		slii = getSqlSessionTemplate().selectList("selectExamSubItemInfoByParam", paramMap);
		return slii;
	}
	public List<ChartKV> selectSameItemValue(List<SQLCondition> condList){
		List<ChartKV> valueList = new ArrayList<ChartKV>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		valueList = getSqlSessionTemplate().selectList("selectSameItemValue", paramMap);
		return valueList;
	}
}
