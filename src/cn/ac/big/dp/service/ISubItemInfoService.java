package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.util.ChartKV;

public interface ISubItemInfoService {

	public abstract List<SubItemInfo> selectSubLabItemInfoByTestNo(String testNo);
	public abstract List<SubItemInfo> selectSubExamItemInfoByTestNo(String examNo);
	public List<ChartKV> selectSameItemValue(String patientId, String visitId, String itemName);

}