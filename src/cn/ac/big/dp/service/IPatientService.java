package cn.ac.big.dp.service;

import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.Visit;

public interface IPatientService {

	public abstract Patient selectPatientByPatientId(String patientId);
	public int savePatientInfo(Patient patient, Visit visit, List<Item> testItems, List<Item> examItems, List<DResult> diags, List<Drug> drugItem);
	public int savePatientBasicInfo(Patient patient);
	public int savePatientVisitInfo(Patient patient, Visit visit);
	public int savePatientTED(Patient patient, Visit visit, List<Item> testItems, List<Item> examItems, List<DResult> diags, List<Drug> drugs);
	public Map<String, Object> selectPatientPager(Patient patient);
	public Map<String, Object> selectVisitPager(Visit visit);
	public List<String> selectAllPatientName();
	public List<Visit> selectVisitByPatientId(String patientId);
	public int deletePatient(String patientId, String visitId);
	public int deleteDiagnose(String id);
}