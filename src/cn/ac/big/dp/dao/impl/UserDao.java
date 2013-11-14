package cn.ac.big.dp.dao.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import cn.ac.big.dp.bean.User;
import cn.ac.big.dp.dao.IUserDao;

public class UserDao implements IUserDao{
	private SqlSessionTemplate sessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate(){
		return this.sessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sessionTemplate = sqlSessionTemplate;
	}
	public List<User> getAllUser()
	{
		return getSqlSessionTemplate().selectList("selectAllUser");
	}
	
	public boolean addUser(User user)
	{
		try
		{
			getSqlSessionTemplate().insert("insertUser",user);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
	}
	public boolean deleteUserByUserId(int userId)
	{
		try{
			getSqlSessionTemplate().delete("deleteUser",userId);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public boolean updateUser(User user) {
		try{
			getSqlSessionTemplate().update("updateUser",user);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public User getUser(int userId) {
		return (User) getSqlSessionTemplate().selectOne("selectUser", userId);
	}
}
