package com.designal.vaccines.vo;

import java.io.Serializable;

/**
 * 返回数据结果
 */
public class RtnError implements Serializable {
    /**
     * 业务响应吗
     */
    private Integer code = 300;
    /**
     * 业务消息
     */
    private String msg = "ERROR";

    /**
     * 业务数据
     */
    private Object data;

    /**
     * 出现错误，提示错误码和错误消息
     * @param codeMsg
     */
    public RtnError(CodeMsg codeMsg){
        this.code = codeMsg.code;
        this.msg = codeMsg.msg;
    }

    /**
     * 业务正确，不需要返回数据
     */
    public RtnError(){

    }

    /**
     * 业务正常，需要返回数据
     * @param data
     */
    public RtnError(Object data){
        this.data = data;
    }

    public RtnError(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }


    public String toString() {
        return "Error{code = " + code + ", msg = " + msg + ", data = " + data + "}";
    }
}
