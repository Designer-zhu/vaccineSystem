package com.designal.vaccines.entity;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/7 17:25
 */
public class AllocationCity {

    private int id;
    private String city_name;
    private String city_table; //数据库中城市的表名


    public AllocationCity() {
    }

    public AllocationCity(int id, String city_name, String city_table) {
        this.id = id;
        this.city_name = city_name;
        this.city_table = city_table;
    }

    /**
     * 获取
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * 获取
     * @return city_name
     */
    public String getCity_name() {
        return city_name;
    }

    /**
     * 设置
     * @param city_name
     */
    public void setCity_name(String city_name) {
        this.city_name = city_name;
    }

    /**
     * 获取
     * @return city_table
     */
    public String getCity_table() {
        return city_table;
    }

    /**
     * 设置
     * @param city_table
     */
    public void setCity_table(String city_table) {
        this.city_table = city_table;
    }

    public String toString() {
        return "AllocationCity{id = " + id + ", city_name = " + city_name + ", city_table = " + city_table + "}";
    }
}
