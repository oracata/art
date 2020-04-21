package com.artesyn.resource.employee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.constant.ResourceConstants;
import com.artesyn.resource.employee.entity.Employee;
import com.artesyn.resource.employee.mapper.EmployeeMapper;
import com.artesyn.resource.employee.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("employeeService")
@Transactional(readOnly=true)
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeMapper employeeMapper;
	
	@Transactional(readOnly=false)
	@Override
	public void add(Employee t) {
		employeeMapper.add(t);
	}
	
	@Transactional(readOnly=false)
	@Override
	public void delete(Integer id) {
		employeeMapper.delete(id);		
	}

	@Transactional(readOnly=false)
	@Override
	public void update(Employee t) {
		employeeMapper.update(t);
	}

	@Override
	public Employee getById(Integer id) {
		return employeeMapper.getById(id);
	}

	@Override
	public List<Employee> getAll() {
		return employeeMapper.getAll();
	}

	@Override
	public PageInfo<Employee> getAllByPage(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Employee> emps = employeeMapper.getAll();
		PageInfo<Employee> pageInfo=new PageInfo<>(emps, 10);
		return pageInfo;
	}

	@Override
	public void batchDelete(String[] eids) {
		employeeMapper.batchDelete(eids);
	}

	@Override
	public PageInfo<Employee> getByCondition(Employee emp) {
		PageHelper.startPage(1, ResourceConstants.PAGE_DEFAULT_SIZE);
		List<Employee> emps = employeeMapper.getByCondition(emp);
		PageInfo<Employee> pageInfo=new PageInfo<>(emps, 10);
		return pageInfo;
	}



}
