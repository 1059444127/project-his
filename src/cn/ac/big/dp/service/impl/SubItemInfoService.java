package cn.ac.big.dp.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.dao.ISubItemInfoDao;
import cn.ac.big.dp.service.ISubItemInfoService;
import cn.ac.big.dp.util.ChartKV;

public class SubItemInfoService implements ISubItemInfoService {
	private ISubItemInfoDao subItemInfoDao;
	
	/* (non-Javadoc)
	 * @see cn.ac.big.dp.service.impl.ISubLabItemInfoService#selectSubLabItemInfoByTestNo(java.lang.String)
	 */
	public List<SubItemInfo> selectSubLabItemInfoByTestNo(String testNo){
		return subItemInfoDao.selectSubLabItemInfoByParam("test_no", testNo);
	}
	public List<SubItemInfo> selectSubExamItemInfoByTestNo(String examNo) {
		return subItemInfoDao.selectSubExamItemInfoByParam("exam_no", examNo);
	}
	public List<ChartKV> selectSameItemValue(String patientId, String visitId, String itemName){
		List<SQLCondition> condList = new ArrayList<SQLCondition>();
		SQLCondition condition = new SQLCondition("patient_id", patientId);
		condList.add(condition);
		condition = new SQLCondition("visit_id", visitId);
		condList.add(condition);
		condition = new SQLCondition("report_item_name", itemName);
		condList.add(condition);
		return subItemInfoDao.selectSameItemValue(condList);
	}
	public ISubItemInfoDao getSubItemInfoDao() {
		return subItemInfoDao;
	}
	public void setSubItemInfoDao(ISubItemInfoDao subItemInfoDao) {
		this.subItemInfoDao = subItemInfoDao;
	}
	
	
}
