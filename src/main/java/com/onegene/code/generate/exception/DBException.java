package com.onegene.code.generate.exception;

import com.onegene.code.generate.exception.enums.ExceptionEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @ClassName DBException
 * @Descriiption TODO
 * @Author yanjiantao
 * @Date 2019/3/21 14:30
 **/
@Data
@EqualsAndHashCode(callSuper = true)
public class DBException extends RuntimeException{

    /**
     * 异常类型
     */
    private ExceptionEnum exception;
    /**
     * 异常错误消息
     */
    private String content;



    public DBException(ExceptionEnum serviceExceptionEnum) {
        this.exception = serviceExceptionEnum;
    }

    public DBException(ExceptionEnum serviceExceptionEnum,String content) {
        this.exception = serviceExceptionEnum;
        this.content = content;
    }
}
