package com.onegene.code.generate.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.onegene.code.generate.config.CreateConfig;
import com.onegene.code.generate.entity.CreateCodeVo;
import com.onegene.code.generate.entity.CreateItem;
import com.onegene.code.generate.service.CreateCodeService;
import com.onegene.code.generate.utils.CamelNameMethod;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static com.onegene.code.generate.config.CreateConfig.*;


@Controller
public class CreateCodeController {
	
	@Autowired
	private CreateCodeService createCodeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String create() throws Exception {
		return "/createCode/add";
	}

	@RequestMapping(value = "/column", method = RequestMethod.POST)
	public Object findColumn(ModelMap model, String findTableName) throws Exception {
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("tableName", findTableName);
		parameter.put("databaseName", CreateConfig.DATA_BASE_NAME);
		List<CreateItem> createItems = createCodeService.findColum(parameter);
		List<CreateItem> result = new ArrayList<>();
		for(int i=0; i<createItems.size();i++) {
			if("id".equals(createItems.get(i).getJavaName()) || "createDate".equals(createItems.get(i).getJavaName())
					|| "modifyDate".equals(createItems.get(i).getJavaName()) || "sort".equals(createItems.get(i).getJavaName())
					|| "delete".equals(createItems.get(i).getJavaName())) {
				continue;
			}else {
				result.add(createItems.get(i));
			}
		}
		model.addAttribute("createItems", result);
		return "/createCode/add";
	}


	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public static Object save(String entityName, String tableName, String memo, String strCreateItems) throws Exception {
		
		Gson gson = new Gson();
		List<CreateItem> createItems = gson.fromJson(strCreateItems, new TypeToken<List<CreateItem>>(){}.getType());
		CreateCodeVo vo = new CreateCodeVo();
		vo.setEntityName(entityName);
		vo.setTableName(tableName);
		vo.setCreateItems(createItems);
		
		// java类名首字母大写
		String objectName = entityName.substring(0, 1).toUpperCase() + entityName.substring(1);
		// 首字母小写
		String objectNameLower = entityName.substring(0, 1).toLowerCase() + entityName.substring(1);

		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		Map<String, Object> root = new HashMap<>();
		root.put("memo", memo);
		root.put("objectName", objectName);
		root.put("objectNameLower", objectNameLower);
		root.put("tableName", tableName);
		root.put("BASE_PACKAGE",BASE_PACKAGE);
		root.put("DATE", df.format(LocalDateTime.now()));
		root.put("AUTHOR", AUTHOR);



		root.put("params", vo.getCreateItems());
		// 将下划线大写方式命名的字符串转换为驼峰式
		root.put("camelName", new CamelNameMethod());

		/* 生成实体 */
		printJavaFile("entityTemp.ftl", root, objectName + ".java", objectName + "/");

		/* 生成controller */
		printJavaFile("controllerTemp-web.ftl", root, objectName + "Controller.java", objectName + "/web/");
		printJavaFile("controllerTemp-restful.ftl", root, objectName + "Controller.java", objectName + "/");
		printJavaFile("feignTemp.ftl", root, objectName + "Feign.java", objectName + "/");

		/* 生成service */
		printJavaFile("serviceTemp.ftl", root, objectName + "Service.java", objectName + "/");
		printJavaFile("serviceImplTemp.ftl", root, objectName + "ServiceImpl.java", objectName + "/");

		/* 生成dao */
		printJavaFile("daoTemp.ftl", root, objectName + "Dao.java", objectName + "/");
		printJavaFile("daoImplTemp.ftl", root, objectName + "DaoImpl.java", objectName + "/");

		/* 生成mybatis xml */
		printJavaFile("mapper.ftl", root, objectName + "Mapper.xml", objectName + "/");

		/* 生成SQL脚本 */
		printJavaFile("sqlTemp.ftl", root, objectName + ".sql", objectName + "/");

		/* 生成ftl页面 */
		printJavaFile("viewTemp.ftl", root, "view.ftl", objectName + "/admin/" + objectNameLower + "/");
		printJavaFile("addTemp.ftl", root, "add.ftl", objectName + "/admin/" + objectNameLower + "/");
		printJavaFile("editTemp.ftl", root, "edit.ftl", objectName + "/admin/" + objectNameLower + "/");
		printJavaFile("listTemp.ftl", root, "list.ftl", objectName + "/admin/" + objectNameLower + "/");

//		Map<String,Object> result=new HashMap<>();
//		result.put("result", "ok");
		return "{\"result\":\"ok\"}";
	}

	public static void printJavaFile(String ftlName, Map<String, Object> root, String outFile, String filePath)
			throws Exception {
		try {
			File file = new File(PROJECT_PATH + filePath + outFile);
			// 判断有没有父路径，就是判断文件整个路径是否存在
			if (!file.getParentFile().exists()) {
				// 不存在就全部创建
				file.getParentFile().mkdirs();
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
			Template template = getTemplate(ftlName);
			// 模版输出
			template.process(root, out);
			out.flush();
			out.close();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 通过文件名加载模版
	 * 
	 * @param ftlName
	 */
	private static Template getTemplate(String ftlName) throws Exception {
		try {
			File file = ResourceUtils.getFile("classpath:application.yml");
			// 通过Freemaker的Configuration读取相应的ftl
			Configuration cfg = new Configuration();
			cfg.setEncoding(Locale.CHINA, "utf-8");
			// 设定去哪里读取相应的ftl模板文件
			cfg.setDirectoryForTemplateLoading(new File(file.getParent() + "\\templates\\create"));
			// 在模板文件目录中找到名称为name的文件
			Template temp = cfg.getTemplate(ftlName);
			return temp;
		} catch (IOException e) {
			e.printStackTrace();                                                                                                                                                                                                                                                                                                                                                                                
		}
		return null;
	}
	

}
