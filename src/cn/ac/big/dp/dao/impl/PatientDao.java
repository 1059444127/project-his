package cn.ac.big.dp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.Visit;
import cn.ac.big.dp.dao.IPatientDao;

public class PatientDao implements IPatientDao{
	
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<String> selectAllPatientName() {
		return this.sessionTemplate.selectList("selectAllPatientName");
	}
	public Integer selectVisitCount(Visit visit) {
		return this.sessionTemplate.selectOne("selectCountVisit", visit);
	}
	public List<Visit> selectVisitPager(Visit visit, int fromIndex, int pageSize) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fromIndex", fromIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("visit", visit);
		return this.sessionTemplate.selectList("selectAllVisit", paramMap);
	}
	public Integer selectPatientCount(Patient patient) {
		return this.sessionTemplate.selectOne("selectCountPatient", patient);
	}
	public List<Patient> selectPatientPager(Patient patient, int fromIndex, int pageSize){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fromIndex", fromIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("patient", patient);
		return this.sessionTemplate.selectList("selectAllPatient", paramMap);
	}
	public Patient selectPatientByParam(String paramName, Object paramValue){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		return (Patient) getSqlSessionTemplate().selectOne("selectPatientByParam", paramMap);
	}
	public int savePatient(Patient patient) {
		return getSqlSessionTemplate().insert("savePatient", patient);
	}
	public int savePatientVisit(String patientId, Visit visit) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visit", visit);
		return getSqlSessionTemplate().insert("savePatientVisit", paramMap);
	}
	public int saveDrugInfo(List<Drug> drug) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", drug);
		getSqlSessionTemplate().insert("saveDrugInfo", paramMap);
		return 1;
	}
	public int saveTestItem(List<Item> testItems) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", testItems);
		getSqlSessionTemplate().insert("saveMainTestItem", paramMap);
		getSqlSessionTemplate().insert("saveSubTestItem", paramMap);
		getSqlSessionTemplate().insert("saveSubLabItem", paramMap);
		return 1;
	}
	public int saveExamItem(List<Item> examItems) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", examItems);
		getSqlSessionTemplate().insert("saveMainExamItem", paramMap);
		getSqlSessionTemplate().insert("saveSubExamItem", paramMap);
		getSqlSessionTemplate().insert("saveExamItem", paramMap);
		return 1;
	}
	public int saveDiag(List<DResult> diags) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", diags);
		getSqlSessionTemplate().insert("saveDiagItem", paramMap);
		return 1;
	}
	public List<Visit> selectVisitByParam(String paramName, Object paramValue) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("paramName", paramName);
		paramMap.put("paramValue", paramValue);
		return getSqlSessionTemplate().selectList("selectVisitByParam", paramMap);
	}
	public int deletePatientInfo(String patientId) {
		return getSqlSessionTemplate().delete("deletePatientInfo", patientId);
	}
	public int deletePatientVisitInfo(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visitId", visitId);
		return getSqlSessionTemplate().delete("deletePatientVisitInfo", paramMap);
	}
	public int deletePatientTestInfo(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visitId", visitId);
		return getSqlSessionTemplate().delete("deletePatientTestInfo", paramMap);
	}
	public int deletePatientExamInfo(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visitId", visitId);
		return getSqlSessionTemplate().delete("deletePatientExamInfo", paramMap);
	}
	public int deletePatientDiagInfo(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visitId", visitId);
		return getSqlSessionTemplate().delete("deleteDiagInfo", paramMap);
	}
	public int deletePatientDrugInfo(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientId", patientId);
		paramMap.put("visitId", visitId);
		return getSqlSessionTemplate().delete("deleteDrugInfo", paramMap);
	}
}
