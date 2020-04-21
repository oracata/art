package com.artesyn.resource.user.service;


import com.artesyn.resource.user.entity.User;
import com.github.pagehelper.PageInfo;

public interface UserService {
	public boolean login(String loginname,String password);
	public User getUserById(Integer id);
	public void deleteUserById(Integer id);
	public PageInfo<User> getUsersByPage(Integer pageNum,Integer pageSize);
	public void updateUser(User user);
	public void addUser(User user);
	public boolean checkName(String loginname);
	public User getUserByLoginName(String loginname);
}
