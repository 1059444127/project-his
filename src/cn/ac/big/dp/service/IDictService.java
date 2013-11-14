package cn.ac.big.dp.service;

import java.util.List;


import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.SQLCondition;

public interface IDictService {

	public List<Dict> getDictByParam(String paramName, int value);
	public List<Dict> getAllDict(String status);
	public List<Dict> getAllDictByParam(String paramName, int paramValue);
	public List<String> getDictNameByParentDictId(int dictId); 
	public List<Dict> getDisplayRootDictByParams(String type);
	public List<Dict> getDictByParams(List<SQLCondition> condtion);
	public void updateDict(Dict dict);
	public List<Dict> selectSubDictByParam(String paramName, int value);
	public List<Dict> selectAllSubDict(String testType);
}
