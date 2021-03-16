package com.designal.vaccines.entity;

/**
 * @Description 疫苗分类
 * @Author designal
 * @Date 2021/2/27 19:36
 */
public class Vacc_Category {

    private int c_id;
    private String c_name;

    public Vacc_Category() {
    }

    public Vacc_Category(int c_id, String c_name) {
        this.c_id = c_id;
        this.c_name = c_name;
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

    public String toString() {
        return "Vacc_Category{c_id = " + c_id + ", c_name = " + c_name + "}";
    }
}
