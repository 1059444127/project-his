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
	public void addUser(User user)
	{
		getSqlSessionTemplate().insert("insertUser",user);
	}
	public void deleteUserByUserId(int userId)
	{
		getSqlSessionTemplate().delete("deleteUser",userId);
	}
	public void updateUser(User user) {
		getSqlSessionTemplate().update("updateUser",user);
	}
	public User getUser(int userId) {
		return (User) getSqlSessionTemplate().selectOne("selectUser", userId);
	}
}
