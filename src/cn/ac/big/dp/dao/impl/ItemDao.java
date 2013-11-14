package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.IItemDao;

public class ItemDao implements IItemDao{
	
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<Item> selectLabItemByParams(List<SQLCondition> condList){
		List<Item> labItemList = new ArrayList<Item>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		labItemList = getSqlSessionTemplate().selectList("selectLabItemByParam", paramMap);
		return labItemList;
	}

	public List<Item> selectExamItemByParams(List<SQLCondition> condList) {
		List<Item> labItemList = new ArrayList<Item>();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		labItemList = getSqlSessionTemplate().selectList("selectExamItemByParam", paramMap);
		return labItemList;
	}
	public String[] selectReferenceValue(String itemName) {
		@SuppressWarnings("unchecked")
		Map<Object,Object> result = (Map<Object, Object>) getSqlSessionTemplate().selectList("selectReferenceValue", itemName).get(0);
		Object low = result.get("low");
		Object high = result.get("high");
		if(low!=null&&high!=null) {
			String lowStr = low.toString();
			String highStr = high.toString();
			if(!"0".equals(lowStr)&&!"0".equals(highStr)){
				return new String[]{lowStr, highStr};
			}
		}
		return null;
	}
	
}
