package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.User;

public interface IUserDao 
{
	public List<User> getAllUser();
	public User getUser(int userId);
	public boolean addUser(User user);
	public boolean deleteUserByUserId(int userId);
	public boolean updateUser(User user);
}
