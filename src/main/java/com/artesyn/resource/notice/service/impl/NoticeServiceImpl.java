package com.artesyn.resource.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.constant.ResourceConstants;
import com.artesyn.resource.notice.entity.Notice;
import com.artesyn.resource.notice.mapper.NoticeMapper;
import com.artesyn.resource.notice.service.NoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("noticeService")
@Transactional(readOnly=true)
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper noticeMapper;
	@Override
	@Transactional(readOnly=false)
	public void add(Notice t) {
		noticeMapper.add(t);
	}

	@Override
	@Transactional(readOnly=false)
	public void delete(Integer id) {
		noticeMapper.delete(id);
	}

	@Override
	@Transactional(readOnly=false)
	public void update(Notice t) {
		noticeMapper.update(t);		
	}

	@Override
	public Notice getById(Integer id) {
		return noticeMapper.getById(id);
	}

	@Override
	public List<Notice> getAll() {
		return noticeMapper.getAll();
	}

	@Override
	public PageInfo<Notice> getByCondition(Integer pageNum,Notice notice) {
		PageHelper.startPage(pageNum, ResourceConstants.PAGE_DEFAULT_SIZE);
		List<Notice> list = noticeMapper.getByCondition(notice);
		PageInfo<Notice> pageInfo=new PageInfo<>(list, 10);
		return pageInfo;
	}

	@Override
	@Transactional(readOnly=false)
	public void batchDelete(String[] ids) {
		noticeMapper.batchDelete(ids);
	}

	@Override
	@Transactional(readOnly=false)
	public void publish(Notice notice) {
		noticeMapper.publish(notice);
	}

}
