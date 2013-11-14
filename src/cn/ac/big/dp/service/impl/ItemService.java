package cn.ac.big.dp.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IItemDao;
import cn.ac.big.dp.service.IItemService;

public class ItemService implements IItemService {
	private IItemDao itemDao;
	
	/* (non-Javadoc)
	 * @see cn.ac.big.dp.service.impl.ILabItemService#selectLabItemByIds(java.lang.String, java.lang.String)
	 */
	public List<Item> selectLabItemByIds(String patientId, String visitId){
		List<SQLCondition> condList = new ArrayList<SQLCondition>();
		SQLCondition condition = new SQLCondition("patient_id", patientId);
		condList.add(condition);
		condition = new SQLCondition("visit_id", visitId);
		condList.add(condition);
		return itemDao.selectLabItemByParams(condList);
	}
	public List<Item> selectExamItemByIds(String patientId, String visitId){
		List<SQLCondition> condList = new ArrayList<SQLCondition>();
		SQLCondition condition = new SQLCondition("patient_id", patientId);
		condList.add(condition);
		condition = new SQLCondition("visit_id", visitId);
		condList.add(condition);
		return itemDao.selectExamItemByParams(condList);
	}
	public IItemDao getItemDao() {
		return itemDao;
	}
	public void setItemDao(IItemDao itemDao) {
		this.itemDao = itemDao;
	}
	public String[] selectReferenceValue(String itemName) {
		return this.itemDao.selectReferenceValue(itemName);
	}

}
