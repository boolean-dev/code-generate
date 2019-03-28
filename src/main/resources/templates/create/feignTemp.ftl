package ${BASE_PACKAGE}.feign;

import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.message.Message;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName ${objectName}
 * @Descriiption ${memo}
 * @Author ${AUTHOR}
 * @Date ${DATE}
 **/
@Api(value = "${memo}", tags = "${memo}")
@RequestMapping("/api/${objectNameLower}")
public interface ${objectName}Feign {

	/**
	 * 添加管理员
	 * @param ${objectNameLower} 管理员
	 * @return	${objectNameLower}
	 */
	@ApiOperation(value = "添加${memo}", notes = "查询${memo}数据")
	@RequestMapping(value = "/", method = RequestMethod.POST)
	Message save(@RequestBody ${objectName} ${objectNameLower});

	/**
	* 更新${memo}
	* @param ${objectNameLower} ${memo}
	* @return	message
	*/
	@ApiOperation(value = "更新${memo}", notes = "更新${memo}数据")
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	Message update(@RequestBody ${objectName} ${objectNameLower});

	/**
	* ${memo}列表
	* @param pageable  分页
	* @return	page
	*/
	@ApiOperation(value = "${memo}列表", notes = "查看${memo}列表")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	Page<${objectName}> list(Pageable pageable);

	/**
	 * ${memo}详情
	 * @param id    ${memo}id
	 * @return	message
	 */
	@ApiOperation(value = "${memo}详情", notes = "根据id查看${memo}详情")
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	Message view(@PathVariable String id);

	/**
	 * 删除${memo}
	 * @param id    ${memo}id
	 * @return	message
	 */
	@ApiOperation(value = "删除${memo}", notes = "根据id删除${memo}")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	Message delete(@PathVariable String id);

	/**
	 * 删除${memo}ids
	 * @param ids   ${memo}ids
	 * @return	message
	 */
	@ApiOperation(value = "删除${memo}ids", notes = "根据ids删除${memo}")
	@RequestMapping(value = "/", method = RequestMethod.DELETE)
	Message delete(@RequestBody String[] ids);


}
