package cn.ac.big.dp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.bean.DiagnoseResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IDiagnoseDao;
import cn.ac.big.dp.service.IDiagnoseService;
import cn.ac.big.dp.util.Page;
import cn.ac.big.dp.util.SystemContext;

public class DiagnoseService implements IDiagnoseService {

	private IDiagnoseDao diagnoseDao;
	
	public List<Diagnose> selectDiagByParams(String patientId, String visitId) {
		List<SQLCondition> condList = new ArrayList<SQLCondition>();
		condList.add(new SQLCondition("patientid", patientId));
		condList.add(new SQLCondition("visitid", visitId));
		return diagnoseDao.selectLabItemByParams(condList);
	}

	public IDiagnoseDao getDiagnoseDao() {
		return diagnoseDao;
	}

	public void setDiagnoseDao(IDiagnoseDao diagnoseDao) {
		this.diagnoseDao = diagnoseDao;
	}

	public DiagnoseResult selectDiagnoseResultByParams(String patientId,String visitId) {
		return diagnoseDao.selectDiagnoseResultByParams(patientId, visitId);
	}

	public List<Drug> selectDrugsByParams(String patientId, String visitId) {
		return this.diagnoseDao.selectDrugsByParams(patientId, visitId);
	}

	public Map<String, Object> selectDiagItemPager(DiagItemDTO diagItem) {
		int fromIndex = SystemContext.getFromIndex();
		int pageSize = SystemContext.getPageSize();
		int totalCount = SystemContext.getTotalCount();
		if(totalCount==-1){
			totalCount = this.diagnoseDao.selectDiagItemCount(diagItem);
		} 
		List<DiagItemDTO> diagItemList = this.diagnoseDao.selectDiagItemPager(diagItem, fromIndex, pageSize);
		Page page = new Page(totalCount,fromIndex/pageSize+1, pageSize);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("page", page);
		resultMap.put("diagItemList", diagItemList);
		return resultMap;
	}

	public List<String> selectAllDiagName() {
		return this.diagnoseDao.selectAllDiagName();
	}

	public Map<String, DiagCountDTO> selectAllDiagNameCount(List<String> diagNames) {
		return this.diagnoseDao.selectAllDiagNameCount(diagNames);
	}

	public Map<String, DiagCountDTO> selectSubDiagNameCount(String subject) {
		return this.diagnoseDao.selectSubDiagNameCount(subject);
	}

	public Map<String, List<DiagCountDTO>> selectMyDiagNameCount(List<String> diagNames, String category) {
		List<DiagCountDTO> diagResultList =  this.diagnoseDao.selectMyDiagNameCount(diagNames, category);
		if("sex".equals(category)) {
			return divideSexIntoCate(diagResultList);
		} else if("treat_result".equals(category)) {
			return divedeTrIntoCate(diagResultList);
		} else if("xy".equals(category)){
			return divideXyIntoCate(diagResultList);
		} else if("yj".equals(category)) {
			return divideYjIntoCate(diagResultList);
		} else {
			return null;
		}
	}


	private Map<String, List<DiagCountDTO>> divideYjIntoCate( List<DiagCountDTO> diagResultList) {
		Map<String, List<DiagCountDTO>> divideMap = new LinkedHashMap<String, List<DiagCountDTO>>();
		divideMap.put("饮酒", new ArrayList<DiagCountDTO>());
		divideMap.put("不饮酒", new ArrayList<DiagCountDTO>());
		for(DiagCountDTO dcd : diagResultList) {
			if(divideMap.containsKey(dcd.getName())) {
				divideMap.get(dcd.getName()).add(dcd);
			}
		}
		return divideMap;
	}

	private Map<String, List<DiagCountDTO>> divideXyIntoCate( List<DiagCountDTO> diagResultList) {
		Map<String, List<DiagCountDTO>> divideMap = new LinkedHashMap<String, List<DiagCountDTO>>();
		divideMap.put("吸烟", new ArrayList<DiagCountDTO>());
		divideMap.put("不吸烟", new ArrayList<DiagCountDTO>());
		for(DiagCountDTO dcd : diagResultList) {
			if(divideMap.containsKey(dcd.getName())) {
				divideMap.get(dcd.getName()).add(dcd);
			}
		}
		return divideMap;
	}

	private Map<String, List<DiagCountDTO>> divedeTrIntoCate(List<DiagCountDTO> diagResultList) {
		Map<String, List<DiagCountDTO>> divideMap = new LinkedHashMap<String, List<DiagCountDTO>>();
		divideMap.put("好转", new ArrayList<DiagCountDTO>());
		divideMap.put("治愈", new ArrayList<DiagCountDTO>());
		divideMap.put("死亡", new ArrayList<DiagCountDTO>());
		divideMap.put("平稳", new ArrayList<DiagCountDTO>());
		for(DiagCountDTO dcd : diagResultList) {
			if(divideMap.containsKey(dcd.getName())) {
				divideMap.get(dcd.getName()).add(dcd);
			}
		}
		return divideMap;
	}

	private Map<String, List<DiagCountDTO>> divideSexIntoCate(List<DiagCountDTO> diagResultList) {
		Map<String, List<DiagCountDTO>> divideMap = new LinkedHashMap<String, List<DiagCountDTO>>();
		divideMap.put("男", new ArrayList<DiagCountDTO>());
		divideMap.put("女", new ArrayList<DiagCountDTO>());
		for(DiagCountDTO dcd : diagResultList) {
			if(divideMap.containsKey(dcd.getName())) {
				divideMap.get(dcd.getName()).add(dcd);
			}
		}
		return divideMap;
	}

	public List<String> selectPatientDiagByPVId(String patientId, String visitId) {
		return this.diagnoseDao.selectPatientDiagByPVId(patientId, visitId);
	}

	public List<DiagCountDTO> selectDiagCountByCondition(String subject, String category) {
		return this.diagnoseDao.selectDiagCountByCondition(subject, category);
	}

	public Object selectPropertyByParam(String propName, Object propValue, String needField) {
		return this.diagnoseDao.selectPropertyByParam(propName, propValue, needField);
	}

	public int updateDiagnose(DResult diagnose) {
		return this.diagnoseDao.updateDiagnose(diagnose);
	}
	

}
