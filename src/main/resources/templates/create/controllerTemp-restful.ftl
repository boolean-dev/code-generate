package ${BASE_PACKAGE}.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${BASE_PACKAGE}.massage.*;
import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

/**
 * @ClassName ${objectName}-${memo}
 * @Description: @TODO
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@RestController
@RequestMapping("/${objectNameLower}")
public class ${objectName}Controller extends BaseController {

	@Autowired
	private ${objectName}Service ${objectNameLower}Service;
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public Message save(${objectName} ${objectNameLower}) throws Exception {
		${objectNameLower}.buildId();
		${objectNameLower}Service.save(${objectNameLower});
		return SuccessMessage.message("保存成功");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public Message update(${objectName} ${objectNameLower}) throws Exception {
		${objectNameLower}Service.update(${objectNameLower});
		return SuccessMessage.message("更新成功");
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public Page<${objectName}> list(Pageable pageable) throws Exception {
		return ${objectNameLower}Service.findPage(pageable);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Message view(@PathVariable String id) throws Exception {
		${objectName} ${objectNameLower} = ${objectNameLower}Service.findById(id);
		return SuccessMessage.message(${objectNameLower});
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public Message delete(@PathVariable String id) throws Exception {
		String[] ids = {id};
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}



	@RequestMapping(value = "", method = RequestMethod.DELETE)
	public Message delete(String[] ids) throws Exception {
		int i = ${objectNameLower}Service.delete(ids);
		if(i > 0){
			return SuccessMessage.message("成功");
		}else{
			return ErrorMessage.message("失败");
		}
	}
		
}