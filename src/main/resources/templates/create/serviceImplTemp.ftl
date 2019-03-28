package ${BASE_PACKAGE}.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.dao.${objectName}Dao;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

/**
 * @ClassName ${objectName}
 * @Description: ${memo}
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@Service
public class ${objectName}ServiceImpl extends BaseServiceImpl<${objectName}> implements ${objectName}Service {

	@Autowired
	private ${objectName}Dao ${objectNameLower}Dao;

	@Override
	public ${objectName} save(${objectName} ${objectNameLower}) {
		return ${objectNameLower}Dao.save("${objectName}Mapper.save", ${objectNameLower});
	}

	@Override
	public ${objectName} update(${objectName} ${objectNameLower}) {
		return ${objectNameLower}Dao.update("${objectName}Mapper.update", ${objectNameLower});
	}

	@Override
	public int delete(String[] ids) {
		return ${objectNameLower}Dao.delete("${objectName}Mapper.deleteAll", ids);
	}

	@Override
	public ${objectName} findById(String id) {
		return ${objectNameLower}Dao.find(id);
	}

	@Override
	public Page<${objectName}> findPage(Pageable pageable) {
		
		int pageNumber = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		int startIndex = (pageNumber - 1) * pageSize;

		Map<String, Object> parameters = new HashMap<>();
		parameters.put("startIndex", startIndex);
		parameters.put("pageSize", pageSize);
		parameters.put(pageable.getSearchProperty(), pageable.getSearchValue());
		if(pageable.getFilter() != null){
			parameters.putAll(pageable.getFilter());
		}
		
		List<${objectName}> ${objectNameLower}s = ${objectNameLower}Dao.findList("${objectName}Mapper.findPage", parameters);
		if(${objectNameLower}s == null || ${objectNameLower}s.size() == 0){
			return new Page<${objectName}>(${objectNameLower}s, 0, pageable);
		}else{
			return new Page<${objectName}>(${objectNameLower}s, ${objectNameLower}Dao.count("${objectName}Mapper.count", parameters), pageable);
		}
	}
}