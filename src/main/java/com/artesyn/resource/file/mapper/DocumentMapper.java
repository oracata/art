package com.artesyn.resource.file.mapper;

import java.util.List;

import com.artesyn.resource.base.mapper.BaseMapper;
import com.artesyn.resource.file.entity.Document;

public interface DocumentMapper extends BaseMapper<Document>{
	List<Document> getAllByCondition(Document document);
	void updateByCondition(Document document);
}
