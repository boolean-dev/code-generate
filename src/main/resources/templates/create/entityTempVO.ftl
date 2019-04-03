package ${BASE_PACKAGE}.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
@Data
@Alias("${objectName}")
@ApiModel("${memo}")
public class ${objectName} {

	private static final long serialVersionUID = 1L;

    private String id;
	<#list params as param>
    /**
     * ${param.memo}
     */
    @ApiModelProperty(value = "${param.memo}")
	private ${param.type} ${param.name};
	
	</#list>

    public void buildId() {
        this.id = "CR" + globalId.nextId();
    }
}
