package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.SQLCondition;

public interface IItemDao {
	public List<Item> selectLabItemByParams(List<SQLCondition> condList);
	public List<Item> selectExamItemByParams(List<SQLCondition> condList);
	public String[] selectReferenceValue(String itemName);
}