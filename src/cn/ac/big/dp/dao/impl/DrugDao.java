package cn.ac.big.dp.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.dao.IDrugDao;

public class DrugDao implements IDrugDao {
	
	private SqlSessionTemplate sessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<Drug> getAllDrugs() {
		List<Drug> drugList = new ArrayList<Drug>();
		drugList = this.sessionTemplate.selectList("selectAllDrugs");
		return drugList;
	}
	public int saveDrugInfo(List<Drug> drug) {
		return this.sessionTemplate.insert("saveDrugInfo", drug);
	}
	public List<Drug> selectDrugsIn(List<Integer> ids) {
		return this.sessionTemplate.selectList("selectDrugsInIds", ids);
	}

}
