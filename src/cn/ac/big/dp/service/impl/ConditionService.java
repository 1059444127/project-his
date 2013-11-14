package cn.ac.big.dp.service.impl;

import java.util.List;

import cn.ac.big.dp.bean.Condition;
import cn.ac.big.dp.bean.GroupCondition;
import cn.ac.big.dp.bean.SearchForm;
import cn.ac.big.dp.dao.IConditionDao;
import cn.ac.big.dp.service.IConditionService;
import cn.ac.big.dp.util.CommonUtils;

public class ConditionService implements IConditionService {
	private IConditionDao conditionDao;
	
	public IConditionDao getConditionDao() {
		return conditionDao;
	}
	public void setConditionDao(IConditionDao conditionDao) {
		this.conditionDao = conditionDao;
	}
	public List<Condition> insertCondition(SearchForm searchForm, String saveName){
		List<Condition> condList = CommonUtils.revertFormToList(searchForm);
		for(Condition c : condList){
			c.setGroup(saveName);
			conditionDao.insertCondition(c);
		}
		return condList;
	}
	public List<Condition> selectCondByGroupId(String groupId){
		return conditionDao.selectCondByParam("group_id", groupId);
	}
	
	public void deleteCondition(String conId){
		conditionDao.deleteCondition(conId);
	}
	public List<GroupCondition> selectAllCondition(){
		return conditionDao.selectAllCondition();
	}
}	
