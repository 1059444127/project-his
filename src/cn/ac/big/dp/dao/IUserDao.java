package cn.ac.big.dp.dao;

import java.util.List;

import cn.ac.big.dp.bean.User;

public interface IUserDao 
{
	public List<User> getAllUser();
	public User getUser(int userId);
	public void addUser(User user);
	public void deleteUserByUserId(int userId);
	public void updateUser(User user);
}
