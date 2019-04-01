package ${BASE_PACKAGE}.service;

import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
public interface ${objectName}Service extends BaseService<${objectName}> {

    /**
	 * 通过id查找
	 * @param id	id
	 * @return	${objectNameLower}
	 */
	${objectName} findById(String id);

    /**
	 * 分页查找
	 * @param pageable	id
	 * @return	the page of ${objectNameLower}
	 */
	Page<${objectName}> findPage(Pageable pageable);

    /**
	 * 保存
	 * @param ${objectNameLower}	${objectNameLower}
	 * @return	${objectNameLower}
	 */
	${objectName} save(${objectName} ${objectNameLower});

    /**
	 * 更新
     * @param ${objectNameLower}	${objectNameLower}
	 * @return	${objectNameLower}
	 */
	${objectName} update(${objectName} ${objectNameLower});
	
}