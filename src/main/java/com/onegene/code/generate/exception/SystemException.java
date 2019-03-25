package com.onegene.code.generate.exception;

import com.onegene.code.generate.exception.enums.ExceptionEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName SystemException
 * @Descriiption 系统异常
 * @Author yanjiantao
 * @Date 2019/3/21 14:29
 **/
@Data
@EqualsAndHashCode(callSuper = true)
public class SystemException extends RuntimeException{

    private ExceptionEnum exception;
    private String content;



    public SystemException(ExceptionEnum serviceExceptionEnum) {
        this.exception = serviceExceptionEnum;
    }

    public SystemException(ExceptionEnum serviceExceptionEnum,String content) {
        this.exception = serviceExceptionEnum;
        this.content = content;
    }


}
