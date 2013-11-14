package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.Drug;

public interface IDrugService {
	public List<Drug> getAllDrugs();
	public int saveDrugInfo(List<Drug> drug);
}
