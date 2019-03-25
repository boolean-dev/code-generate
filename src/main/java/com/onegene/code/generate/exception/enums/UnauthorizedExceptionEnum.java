package com.onegene.code.generate.exception.enums;

/**
 * @ClassName UnauthorizedExceptionEnum
 * @Descriiption UnauthorizedExceptionEnum 未授权异常枚举
 * @Author yanjiantao
 * @Date 2019/3/21 15:17
 **/
public enum UnauthorizedExceptionEnum implements ExceptionEnum {

    /**
     * Session不存在或者已经失效
     */
    SESSION_ERROR(500210, "Session不存在或者已经失效"),
    /**
     * 登录密码不能为空
     */
    PASSWORD_EMPTY(500211, "登录密码不能为空"),
    /**
     * 手机号不能为空
     */
    MOBILE_EMPTY(500212, "手机号不能为空"),
    /**
     * 手机号格式错误
     */
    MOBILE_ERROR(500213, "手机号格式错误"),
    /**
     * 手机号不存在
     */
    MOBILE_NOT_EXIST(500214, "手机号不存在"),
    /**
     * 密码错误
     */
    PASSWORD_ERROR(500215, "密码错误"),
    /**
     * 订单不存在
     */
    ORDER_NOT_EXIST(500400, "订单不存在");

    /**
     * code
     */
    private Integer code;
    /**
     * message
     */
    private String message;


    UnauthorizedExceptionEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }


    @Override
    public Integer getCode() {
        return this.code;
    }

    @Override
    public String getMessage() {
        return this.message;
    }
}
