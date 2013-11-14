package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.FastSearchResult;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.TestItem;
import cn.ac.big.dp.dao.ITestResultDao;

public class TestResultDao implements ITestResultDao {
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<TestItem> searchTestResult(List<SQLCondition> condList) {
		List<TestItem> resultList = new ArrayList<TestItem>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		resultList = getSqlSessionTemplate().selectList("searchTestResult", paramMap);
		return resultList;
	}
	
	/**
	 * 获取符合条件的病人病次信息
	 */
	public List<PatientVisit> searchTestResultByCondition(List<Condition> condList, int simpleSearch){
		
		Set<PatientVisit> resultSet = new HashSet<PatientVisit>();
		List<PatientVisit> resultList = new ArrayList<PatientVisit>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		for(int i=0; i<condList.size(); i++) {
			//1.获取所有条件对应的patient
			Condition cond = condList.get(i);
			paramMap.put("condition", cond);
			System.out.println(cond);
			
			if("基础信息".equals(cond.getTestType())) {
				resultList = getSqlSessionTemplate().selectList("selectPatientVisitByParam", paramMap);
			} else if("诊断信息".equals(cond.getTestType())) {
				resultList = getSqlSessionTemplate().selectList("selectPatientVisitByDiag", paramMap);
			} else if("检查".equals(cond.getTestType())){
				resultList = getSqlSessionTemplate().selectList("selectExamResultSet", paramMap);
			} else if("检验".equals(cond.getTestType())){
				resultList = getSqlSessionTemplate().selectList("selectTestResultSet"+simpleSearch, paramMap);
			} else {
				
			}
			//如果是或的关系，则取并集
			if(i==0 || "or".equals(condList.get(i).getAndOr()))  {
				resultSet.addAll(resultList);
			}
			//否则，取交集
			else if("not".equals(condList.get(i).getAndOr())){
				resultSet.removeAll(resultList);
			} else {
				resultSet.retainAll(resultList);
			}
		}
		return new ArrayList<PatientVisit>(resultSet);
	}

	public SearchResult selectVPatVisitInfoByParam(List<SQLCondition> condList) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		SearchResult sr = (SearchResult) getSqlSessionTemplate().selectOne("selectVPatVisitInfoByParam", paramMap);
		if(sr==null) {
			return new SearchResult();
		}
		return sr;
	}

	public List<DResult> searchDiagResult(List<SQLCondition> condList) {
		List<DResult> diags = new ArrayList<DResult>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		diags = getSqlSessionTemplate().selectList("searchDiagResult", paramMap);
		return diags;
	}

	public Map<String, FastSearchResult> searchTestResultFast(List<PatientVisit> pvList) {
		Map<String, FastSearchResult> resultMap = new HashMap<String, FastSearchResult>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", pvList);
		SqlSession session = getSqlSessionTemplate().getSqlSessionFactory().openSession();
		resultMap = session.selectMap("selectTestResultFast", paramMap, "id");
		session.close();
		return resultMap;
	}
	
	public Map<String, SearchResult> selectVPatVisitInfoByParamFast(List<PatientVisit> pvList) {
		Map<String, SearchResult> resultMap = new HashMap<String, SearchResult>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", pvList);
		SqlSession session = getSqlSessionTemplate().getSqlSessionFactory().openSession();
		resultMap = session.selectMap("selectVPatientVisitFast", paramMap, "id");
		session.close();
		return resultMap;
	}
	public List<TestItem> searchExamResult(List<SQLCondition> condList) {
		List<TestItem> resultList = new ArrayList<TestItem>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		resultList = getSqlSessionTemplate().selectList("searchExamResult", paramMap);
		return resultList;
	}
	public List<Map<String, String>> searchChaoshengResult( List<SQLCondition> sqlCondList) {
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", sqlCondList);
		resultList = getSqlSessionTemplate().selectList("searchChaoshengResult", paramMap);
		return resultList;
	}
	
}
