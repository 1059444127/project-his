package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.Dict;
import cn.ac.big.dp.bean.SQLCondition;

public interface IDictDao {
	
	public List<Dict> getDictByParam(String paramName, int value);
	public List<Dict> getAllDict(String status);
	public List<Dict> getAllDictByParam(String paramName, Object paramValue);
	public List<String> getDictNameByParam(String paramName, Object paramValue);
	public List<Dict> selectDictByParams(List<SQLCondition> condList);
	public void updateDict(Dict dict);
	public List<Dict> selectSubDictByParam(String paramName, int value);
	public List<Dict> getAllSubDict(String testType);
}
