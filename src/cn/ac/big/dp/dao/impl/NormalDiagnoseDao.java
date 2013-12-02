package cn.ac.big.dp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.NormalDiagnose;
import cn.ac.big.dp.bean.SQLCondition;
import cn.ac.big.dp.dao.INormalDiagnoseDao;

public class NormalDiagnoseDao implements INormalDiagnoseDao {
	
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public NormalDiagnose findOneByParams(List<SQLCondition> condList) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("list", condList);
		return this.sessionTemplate.selectOne("selectNormalDiagnose", paramMap);
	}

	public void addNormalDiagnose(NormalDiagnose diagnose) {
		this.sessionTemplate.insert("insertNormalDiagnose", diagnose);
	}

	public void removeNormalDiagnose(String id) {
		this.sessionTemplate.delete("deleteNormalDiagnose", id);
	}

}
