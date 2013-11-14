package cn.ac.big.dp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.NormalDiagnose;
import cn.ac.big.dp.bean.PatientVisit;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SearchResult;
import cn.ac.big.dp.bean.TestItem;
import cn.ac.big.dp.dao.IDictDao;
import cn.ac.big.dp.dao.INormalDiagnoseDao;
import cn.ac.big.dp.dao.ITestResultDao;
import cn.ac.big.dp.service.ITestService;

public class TestSearchService implements ITestService {

	private ITestResultDao testResultDao;
	private IDictDao dictDao;
	private INormalDiagnoseDao normalDiagnoseDao;

	/*
	 * 根据条件查询病人基本信息
	 */
	public List<PatientVisit> searchPatientVisit(List<Condition> condList, int simpleSearch) {
		return testResultDao.searchTestResultByCondition(condList, simpleSearch);
	}

	/*
	 * 根据条件查询符合条件的结果集合
	 */
	public List<SearchResult> searchTestResultByCondition(List<PatientVisit> patVisList) {

		List<SearchResult> resultList = new ArrayList<SearchResult>();
		SearchResult sr = null;
		NormalDiagnose normalDiagnose = null;
		List<SQLCondition> sqlCondList = null;
		List<TestItem> itemResultList = null;
		List<TestItem> itemeResultList = null;
		List<DResult> diagResultList = null;
		String key = null;
		Map<String, String> tempMap = null;
		
		// 3.把所有的结果小项封装到map中，key-项目名称，value-项目值列表

		for (PatientVisit tr : patVisList) {
			sqlCondList = new ArrayList<SQLCondition>();
			tempMap = new HashMap<String, String>();
			String result = null;

			SQLCondition psc = new SQLCondition("patient_id", tr.getPatientId());
			SQLCondition vsc = new SQLCondition("visit_id", tr.getVisitId());
			sqlCondList.add(psc);

			// 1.根据patient_id获取病人基本信息
			sr = testResultDao.selectVPatVisitInfoByParam(sqlCondList);
			
			sr.setVisitId(tr.getVisitId());
			sqlCondList.add(vsc);
			
			normalDiagnose = normalDiagnoseDao.findOneByParams(sqlCondList);
			if(normalDiagnose!=null) {
				sr.setBmi(normalDiagnose.getBmi());
				sr.setHeight(normalDiagnose.getHeight());
				sr.setWeight(normalDiagnose.getWeight());
				sr.setPushPressure(normalDiagnose.getPushPressure());
				sr.setFlatPressure(normalDiagnose.getFlatPressure());
				sr.setHeartRate(normalDiagnose.getHeartRate());
			}


			// 3.获取病人对应的所有检验小项值
			itemResultList = testResultDao.searchTestResult(sqlCondList);
			// 4.获取病人对应所有检查小项值
			itemeResultList = testResultDao.searchExamResult(sqlCondList);
			// 2.获取病人诊断信息
			diagResultList = testResultDao.searchDiagResult(sqlCondList);

			for (DResult d : diagResultList) {
				result = d.getDiagnosis_value();
				key = d.getSubject() + d.getDiagnosis_desc();
				tempMap.put(key, result);
			}
			for (TestItem ti : itemResultList) {
				result = ti.getResult();
				key = ti.getSubject() + ti.getReportName();
				tempMap.put(key, result);
			}
			for (TestItem ti : itemeResultList) {
				result = ti.getResult();
				key = ti.getSubject() + ti.getReportName();
				tempMap.put(key, result);
			}
			
			sr.setResultMap(tempMap);
			resultList.add(sr);
		}

		return resultList;
	}

	public ITestResultDao getTestResultDao() {
		return testResultDao;
	}

	public void setTestResultDao(ITestResultDao testResultDao) {
		this.testResultDao = testResultDao;
	}

	public IDictDao getDictDao() {
		return dictDao;
	}

	public void setDictDao(IDictDao dictDao) {
		this.dictDao = dictDao;
	}

	public List<SearchResult> getResult(List<Condition> condList, boolean flag,
			int simpleSearch) {
		List<PatientVisit> patVisitList = this.searchPatientVisit(condList,simpleSearch);
		List<SearchResult> testResultList = this.searchTestResultByCondition(patVisitList);
		return testResultList;
	}

	public void setNormalDiagnoseDao(INormalDiagnoseDao normalDiagnoseDao) {
		this.normalDiagnoseDao = normalDiagnoseDao;
	}

}
