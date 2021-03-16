package com.designal.vaccines.entity;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/27 10:43
 */
public class Admin {

    private int admin_id;
    private String name;
    private String password;

    public Admin() {
    }

    public Admin(int admin_id, String name, String password) {
        this.admin_id = admin_id;
        this.name = name;
        this.password = password;
    }

    /**
     * 获取
     * @return admin_id
     */
    public int getAdmin_id() {
        return admin_id;
    }

    /**
     * 设置
     * @param admin_id
     */
    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public String toString() {
        return "Admin{admin_id = " + admin_id + ", name = " + name + ", password = " + password + "}";
    }
}
