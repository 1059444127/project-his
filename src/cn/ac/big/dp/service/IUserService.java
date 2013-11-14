package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.User;

public interface IUserService 
{
	public List<User> getAllUsers();
	public void addUser(User user);
	public User getUser(int userId);
	public void deleteUserByUserId(int userId);
	public void updateUser(User user);

}
