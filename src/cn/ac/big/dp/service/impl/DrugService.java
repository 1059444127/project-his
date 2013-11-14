package cn.ac.big.dp.service.impl;

import java.util.List;

import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.dao.IDrugDao;
import cn.ac.big.dp.service.IDrugService;

public class DrugService implements IDrugService {

	private IDrugDao drugDao;
	
	public IDrugDao getDrugDao() {
		return drugDao;
	}

	public void setDrugDao(IDrugDao drugDao) {
		this.drugDao = drugDao;
	}

	public List<Drug> getDrugsIn(List<Integer> ids){
		return drugDao.selectDrugsIn(ids);
	}
	
	public List<Drug> getAllDrugs() {
		return drugDao.getAllDrugs();
	}

	public int saveDrugInfo(List<Drug> drug) {
		return drugDao.saveDrugInfo(drug);
	}

}
