package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.Drug;

public interface IDrugDao {
	public List<Drug> getAllDrugs();
	public int saveDrugInfo(List<Drug> drug);
	public List<Drug> selectDrugsIn(List<Integer> ids);
}
