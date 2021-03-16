package com.designal.vaccines.vo;

import java.io.Serializable;

/**
 * 返回数据结果
 */
public class Result implements Serializable {
    /**
     * 业务响应吗
     */
    private Integer code = 200;
    /**
     * 业务消息
     */
    private String msg = "SUCCESS";

    //总记录数
    private int count;

    /**
     * 业务数据
     */
    private Object data;

    /**
     * 出现错误，提示错误码和错误消息
     * @param codeMsg
     */
    public Result(CodeMsg codeMsg){
        this.code = codeMsg.code;
        this.msg = codeMsg.msg;
    }

    /**
     * 业务正确，不需要返回数据
     */
    public Result(){

    }

    /**
     * 业务正常，需要返回数据
     * @param data
     */
    public Result(Object data){
        this.data = data;
    }

    public Result(Integer code, String msg, int count, Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
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

    /**
     * 获取
     * @return count
     */
    public int getCount() {
        return count;
    }

    /**
     * 设置
     * @param count
     */
    public void setCount(int count) {
        this.count = count;
    }

    public String toString() {
        return "Result{code = " + code + ", msg = " + msg + ", count = " + count + ", data = " + data + "}";
    }
}
