package com.designal.vaccines.entity;

/**
 * @Description 省类
 * @Author designal
 * @Date 2021/3/2 20:04
 */
public class Province {

    private String p_id;
    private String p_name;

    public Province() {
    }

    public Province(String p_id, String p_name) {
        this.p_id = p_id;
        this.p_name = p_name;
    }

    /**
     * 获取
     * @return p_id
     */
    public String getP_id() {
        return p_id;
    }

    /**
     * 设置
     * @param p_id
     */
    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    /**
     * 获取
     * @return p_name
     */
    public String getP_name() {
        return p_name;
    }

    /**
     * 设置
     * @param p_name
     */
    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String toString() {
        return "Province{p_id = " + p_id + ", p_name = " + p_name + "}";
    }
}
