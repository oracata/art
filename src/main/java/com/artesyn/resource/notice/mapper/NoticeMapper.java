package com.artesyn.resource.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artesyn.resource.base.mapper.BaseMapper;
import com.artesyn.resource.notice.entity.Notice;

public interface NoticeMapper extends BaseMapper<Notice>{
	List<Notice> getByCondition(Notice notice);
	void batchDelete(@Param("ids")String[] ids);
	void publish(Notice notice);
}
