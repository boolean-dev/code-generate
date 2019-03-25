
package ${BASE_PACKAGE}.dao;

import ${BASE_PACKAGE}.entity.${objectName};


/**
 * @ClassName ${objectName}-${memo}
 * @Description: @TODO
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
public interface ${objectName}Dao extends BaseDao<${objectName}> {

	/**
	 * 根据id查找${memo}
	 * 
	 * @param id ${memo}id
	 * @return 若不存在则返回null
	 * @throws Exception 
	 */
	${objectName} find(String id) throws Exception;

}