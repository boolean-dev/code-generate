package com.onegene.code.generate.service.impl;

import com.onegene.code.generate.dao.BaseDao;
import com.onegene.code.generate.service.BaseService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Service - 基类
 */
@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	/** 更新忽略属性 */
	//private static final String[] UPDATE_IGNORE_PROPERTIES = new String[] { BaseEntity.ID_PROPERTY_NAME, BaseEntity.CREATE_DATE_PROPERTY_NAME, BaseEntity.MODIFY_DATE_PROPERTY_NAME };

	/** baseDao */
	private BaseDao<T> baseDao;

	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	@Transactional
	public T save(String mapper, T entity) {
		return baseDao.save(mapper, entity);
	}

	@Override
	@Transactional
	public T update(String mapper, T entity) {
		return baseDao.update(mapper, entity);
	}
	
	@Override
	@Transactional
	public int delete(String mapper, String id) {
		return baseDao.delete(mapper, id);
	}

	@Override
	@Transactional
	public T find(String mapper, Map<String, Object> parameters) {
		return baseDao.find(mapper, parameters);
	}

	@Override
	@Transactional
	public int update(String mapper, Map<String, Object> parameter) {
		return baseDao.update(mapper, parameter);
	}

	@Transactional
	public int delete(String mapper, String[] ids) {
		return baseDao.delete(mapper, ids);
	}

	@Override
	@Transactional
	public int delete(String mapper, Map<String, Object> parameter) {
		return baseDao.delete(mapper, parameter);
	}

	@Override
	public List<T> findList(String mapper, Map<String, Object> parameter) {
		return baseDao.findList(mapper, parameter);
	}
	
	@Override
	public Long count(String mapper, Map<String, Object> parameter) {
		return baseDao.count(mapper, parameter);
	}

}