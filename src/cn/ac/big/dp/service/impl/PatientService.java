package cn.ac.big.dp.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.ac.big.dp.bean.DResult;
import cn.ac.big.dp.bean.Drug;
import cn.ac.big.dp.bean.Item;
import cn.ac.big.dp.bean.Patient;
import cn.ac.big.dp.bean.SubItemInfo;
import cn.ac.big.dp.bean.Visit;
import cn.ac.big.dp.dao.IPatientDao;
import cn.ac.big.dp.service.IPatientService;
import cn.ac.big.dp.test.UUID;
import cn.ac.big.dp.util.Page;
import cn.ac.big.dp.util.SystemContext;

public class PatientService implements IPatientService {

	private IPatientDao patientDao;

	public Patient selectPatientByPatientId(String patientId) {
		return patientDao.selectPatientByParam("patient_id", patientId);
	}

	public int savePatientInfo(Patient patient, Visit visit,
			List<Item> testItems, List<Item> examItems, List<DResult> diags,
			List<Drug> drug) {
		patient.setId(UUID.create());
		visit.setId(UUID.create());
		int flag1 = patientDao.savePatient(patient);
		int flag2 = patientDao.savePatientVisit(patient.getPatientId(), visit);
		int flag3 = 0;
		int flag4 = 0;
		int flag5 = 0;
		int flag6 = 0;

		preOrder(testItems, patient.getPatientId(), visit.getVisitId());
		if (testItems != null && testItems.size() > 0) {
			flag3 = patientDao.saveTestItem(testItems);
		}
		preOrder(examItems, patient.getPatientId(), visit.getVisitId());
		if (examItems != null && examItems.size() > 0) {
			flag4 = patientDao.saveExamItem(examItems);
		}
		preOrderDiag(diags, patient.getPatientId(), visit.getVisitId());
		if (diags != null && diags.size() > 0) {
			flag5 = patientDao.saveDiag(diags);
		}
		preOrderDrug(drug, patient.getPatientId(), visit.getVisitId());
		if (drug != null && drug.size() > 0) {
			flag6 = patientDao.saveDrugInfo(drug);
		}

		return flag1 + flag2 + flag3 + flag4 + flag5 + flag6;
	}

	private void preOrderDiag(List<DResult> diags, String patientId,
			String visitId) {
		Iterator<DResult> it = diags.listIterator();
		DResult result = null;
		while (it.hasNext()) {
			result = it.next();
			if (result == null || result.getSubject() == null) {
				it.remove();
			} else {
				result.setId(UUID.create());
				result.setPatient_id(patientId);
				result.setVisit_id(visitId);
			}
		}
	}

	private void preOrder(List<Item> item, String patientId, String visitId) {
		if (item != null && item.size() > 0) {
			Iterator<Item> it = item.listIterator();
			while (it.hasNext()) {
				Item i = it.next();
				String testNo = Long.toString(System.currentTimeMillis());
				if (i != null) {
					i.setPatientId(patientId);
					i.setVisitId(visitId);
					// 是否是
					if (i.getSubject().indexOf("_") != -1) {
						i.setSubject(i.getSubject().substring(0,
								i.getSubject().indexOf("_")));
					}
					i.setId(UUID.create());
					i.setTestNo(testNo);
					if (i.getSubItemList() != null
							&& i.getSubItemList().size() > 0) {
						Iterator<SubItemInfo> sit = i.getSubItemList()
								.listIterator();
						while (sit.hasNext()) {
							SubItemInfo sii = sit.next();
							if (sii != null) {
								sii.setId(UUID.create());
								sii.setExamNo(i.getTestNo());
								sii.setSubject(i.getSubject());
								SimpleDateFormat sdf = new SimpleDateFormat(
										"yyyy-MM-dd");
								sii.setResultDateTime(sdf.format(i
										.getExecuteTime()));
								sii.setExamItem(i.getSubject()
										+ sii.getReportItemName());
							} else {
								sit.remove();
							}
						}
					} else {
						it.remove();
					}
				} else {
					it.remove();
				}
			}
		}
	}

