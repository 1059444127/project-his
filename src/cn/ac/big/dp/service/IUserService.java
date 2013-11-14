package cn.ac.big.dp.service;

import java.util.List;

import cn.ac.big.dp.bean.User;

public interface IUserService 
{
	public List<User> getAllUsers();
	public boolean addUser(User user);
	public User getUser(int userId);
	public boolean deleteUserByUserId(int userId);
	public boolean updateUser(User user);

}
