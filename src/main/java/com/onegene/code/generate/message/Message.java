package com.onegene.code.generate.message;

import lombok.Data;

/**
 * @ClassName Message
 * @Descriiption 消息base类
 * @Author yanjiantao
 * @Date 2019/3/21 17:14
 **/
@Data
public class Message {
    protected int code;
    protected String message;
}
