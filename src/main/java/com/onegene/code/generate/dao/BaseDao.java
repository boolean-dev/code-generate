package com.onegene.code.generate.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

	T find(String mapper, Map<String, Object> parameters) throws Exception;

	Object findObj(String mapper, Map<String, Object> parameters) throws Exception;
	
	T save(String mapper, T entity) throws Exception;
	
	int save(String mapper, Map<String, Object> parameter) throws Exception;
	
	T update(String mapper, T entity) throws Exception;
	
	int update(String mapper, Map<String, Object> parameter) throws Exception;

	int delete(String mapper, String id) throws Exception;
	
	int delete(String mapper, String[] ids) throws Exception;

	int delete(String mapper, Map<String, Object> parameter) throws Exception;

	List<T> findList(String mapper, Map<String, Object> parameter) throws Exception;
	
	List<Object> findObjList(String mapper, Map<String, Object> parameter) throws Exception;

	Map<String, Map<String, String>> findMap(String statement, Map<String, Object> parameter, String mapper) throws Exception;

	Long count(String mapper, Map<String, Object> parameter) throws Exception;
	
	Double sum(String mapper, Map<String, Object> parameter) throws Exception;
	
	List<String> findRe(String str, List<String> list) throws Exception;
	
}
