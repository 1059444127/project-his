package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SearchResult;
public interface ITestService {

	public List<SearchResult> searchTestResultByCondition(List<PatientVisit> patVisList);
	public List<PatientVisit> searchPatientVisit(List<Condition> condList, int simpleSearch);
	public List<SearchResult> getResult(List<Condition> condList, boolean flag, int simpleSearch);
}