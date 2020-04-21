package com.artesyn.resource.file.service.ipml;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artesyn.resource.file.entity.Document;
import com.artesyn.resource.file.mapper.DocumentMapper;
import com.artesyn.resource.file.service.DocumentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("documentService")
@Transactional(readOnly=true)
public class DocumentServiceImpl implements DocumentService{
	
	@Autowired
	private DocumentMapper documentMapper;
	@Override
	@Transactional(readOnly=false)
	public void add(Document t) {
		documentMapper.add(t);
	}

	@Override
	@Transactional(readOnly=false)
	public void delete(Integer id) {
		documentMapper.delete(id);
	}

	@Override
	@Transactional(readOnly=false)
	public void update(Document t) {
		documentMapper.update(t);		
	}

	@Override
	public Document getById(Integer id) {
		return documentMapper.getById(id);
	}

	@Override
	public List<Document> getAll() {
		return documentMapper.getAll();
	}

	@Override
	public PageInfo<Document> getAllByCondition(Integer pageNum,Document document) {
		PageHelper.startPage(pageNum, 5);
		List<Document> list = documentMapper.getAllByCondition(document);
		PageInfo<Document> pageInfo = new PageInfo<>(list, 3);
		return pageInfo;
	}

	@Override
	@Transactional(readOnly=false)
	public void updateByCondition(Document document) {
		documentMapper.updateByCondition(document);
	}

}
