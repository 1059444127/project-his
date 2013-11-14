package cn.ac.big.dp.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IDictDao;
import cn.ac.big.dp.service.IDictService;

public class DictService implements IDictService {
	
	private IDictDao dictDao;
	public List<Dict> getDictByParam(String paramName, int value) {
		return dictDao.getDictByParam(paramName, value);
	}
	public List<Dict> getAllDict(String status) {
		return dictDao.getAllDict(status);
	}
	public List<Dict> getAllDictByParam(String paramName, int paramValue) {
		return dictDao.getAllDictByParam(paramName, paramValue);
	}
	public void updateDict(Dict dict){
		dictDao.updateDict(dict);
	}
	public IDictDao getDictDao() {
		return dictDao;
	}
	public void setDictDao(IDictDao dictDao) {
		this.dictDao = dictDao;
	}
	public List<Dict> selectSubDictByParam(String paramName, int value) {
		return dictDao.selectSubDictByParam(paramName, value);
	}
	public List<Dict> selectAllSubDict(String testType) {
		return dictDao.getAllSubDict(testType);
	}
	public List<Dict> getDisplayRootDictByParams(String type) {
		List<SQLCondition> condition = new ArrayList<SQLCondition>();
		condition.add(new SQLCondition("exam_lab_flag", type));
		condition.add(new SQLCondition("dict_parent_id",0));
		return dictDao.selectDictByParams(condition);
	}
	public List<String> getDictNameByParentDictId(int dictId) {
		return dictDao.getDictNameByParam("dict_parent_id", dictId);
	}
	public List<Dict> getDictByParams(List<SQLCondition> condition) {
		return dictDao.selectDictByParams(condition);
	}

}
