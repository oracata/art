package com.artesyn.resource.file.service;

import com.artesyn.resource.base.service.BaseService;
import com.artesyn.resource.file.entity.Document;
import com.github.pagehelper.PageInfo;

public interface DocumentService extends BaseService<Document>{
	PageInfo<Document> getAllByCondition(Integer pageNum,Document document);
	void updateByCondition(Document document);
}
