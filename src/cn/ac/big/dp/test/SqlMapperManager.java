package cn.ac.big.dp.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class SqlMapperManager
{
	private static SqlSessionFactory factory = null;
	private static String fileName = "cn/ac/big/dp/test/test-config.xml";
	private SqlMapperManager(){}
	
	public static void initMapper(String sqlMapperFileName)
	{
		fileName = sqlMapperFileName;
	}
	public static SqlSessionFactory getFactory()
	{
		try
		{
			if (factory == null)
			{
				Reader reader = Resources.getResourceAsReader(fileName);
				SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
				factory = builder.build(reader);
				builder = null;
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
			return null;
		}
		return factory;
	}
}