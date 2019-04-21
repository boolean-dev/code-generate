package com.onegene.code.generate.service;

import java.util.List;
import java.util.Map;

/**
 * Service - 基类
 */
public interface BaseService<T> {

	public T find(String mapper, Map<String, Object> parameters);

	public T save(String mapper, T entity);

	public T update(String mapper, T entity);

	public int update(String mapper, Map<String, Object> parameter);

	public int delete(String mapper, String id);

	public int delete(String[] ids);

	public int delete(String mapper, Map<String, Object> parameter);

	public List<T> findList(String mapper, Map<String, Object> parameter);

	public Long count(String mapper, Map<String, Object> parameter);

}