	public IPatientDao getPatientDao() {
		return patientDao;
	}

	public void setPatientDao(IPatientDao patientDao) {
		this.patientDao = patientDao;
	}

	public Map<String, Object> selectPatientPager(Patient patient) {
		int fromIndex = SystemContext.getFromIndex();
		int pageSize = SystemContext.getPageSize();
		int totalCount = SystemContext.getTotalCount();
		if (totalCount == -1) {
			totalCount = this.patientDao.selectPatientCount(patient);
		}
		List<Patient> patList = this.patientDao.selectPatientPager(patient,
				fromIndex, pageSize);
		Page page = new Page(totalCount, fromIndex / pageSize + 1, pageSize);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("page", page);
		resultMap.put("patList", patList);
		return resultMap;
	}

	public Map<String, Object> selectVisitPager(Visit visit) {
		int fromIndex = SystemContext.getFromIndex();
		int pageSize = SystemContext.getPageSize();
		int totalCount = SystemContext.getTotalCount();
		if (totalCount == -1) {
			totalCount = this.patientDao.selectVisitCount(visit);
		}
		List<Visit> visitList = this.patientDao.selectVisitPager(visit,
				fromIndex, pageSize);
		Page page = new Page(totalCount, fromIndex / pageSize + 1, pageSize);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("page", page);
		resultMap.put("visitList", visitList);
		return resultMap;
	}

	public List<String> selectAllPatientName() {
		return this.patientDao.selectAllPatientName();
	}

	public int savePatientBasicInfo(Patient patient) {
		patient.setId(UUID.create());
		int flag = this.patientDao.savePatient(patient);
		return flag;
	}

	public int savePatientVisitInfo(Patient patient, Visit visit) {
		visit.setId(UUID.create());
		int flag = patientDao.savePatientVisit(patient.getPatientId(), visit);
		return flag;
	}

	public int savePatientTED(Patient patient, Visit visit,
			List<Item> testItems, List<Item> examItems, List<DResult> diags,
			List<Drug> drugs) {
		int flag3 = 0;
		int flag4 = 0;
		int flag5 = 0;
		int flag6 = 0;
		preOrder(testItems, patient.getPatientId(), visit.getVisitId());
		if (testItems != null && testItems.size() > 0) {
			flag3 = patientDao.saveTestItem(testItems);
		}
		preOrder(examItems, patient.getPatientId(), visit.getVisitId());
		if (examItems != null && examItems.size() > 0) {
			flag4 = patientDao.saveExamItem(examItems);
		}
		preOrderDiag(diags, patient.getPatientId(), visit.getVisitId());
		if (diags != null && diags.size() > 0) {
			flag5 = patientDao.saveDiag(diags);
		}
		preOrderDrug(drugs, patient.getPatientId(), visit.getVisitId());
		if (drugs != null && drugs.size() > 0) {
			flag6 = patientDao.saveDrugInfo(drugs);
		}
		return flag3 + flag4 + flag5 + flag6;
	}

	private void preOrderDrug(List<Drug> drugs, String patientId, String visitId) {
		for (Drug drug : drugs) {
			drug.setId(UUID.create());
			drug.setPatientid(patientId);
			drug.setVisitid(visitId);
		}
	}

	public List<Visit> selectVisitByPatientId(String patientId) {
		return patientDao.selectVisitByParam("patient_id", patientId);
	}

	public int deletePatient(String patientId, String visitId) {
		int flag0 = patientDao.deletePatientInfo(patientId);
		int flag1 = patientDao.deletePatientVisitInfo(patientId, visitId);
		int flag2 = patientDao.deletePatientTestInfo(patientId, visitId);
		int flag3 = patientDao.deletePatientExamInfo(patientId, visitId);
		int flag4 = patientDao.deletePatientDiagInfo(patientId, visitId);
		int flag5 = patientDao.deletePatientDrugInfo(patientId, visitId);
		return flag0 + flag1 + flag2 + flag3 + flag4 + flag5;
	}

}
