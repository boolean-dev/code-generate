package com.onegene.code.generate.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

	T find(String mapper, Map<String, Object> parameters);

	Object findObj(String mapper, Map<String, Object> parameters);
	
	T save(String mapper, T entity);
	
	int save(String mapper, Map<String, Object> parameter);
	
	T update(String mapper, T entity);
	
	int update(String mapper, Map<String, Object> parameter);

	int delete(String mapper, String id);
	
	int delete(String mapper, String[] ids);

	int delete(String mapper, Map<String, Object> parameter);

	List<T> findList(String mapper, Map<String, Object> parameter);
	
	List<Object> findObjList(String mapper, Map<String, Object> parameter);

	Map<String, Map<String, String>> findMap(String statement, Map<String, Object> parameter, String mapper);

	Long count(String mapper, Map<String, Object> parameter);
	
	Double sum(String mapper, Map<String, Object> parameter);
	
	List<String> findRe(String str, List<String> list);
	
}
