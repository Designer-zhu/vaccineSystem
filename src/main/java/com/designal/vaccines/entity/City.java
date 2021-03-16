package com.designal.vaccines.entity;

/**
 * @Description 二级联动City类
 * @Author designal
 * @Date 2021/3/2 19:45
 */
public class City {

    private int c_id;
    private String c_name;

    private Province province;


    public City() {
    }

    public City(int c_id, String c_name, Province province) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.province = province;
    }

    /**
     * 获取
     * @return c_id
     */
    public int getC_id() {
        return c_id;
    }

    /**
     * 设置
     * @param c_id
     */
    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    /**
     * 获取
     * @return c_name
     */
    public String getC_name() {
        return c_name;
    }

    /**
     * 设置
     * @param c_name
     */
    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    /**
     * 获取
     * @return province
     */
    public Province getProvince() {
        return province;
    }

    /**
     * 设置
     * @param province
     */
    public void setProvince(Province province) {
        this.province = province;
    }

    public String toString() {
        return "City{c_id = " + c_id + ", c_name = " + c_name + ", province = " + province + "}";
    }
}
