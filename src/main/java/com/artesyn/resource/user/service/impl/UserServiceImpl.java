package com.artesyn.resource.user.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.user.entity.User;
import com.artesyn.resource.user.mapper.UserMapper;
import com.artesyn.resource.user.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Transactional(readOnly=true)
@Service("userService")
public class UserServiceImpl implements UserService{
	@SuppressWarnings("unused")
	private static final Logger logger=Logger.getLogger(UserServiceImpl.class);
	@Autowired
	private UserMapper userMapper;
	@Override
	public boolean login(String loginname, String password) {
		boolean flag=false;
		User user = userMapper.login(loginname);
		if(user!=null&&user.getPassword().equals(password)){
			flag=true;
		}
		return flag;
	}

	@Override
	public User getUserById(Integer id) {
		return userMapper.getUserById(id);
	}
	
	@Transactional(readOnly=false)
	@Override
	public void deleteUserById(Integer id) {
		userMapper.deleteUserById(id);
	}

	@Override
	public PageInfo<User> getUsersByPage(Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<User> users = userMapper.getUsersByPage();
		PageInfo<User> pageInfo = new PageInfo<>(users, 10);
		return pageInfo;
	}
	@Transactional(readOnly=false)
	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	@Transactional(readOnly=false)
	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}
	
	@Override
	public boolean checkName(String loginname) {
		User user=userMapper.getUserByName(loginname);
		boolean flag=false;
		if(user==null||user.getStatus()==1){
			flag=true;
		}
		return flag;
	}

	@Override
	public User getUserByLoginName(String loginname) {
		return userMapper.getUserByName(loginname);
	}

}
