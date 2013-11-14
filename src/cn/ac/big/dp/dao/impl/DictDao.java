package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IDictDao;

public class DictDao implements IDictDao {
	
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	
	public List<Dict> selectDictByParams(List<SQLCondition> condList) {
		List<Dict> resultList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		resultList = getSqlSessionTemplate().selectList("selectDictByParams", paramMap);
		return resultList;
	}
	
	public List<Dict> getDictByParam(String paramName, int value) {
		List<Dict> dictList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", value);
		dictList =  getSqlSessionTemplate().selectList("selectDictByParam", paramMap);
		return dictList;
	}
	
	public List<Dict> selectSubDictByParam(String paramName, int value) {
		List<Dict> dictList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", value);
		dictList =  getSqlSessionTemplate().selectList("selectSubDictByParam", paramMap);
		return dictList;
	}

	public List<Dict> getAllDict(String status) {
		List<Dict> dictList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("status", status);
		dictList = getSqlSessionTemplate().selectList("selectAllDict",paramMap);
		return dictList;
	}
	
	public List<Dict> getAllSubDict(String testType) {
		List<Dict> dictList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testType", testType);
		dictList = getSqlSessionTemplate().selectList("selectAllSubDict", paramMap);
		return dictList;
	}
	
	public List<Dict> getAllDictByParam(String paramName, Object paramValue) {
		List<Dict> dictList = new ArrayList<Dict>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		dictList =  getSqlSessionTemplate().selectList("selectAllDictByParam", paramMap);
		return dictList;
	}
	
	public void updateDict(Dict dict){
		getSqlSessionTemplate().update("updateDict", dict);
	}
	public List<String> getDictNameByParam(String paramName, Object paramValue) {
		List<String> dictList = new ArrayList<String>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		dictList = getSqlSessionTemplate().selectList("selectDictNameByParam", paramMap);
		return dictList;
	}

}
