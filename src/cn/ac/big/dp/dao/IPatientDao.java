package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.Visit;

public interface IPatientDao {

	public abstract Patient selectPatientByParam(String paramName, Object paramValue);
	public abstract int savePatient(Patient patient);
	public abstract int savePatientVisit(String patientId, Visit visit);
	public abstract int saveTestItem(List<Item> testItems);
	public abstract int saveExamItem(List<Item> examItems);
	public abstract int saveDiag(List<DResult> diags);
	public int saveDrugInfo(List<Drug> drug);
	public Integer selectPatientCount(Patient patient);
	public List<Patient> selectPatientPager(Patient patient, int fromIndex, int pageSize);
	public Integer selectVisitCount(Visit visit);
	public List<Visit> selectVisitPager(Visit visit, int fromIndex, int pageSize);
	public List<String> selectAllPatientName();
	public List<Visit> selectVisitByParam(String paramName, Object paramValue);
	public int deletePatientInfo(String patientId);
	public int deletePatientVisitInfo(String patientId, String visitId);
	public int deletePatientTestInfo(String patientId, String visitId);
	public int deletePatientExamInfo(String patientId, String visitId);
	public int deletePatientDiagInfo(String patientId, String visitId);
	public int deletePatientDrugInfo(String patientId, String visitId);
}