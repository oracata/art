package com.artesyn.resource.dept.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.dept.entity.Dept;
import com.artesyn.resource.dept.mapper.DeptMapper;
import com.artesyn.resource.dept.service.DeptService;

@Service("deptService")
@Transactional(readOnly=true)
public class DeptServiceImpl implements DeptService{

	@Autowired
	private DeptMapper deptMapper;
	
	@Transactional(readOnly=false)
	@Override
	public void add(Dept t) {
		deptMapper.add(t);
	}
	@Transactional(readOnly=false)
	@Override
	public void delete(Integer id) {
		deptMapper.delete(id);
	}
	@Transactional(readOnly=false)
	@Override
	public void update(Dept t) {
		deptMapper.update(t);
	}

	@Override
	public Dept getById(Integer id) {
		return deptMapper.getById(id);
	}

	@Override
	public List<Dept> getAll() {
		return deptMapper.getAll();
	}

}
