package cn.ac.big.dp.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;


public class DeleteNullPatinetName {
	public static void main(String[] args) throws SQLException {
		Set<String> patientSet = new HashSet<String>();
		StringBuilder sb = null;
		
		Connection conn = DBManager.getConnection();
		String sql = "select patient_id, visit_id from tb_labitem";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {
			sb = new StringBuilder();
			sb.append(rs.getString(1)).append("_").append(rs.getString(2));
			patientSet.add(sb.toString());
		}
		
		CallableStatement cstmt = conn.prepareCall("{call p_delete_null_name(?,?)}");
		
		for(String patient : patientSet) {
			System.out.println("call p:"+patient);
			cstmt.setString(1, patient.substring(0, patient.indexOf("_")));  
			cstmt.setString(2, patient.substring(patient.indexOf("_")+1));
			cstmt.execute();
		}
		
		DBManager.returnConnection(conn);
	}
}
