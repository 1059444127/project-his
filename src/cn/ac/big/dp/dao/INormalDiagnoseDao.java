package cn.ac.big.dp.dao;

import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.NormalDiagnose;
import cn.ac.big.dp.bean.SQLCondition;

public interface INormalDiagnoseDao {
	public NormalDiagnose findOneByParams(List<SQLCondition> condList);
	public void addNormalDiagnose(NormalDiagnose diagnose);
	public void removeNormalDiagnose(String patientId);
}
