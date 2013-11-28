package cn.ac.big.dp.dao;

import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.bean.DiagnoseResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.SQLCondition;


public interface IDiagnoseDao {
	public List<Diagnose> selectLabItemByParams(List<SQLCondition> condList);
	public DiagnoseResult selectDiagnoseResultByParams(String patientId, String visitId);
	public List<Drug> selectDrugsByParams(String patientId, String visitId);
	public Integer selectDiagItemCount(DiagItemDTO diagItem);
	public List<DiagItemDTO> selectDiagItemPager(DiagItemDTO diagItem, int fromIndex, int pageSize);
	public List<String> selectAllDiagName();
	public Map<String,DiagCountDTO> selectAllDiagNameCount(List<String> diagNames);
	public Map<String,DiagCountDTO> selectSubDiagNameCount(String subject);
	public List<DiagCountDTO> selectMyDiagNameCount(List<String> diagNames, String SQLCondition);
	public List<DiagCountDTO> selectDiagCountByCondition(String subject, String category);
	public List<String> selectPatientDiagByPVId(String patientId, String visitId);
	public Object selectPropertyByParam(String propName, Object propValue, String needField);
	public int updateDiagnose(DResult diagnose);
}
