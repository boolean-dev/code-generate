package ${BASE_PACKAGE}.entity.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
@Data
@ApiModel("${memo}")
public class ${objectName}VO {

	private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ApiModelProperty(value = "id")
    private String id;
	<#list params as param>
    /**
     * ${param.memo}
     */
    <#if !param.isNullable >@NotBlank</#if>
    @ApiModelProperty(value = "${param.memo}"<#if !param.isNullable > required = true</#if>)
	private ${param.type} ${param.name};
	
	</#list>
}
