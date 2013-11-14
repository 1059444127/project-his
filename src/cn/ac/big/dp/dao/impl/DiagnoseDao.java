package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.bean.DiagnoseResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IDiagnoseDao;

public class DiagnoseDao implements IDiagnoseDao {
	
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<Diagnose> selectLabItemByParams(List<SQLCondition> condList) {
		List<Diagnose> diagList = new ArrayList<Diagnose>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		diagList = getSqlSessionTemplate().selectList("selectDiagnoseByParams", paramMap);
		return diagList;
	}

	public DiagnoseResult selectDiagnoseResultByParams(String patientid, String visitid) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientid", patientid);
		paramMap.put("visitid", visitid);
		return (DiagnoseResult) getSqlSessionTemplate().selectOne("selectDiagnoseResultByParams", paramMap);
	}

	public List<Drug> selectDrugsByParams(String patientId, String visitId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("patientid", patientId);
		paramMap.put("visitid", visitId);
		return getSqlSessionTemplate().selectList("selectDrugsByPvid", paramMap);
	}
	public Integer selectDiagItemCount(DiagItemDTO diagItem) {
		return this.sessionTemplate.selectOne("selectCountDiagItemByParam", diagItem);
	}
	public List<DiagItemDTO> selectDiagItemPager(DiagItemDTO diagItem, int fromIndex, int pageSize) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("fromIndex", fromIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("diagItem", diagItem);
		return this.sessionTemplate.selectList("selectDiagItemByParam", paramMap);
	}
	public List<String> selectAllDiagName() {
		return this.sessionTemplate.selectList("selectDiagName");
	}
	public Map<String,DiagCountDTO> selectAllDiagNameCount(List<String> diagNames) {
		return this.sessionTemplate.selectMap("selectDiagNameCount", diagNames, "name");
	}
	public Map<String,DiagCountDTO> selectSubDiagNameCount(String subject) {
		return this.sessionTemplate.selectMap("selectSubDiagNameCount", subject, "name");
	}
	public List<DiagCountDTO> selectMyDiagNameCount(List<String> diagNames, String SQLCondition) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("list", diagNames);
		params.put("condition", SQLCondition);
		return this.sessionTemplate.selectList("selectMyDiagNameCount", params);
	}
	public List<String> selectPatientDiagByPVId(String patientId, String visitId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("patientId", patientId);
		params.put("visitId", visitId);
		return this.sessionTemplate.selectList("selectPatientDiag", params);
	}
	public List<DiagCountDTO> selectDiagCountByCondition(String subject, String category) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("subject", subject);
		params.put("condition", category);
		return this.sessionTemplate.selectList("selectDiagCountByCondition", params);
	}
	public Object selectPropertyByParam(String propName, Object propValue, String needField) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("propName", propName);
		params.put("needField", needField);
		params.put("propValue", propValue);
		return this.sessionTemplate.selectOne("selectPropertyByParam", params);
	}

}
