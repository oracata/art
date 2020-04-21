package com.artesyn.resource.user.mapper;

import java.util.List;


import com.artesyn.resource.user.entity.User;

public interface UserMapper {
	public User login(String loginname);
	public User getUserById(Integer uid);
	public void deleteUserById(Integer id);
	public List<User> getUsersByPage();
	public void updateUser(User user);
	public void addUser(User user);
	public User getUserByName(String loginname);
}
