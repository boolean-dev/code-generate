package com.onegene.code.generate.exception.enums;

/**
 * @ClassName CommonExceprionEnum
 * @Descriiption CommonExceprionEnum 系统公共异常枚举
 * @Author yanjiantao
 * @Date 2019/3/21 15:17
 **/
public interface ExceptionEnum {
    /**
     * 获取异常编码
     */
    Integer getCode();

    /**
     * 获取异常信息
     */
    String getMessage();
}
