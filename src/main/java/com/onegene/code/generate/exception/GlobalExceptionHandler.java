package com.onegene.code.generate.exception;

import com.onegene.code.generate.exception.enums.CommonExceprionEnum;
import com.onegene.code.generate.message.ErrorMessage;
import com.onegene.code.generate.message.Message;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * @ClassName GlobalExceptionHandler
 * @Descriiption 全局异常Handler
 * @Author yanjiantao
 * @Date 2019/3/21 14:06
 **/
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {


    /**
     * 拦截系统异常
     */
    @ExceptionHandler(SystemException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Message notFount(SystemException e) {
        if (StringUtils.isEmpty(e.getContent())) {
            return ErrorMessage.message(e.getException());
        }else {
            return ErrorMessage.message(e.getException(),e.getContent());
        }

    }

    /**
     * 拦截数据库业务异常
     */
    @ExceptionHandler(DBException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Message notFount(DBException e) {
        if (StringUtils.isEmpty(e.getContent())) {
            return ErrorMessage.message(e.getException());
        }else {
            return ErrorMessage.message(e.getException(),e.getContent());
        }

    }

    /**
     * 拦截业务异常
     */
    @ExceptionHandler(BusinessException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Message notFount(BusinessException e) {
        if (StringUtils.isEmpty(e.getContent())) {
            return ErrorMessage.message(e.getException());
        }else {
            return ErrorMessage.message(e.getException(),e.getContent());
        }

    }

    /**
     * 拦截未知的运行时异常
     */
    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Message notFount(RuntimeException e) {
        log.error("运行时异常:", e);
        return ErrorMessage.message(CommonExceprionEnum.SERVER_ERROR);
    }
}
