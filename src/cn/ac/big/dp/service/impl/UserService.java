package cn.ac.big.dp.service.impl;

import java.util.List;

import cn.ac.big.dp.bean.User;
import cn.ac.big.dp.dao.IUserDao;
import cn.ac.big.dp.service.IUserService;

public class UserService implements IUserService
{
	private IUserDao userDao;
	
	public List<User> getAllUsers()
	{
		return this.userDao.getAllUser();
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public boolean addUser(User user) {
		return this.userDao.addUser(user);
	}

	public User getUser(int userId) {
		return this.userDao.getUser(userId);
	}

	public boolean deleteUserByUserId(int userId) {
		return this.userDao.deleteUserByUserId(userId);
	}

	public boolean updateUser(User user) {
		return this.userDao.updateUser(user);
	}
	

}
