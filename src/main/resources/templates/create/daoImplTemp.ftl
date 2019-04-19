package ${BASE_PACKAGE}.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ${BASE_PACKAGE}.dao.${objectName}Dao;
import ${BASE_PACKAGE}.entity.${objectName};

/**
 * @ClassName ${objectName}-${memo}
 * @Description: @TODO
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@Repository
public class ${objectName}DaoImpl extends BaseDaoImpl<${objectName}> implements ${objectName}Dao {

	@Override
	public ${objectName} find(String mapper, Map<String, Object> parameters) {
		return super.find(mapper, parameters);
	}

	@Override
	public ${objectName} find(String id) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		return super.find("${objectName}Mapper.findById", parameters);
	}
	
}