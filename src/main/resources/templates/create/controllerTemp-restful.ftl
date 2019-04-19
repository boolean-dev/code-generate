package ${BASE_PACKAGE}.controller;

import ${BASE_PACKAGE}.feign.${objectName}Feign;
import ${BASE_PACKAGE}.entity.vo.${objectName}VO;
import ${BASE_PACKAGE}.enums.Delete;
import ${BASE_PACKAGE}.utils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
public class ${objectName}Controller{

	@Autowired
	private ${objectName}Service ${objectNameLower}Service;
	
	public Message save(@RequestBody ${objectName}VO ${objectNameLower}VO)  {
        ${objectName} ${objectNameLower} = BeanUtils.transfrom(${objectName}.class,${objectNameLower}VO);
        ${objectNameLower}.buildId();
        ${objectNameLower}.setDelete(Delete.NONE);
        ${objectNameLower}.setSort(0L);
		${objectNameLower}Service.save(${objectNameLower});
		return SuccessMessage.message("保存成功");
	}
	
	public Message update(@RequestBody ${objectName}VO ${objectNameLower}VO)  {
        ${objectName} ${objectNameLower} = BeanUtils.transfrom(${objectName}.class,${objectNameLower}VO);
		${objectNameLower}Service.update(${objectNameLower});
		return SuccessMessage.message("更新成功");
	}
	
	public Page<${objectName}VO> list(Pageable pageable)  {
        Page<${objectName}> page = ${objectNameLower}Service.findPage(pageable);
        List<${objectName}VO> ${objectNameLower}VOList = BeanUtils.batchTransform(${objectName}VO.class,page.getData());
        return new Page<>(${objectNameLower}VOList,page.getTotal(),pageable);
	}
	
	public Message<${objectName}VO> view(@PathVariable String id)  {
        ${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
        ${objectName}VO ${objectNameLower}VO = BeanUtils.transfrom(${objectName}VO.class,${objectNameLower});
		return SuccessMessage.message(${objectNameLower}VO);
	}

	public Message delete(@PathVariable String id)  {
		String[] ids = {id};
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}



	public Message delete(@RequestBody String[] ids)  {
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}
		
}