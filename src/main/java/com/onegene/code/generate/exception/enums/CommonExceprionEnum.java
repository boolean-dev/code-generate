package com.onegene.code.generate.exception.enums;

/**
 * @ClassName CommonExceprionEnum
 * @Descriiption CommonExceprionEnum 系统公共异常枚举
 * @Author yanjiantao
 * @Date 2019/3/21 15:17
 **/
public enum  CommonExceprionEnum implements ExceptionEnum {

    /**
     * 其他
     */
    INVLIDE_DATE_STRING(400, "输入日期格式不对"),

    /**
     * 其他
     */
    WRITE_ERROR(500, "渲染界面错误"),

    /**
     * 文件上传
     */
    FILE_READING_ERROR(400, "FILE_READING_ERROR!"),
    FILE_NOT_FOUND(400, "FILE_NOT_FOUND!"),

    /**
     * 错误的请求
     */
    REQUEST_NULL(400, "请求有错误"),
    /**
     * 服务器异常
     */
    SERVER_ERROR(500, "服务器异常"),
    /**
     * 参数校验异常
     */
    BIND_ERROR(500100, "参数校验异常：%s"),
    /**
     * 请求非法
     */
    REQUEST_ILLEGAL(500102, "请求非法"),
    /**
     * 访问太频繁！
     */
    ACCESS_LIMIT_REACHED(500104, "访问太频繁！"),
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

    CommonExceprionEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
