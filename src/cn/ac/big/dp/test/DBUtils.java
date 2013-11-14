package cn.ac.big.dp.test;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class DBUtils {
	
	public static Object getOneColunmValue(Connection conn, String sql) {
		Object value = null;
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				value = rs.getObject(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return value;
	}
	public static boolean insertObject(Connection conn, String sql, Object[] strings) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i=1; i<=strings.length; i++) {
				System.out.println(strings[i-1]);
				pstmt.setString(i, (String) strings[i-1]);
			}
			return pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void executeRawSql(Connection conn, String sql) {
		Statement stmt;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static List<String> getOneColumnList(Connection conn, String sql, String columnName) {
		List<String> columnList = new ArrayList<String>();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String columnValue = rs.getString(columnName);
				columnList.add(columnValue);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return columnList;
	}
	public static <T> List<T> getAllObjectList(Connection conn, String sql, Class<T> clazz) {
		Statement stmt;
		List<T> resultList = new ArrayList<T>();
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			int i = rs.getMetaData().getColumnCount();
			Object value = null;
			while(rs.next()) {
				T t = clazz.newInstance();
				for(int x=1; x<=i; x++) {
					String colName = rs.getMetaData().getColumnName(x);
					if(x==1) {
						value = rs.getInt(x);
					} else {
						value = rs.getString(x);
					}
					PropertyDescriptor pd = new PropertyDescriptor(colName, clazz);
					Method method = pd.getWriteMethod();
					try {
						method.invoke(t, value);
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
				}
				resultList.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
}
