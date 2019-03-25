package com.onegene.code.generate.service.impl;


import com.onegene.code.generate.dao.CreateCodeDao;
import com.onegene.code.generate.entity.CreateItem;
import com.onegene.code.generate.service.CreateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CreateCodeServiceImpl extends BaseServiceImpl<CreateItem> implements CreateCodeService {

	@Autowired
	private CreateCodeDao createCodeDao;

	@Override
	public int delete(String[] ids) throws Exception {
		return 0;
	}

	@Override
	public List<CreateItem> findColum(Map<String, Object> parameter) throws Exception {
		return createCodeDao.findList("CreateCodeMapper.findColumn", parameter);
	}

	

}
