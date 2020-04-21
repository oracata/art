package com.artesyn.resource.employee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artesyn.resource.base.mapper.BaseMapper;
import com.artesyn.resource.employee.entity.Employee;

public interface EmployeeMapper extends BaseMapper<Employee>{

	void batchDelete(@Param("eids")String[] eids);

	List<Employee> getByCondition(Employee emp);

}
