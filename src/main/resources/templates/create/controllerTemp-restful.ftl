package ${BASE_PACKAGE}.controller;

import ${BASE_PACKAGE}.entity.vo.${objectName}VO;
import ${BASE_PACKAGE}.enums.Delete;
import ${BASE_PACKAGE}.utils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import io.swagger.annotations.*;

import ${BASE_PACKAGE}.message.*;
import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

import java.util.List;

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
@RestController
@Api(value = "${memo}", tags = "${memo}")
@RequestMapping("/api/${objectNameLower}")
public class ${objectName}Controller{

	@Autowired
	private ${objectName}Service ${objectNameLower}Service;

    /**
	 * 添加${memo}
	 * @param ${objectNameLower}VO ${memo}
	 * @return	${objectNameLower}VO
	 */
	@ApiOperation(value = "添加${memo}", notes = "查询${memo}数据")
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public Message save(@RequestBody ${objectName}VO ${objectNameLower}VO)  {
        ${objectName} ${objectNameLower} = BeanUtils.transfrom(${objectName}.class,${objectNameLower}VO);
        ${objectNameLower}.buildId();
        ${objectNameLower}.setDelete(Delete.NONE);
        ${objectNameLower}.setSort(0L);
		${objectNameLower}Service.save(${objectNameLower});
		return SuccessMessage.message("保存成功");
	}

    /**
	 * 更新${memo}
	 * @param ${objectNameLower}VO ${memo}
	 * @return	message
	 */
	@ApiOperation(value = "更新${memo}", notes = "更新${memo}数据")
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public Message update(@RequestBody ${objectName}VO ${objectNameLower}VO)  {
        ${objectName} ${objectNameLower} = BeanUtils.transfrom(${objectName}.class,${objectNameLower}VO);
		${objectNameLower}Service.update(${objectNameLower});
		return SuccessMessage.message("更新成功");
	}

    /**
	 * ${memo}列表
	 * @param pageable  分页
	 * @return	page
	 */
	@ApiOperation(value = "${memo}列表", notes = "查看${memo}列表")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public Page<${objectName}VO> list(Pageable pageable)  {
        Page<${objectName}> page = ${objectNameLower}Service.findPage(pageable);
        List<${objectName}VO> ${objectNameLower}VOList = BeanUtils.batchTransform(${objectName}VO.class,page.getData());
        return new Page<>(${objectNameLower}VOList,page.getTotal(),pageable);
	}

    /**
     * ${memo}详情
     * @param id    ${memo}id
     * @return	message
     */
    @ApiOperation(value = "${memo}详情", notes = "根据id查看${memo}详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Message<${objectName}VO> view(@PathVariable String id)  {
        ${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
        ${objectName}VO ${objectNameLower}VO = BeanUtils.transfrom(${objectName}VO.class,${objectNameLower});
		return SuccessMessage.message(${objectNameLower}VO);
	}

    /**
     * 删除${memo}
     * @param id    ${memo}id
     * @return	message
     */
    @ApiOperation(value = "删除${memo}", notes = "根据id删除${memo}")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public Message delete(@PathVariable String id)  {
		String[] ids = {id};
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}


    /**
     * 删除${memo}ids
     * @param ids   ${memo}ids
     * @return	message
     */
    @ApiOperation(value = "删除${memo}ids", notes = "根据ids删除${memo}")
    @RequestMapping(value = "/", method = RequestMethod.DELETE)
	public Message delete(@RequestBody String[] ids)  {
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}
		
}