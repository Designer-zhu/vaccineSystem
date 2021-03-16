package com.designal.vaccines.entity;

import java.util.Date;

/**
 * @Description 处理记录
 * @Author designal
 * @Date 2021/3/4 23:12
 */
public class Record extends RequestMess{

    private String result; //下发处理结果

    private Date processDate; //处理日期

    private int status; //运输状态

    public Record() {
    }

    public Record(String result, Date processDate, int status) {
        this.result = result;
        this.processDate = processDate;
        this.status = status;
    }

    /**
     * 获取
     * @return result
     */
    public String getResult() {
        return result;
    }

    /**
     * 设置
     * @param result
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * 获取
     * @return processDate
     */
    public Date getProcessDate() {
        return processDate;
    }

    /**
     * 设置
     * @param processDate
     */
    public void setProcessDate(Date processDate) {
        this.processDate = processDate;
    }

    /**
     * 获取
     * @return status
     */
    public int getStatus() {
        return status;
    }

    /**
     * 设置
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    public String toString() {
        return "Record{result = " + result + ", processDate = " + processDate + ", status = " + status + "}";
    }
}
