package com.artesyn.resource.base.mapper;

import java.util.List;

public interface BaseMapper<T> {
	void add(T t);
	void delete(Integer id);
	void update(T t);
	T getById(Integer id);
	List<T> getAll();
}
