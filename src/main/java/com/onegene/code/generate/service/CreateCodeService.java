package com.onegene.code.generate.service;

import com.onegene.code.generate.entity.CreateItem;

import java.util.List;
import java.util.Map;

public interface CreateCodeService extends BaseService<CreateItem> {

	List<CreateItem> findColum(Map<String, Object> parameter) throws Exception;

}
