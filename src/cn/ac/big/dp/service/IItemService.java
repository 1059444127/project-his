package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.Item;

public interface IItemService {

	public abstract List<Item> selectLabItemByIds(String patientId,String visitId);
	public List<Item> selectExamItemByIds(String patientId, String visitId);
	public String[] selectReferenceValue(String itemName);

}