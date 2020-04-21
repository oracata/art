package com.artesyn.resource.notice.service;


import com.artesyn.resource.base.service.BaseService;
import com.artesyn.resource.notice.entity.Notice;
import com.github.pagehelper.PageInfo;

public interface NoticeService extends BaseService<Notice>{
	 PageInfo<Notice> getByCondition(Integer pageNum,Notice notice);
	void batchDelete(String[] ids);
	void publish(Notice notice);
}
