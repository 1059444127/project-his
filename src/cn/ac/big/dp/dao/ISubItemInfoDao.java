package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.util.ChartKV;

public interface ISubItemInfoDao {

	public abstract List<SubItemInfo> selectSubLabItemInfoByParam(
			String paramName, Object paramValue);
	public abstract List<SubItemInfo> selectSubExamItemInfoByParam(
			String paramName, Object paramValue);
	public List<ChartKV> selectSameItemValue(List<SQLCondition> condList);

}