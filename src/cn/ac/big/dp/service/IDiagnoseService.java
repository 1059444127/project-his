package cn.ac.big.dp.service;

import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.DiagCountDTO;
import cn.ac.big.dp.bean.DiagItemDTO;
import cn.ac.big.dp.bean.Diagnose;
import cn.ac.big.dp.bean.DiagnoseResult;
import cn.ac.big.dp.bean.Drug;

public interface IDiagnoseService {
	public List<Diagnose> selectDiagByParams(String patientId, String visitId);
	public DiagnoseResult selectDiagnoseResultByParams(String patientId, String visitId);
	public List<Drug> selectDrugsByParams(String patientId, String visitId);
	public Map<String, Object> selectDiagItemPager(DiagItemDTO diagItem);
	public List<String> selectAllDiagName();
	public Map<String,DiagCountDTO> selectAllDiagNameCount(List<String> diagNames);
	public Map<String, List<DiagCountDTO>> selectMyDiagNameCount(List<String> diagNames, String category);
	public Map<String,DiagCountDTO> selectSubDiagNameCount(String subject);
	public List<String> selectPatientDiagByPVId(String patientId, String visitId);
	public List<DiagCountDTO> selectDiagCountByCondition(String subject, String category);
	public Object selectPropertyByParam(String propName, Object propValue, String needField);
	public int updateDiagnose(DResult diagnose);
}
