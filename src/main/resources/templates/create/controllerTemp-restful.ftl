package ${BASE_PACKAGE}.controller;

import ${BASE_PACKAGE}.feign.AdminFeign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import ${BASE_PACKAGE}.message.*;
import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
@RestController
public class ${objectName}Controller implements AdminFeign {

	@Autowired
	private ${objectName}Service ${objectNameLower}Service;
	
	@Override
	public Message save(@RequestBody ${objectName} ${objectNameLower})  {
		${objectNameLower}.buildId();
		${objectNameLower}Service.save(${objectNameLower});
		return SuccessMessage.message("保存成功");
	}
	
	@Override
	public Message update(@RequestBody ${objectName} ${objectNameLower})  {
		${objectNameLower}Service.update(${objectNameLower});
		return SuccessMessage.message("更新成功");
	}
	
	@Override
	public Page<${objectName}> list(Pageable pageable)  {
		return ${objectNameLower}Service.findPage(pageable);
	}
	
	@Override
	public Message view(@PathVariable String id)  {
		${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
		return SuccessMessage.message(${objectNameLower});
	}

	@Override
	public Message delete(@PathVariable String id)  {
		String[] ids = {id};
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}



	@Override
	public Message delete(@RequestBody String[] ids)  {
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}
		
}