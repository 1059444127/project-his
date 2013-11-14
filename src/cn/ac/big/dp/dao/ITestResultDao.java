package cn.ac.big.dp.dao;

import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.FastSearchResult;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.TestItem;

public interface ITestResultDao {

	public List<TestItem> searchTestResult(List<SQLCondition> condList);
	public List<PatientVisit> searchTestResultByCondition(List<Condition> condList, int simpleSearch);
	public SearchResult selectVPatVisitInfoByParam(List<SQLCondition> condList);
	public List<DResult> searchDiagResult(List<SQLCondition> condList);
	
	public Map<String, FastSearchResult> searchTestResultFast(List<PatientVisit> pvList);
	public Map<String, SearchResult> selectVPatVisitInfoByParamFast(List<PatientVisit> pvList);
	public List<TestItem> searchExamResult(List<SQLCondition> sqlCondList);
	public List<Map<String, String>> searchChaoshengResult(List<SQLCondition> sqlCondList);
}