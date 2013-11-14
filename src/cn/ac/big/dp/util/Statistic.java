package cn.ac.big.dp.util;

import java.sql.Connection;

import cn.ac.big.dp.test.DBManager;
import cn.ac.big.dp.test.DBUtils;

public class Statistic {
	
	private static Statistic instance = null;
	private String patientCount;
	private String visitCount;
	private String labCount;
	private String examCount;
	
	private Statistic(){
		Connection conn = DBManager.getConnection();
		String sql = "select count(*) from tb_patientinfo";
		patientCount = DBUtils.getOneColunmValue(conn, sql).toString();
		sql = "select count(*) from tb_patvisit";
		visitCount = DBUtils.getOneColunmValue(conn, sql).toString();
		sql = "select count(*) from tb_labmasterinfo";
		labCount = DBUtils.getOneColunmValue(conn, sql).toString();
		sql = "select count(*) from tb_exammasterinfo";
		examCount = DBUtils.getOneColunmValue(conn, sql).toString();
	}
	public synchronized static Statistic getInstance() {
		if(instance==null) {
			instance = new Statistic();
		}
		return instance;
	}
	public String getPatientCount() {
		return patientCount;
	}
	public void setPatientCount(String patientCount) {
		this.patientCount = patientCount;
	}
	public String getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}
	public String getLabCount() {
		return labCount;
	}
	public void setLabCount(String labCount) {
		this.labCount = labCount;
	}
	public String getExamCount() {
		return examCount;
	}
	public void setExamCount(String examCount) {
		this.examCount = examCount;
	}
}
