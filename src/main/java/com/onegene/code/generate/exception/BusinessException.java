package com.onegene.code.generate.exception;

import com.onegene.code.generate.exception.enums.ExceptionEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName BusinessException
 * @Descriiption 业务异常枚举
 * @Author yanjiantao
 * @Date 2019/3/21 14:30
 **/
@Data
@EqualsAndHashCode(callSuper = true)
public class BusinessException extends RuntimeException{

    /**
     * 异常类型
     */
    private ExceptionEnum exception;
    /**
     * 异常错误消息
     */
    private String content;



    public BusinessException(ExceptionEnum serviceExceptionEnum) {
        this.exception = serviceExceptionEnum;
    }

    public BusinessException(ExceptionEnum serviceExceptionEnum,String content) {
        this.exception = serviceExceptionEnum;
        this.content = content;
    }

}
