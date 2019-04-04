package ${BASE_PACKAGE}.entity;

import lombok.Data;
import org.apache.ibatis.type.Alias;

/**
 * @ClassName ${objectName}
 * @Description ${memo}
 * @author ${AUTHOR}
 * @date ${DATE}
 */
@Data
@Alias("${objectName}")
public class ${objectName} extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	<#list params as param>
    /**
     * ${param.memo}
     */
	private ${param.type} ${param.name};
	
	</#list>

    public void buildId() {
        this.id = "CR" + globalId.nextId();
    }
}
