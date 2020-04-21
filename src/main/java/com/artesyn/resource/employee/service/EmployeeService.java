package com.artesyn.resource.employee.service;


import com.artesyn.resource.base.service.BaseService;
import com.artesyn.resource.employee.entity.Employee;
import com.github.pagehelper.PageInfo;

public interface EmployeeService extends BaseService<Employee>{
	PageInfo<Employee> getAllByPage(Integer pageNum,Integer pageSize);
	void batchDelete(String[] eids);
	PageInfo<Employee> getByCondition(Employee emp);
}
