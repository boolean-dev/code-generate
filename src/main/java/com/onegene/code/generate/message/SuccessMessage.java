package com.onegene.code.generate.message;

import org.springframework.http.HttpStatus;

/**
 * @ClassName SuccessMessage
 * @Descriiption TODO
 * @Author yanjiantao
 * @Date 2019/3/21 17:14
 **/
public class SuccessMessage<T> extends Message{

    private T data;

    private SuccessMessage() {
        super.code = HttpStatus.OK.value();
        super.message = HttpStatus.OK.name();
    }

    private SuccessMessage(T data) {
        super.code = HttpStatus.OK.value();
        super.message = HttpStatus.OK.name();
        this.data = data;
    }

    public static <T> SuccessMessage<T> message(T data) {
        return new SuccessMessage<>(data);
    }

    public static SuccessMessage message() {
        return new SuccessMessage();
    }

    public T getData() {
        return data;
    }
}
