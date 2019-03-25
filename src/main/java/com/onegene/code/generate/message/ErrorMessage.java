package com.onegene.code.generate.message;

import com.onegene.code.generate.exception.enums.ExceptionEnum;

/**
 * @ClassName ErrorMessage
 * @Descriiption 错误消息返回，包含异常处理的
 * @Author yanjiantao
 * @Date 2019/3/21 17:15
 **/
public class ErrorMessage extends Message {

    private String content;

    private ErrorMessage(String content) {
        this.content = content;
    }

    private ErrorMessage(int code, String massage, String content) {
        super.code = code;
        super.message = message;
        this.content = content;
    }

    private ErrorMessage(ExceptionEnum e) {
        super.code = e.getCode();
        super.message = e.getMessage();
    }

    private ErrorMessage(ExceptionEnum e,String content) {
        super.code = e.getCode();
        super.message = e.getMessage();
        this.content = content;
    }

    public static ErrorMessage message(String content) {
        return new ErrorMessage(content);
    }

    public static ErrorMessage message(int code, String message, String content) {
        return new ErrorMessage(code, message, content);
    }

    public static Message message(ExceptionEnum e) {
        return new ErrorMessage(e);
    }

    public static Message message(ExceptionEnum e, String content) {
        return new ErrorMessage(e,content);
    }
}
