package cn.ac.big.dp.test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;

public class InsertTable {
	
	public static void main(String[] args) throws IOException {
		
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("d:/diagnosisinfo.sql")));
		String line = null;
		Connection conn = DBManager.getConnection();
		while((line = bufferedReader.readLine())!=null) {
			String sql = line.substring(line.indexOf("insert"));
			DBUtils.executeRawSql(conn, sql);
		}
		DBManager.returnConnection(conn);
	}
	
}
