package com.artesyn.resource.base.service;

import java.util.List;


public interface BaseService<T> {
	void add(T t);
	void delete(Integer id);
	void update(T t);
	T getById(Integer id);
	List<T> getAll();
}
