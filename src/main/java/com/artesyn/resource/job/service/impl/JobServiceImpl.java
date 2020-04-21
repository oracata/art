package com.artesyn.resource.job.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.job.entity.Job;
import com.artesyn.resource.job.mapper.JobMapper;
import com.artesyn.resource.job.service.JobService;

@Service("jobService")
@Transactional(readOnly=true)
public class JobServiceImpl implements JobService{
	
	@Autowired
	private JobMapper jobMapper;
	
	@Transactional(readOnly=false)
	@Override
	public void add(Job t) {
		jobMapper.add(t);		
	}
	
	@Transactional(readOnly=false)
	@Override
	public void delete(Integer id) {
		jobMapper.delete(id);		
	}
	@Transactional(readOnly=false)
	@Override
	public void update(Job t) {
		jobMapper.update(t);
	}

	@Override
	public Job getById(Integer id) {
		return jobMapper.getById(id);
	}

	@Override
	public List<Job> getAll() {
		return jobMapper.getAll();
	}
			
}
