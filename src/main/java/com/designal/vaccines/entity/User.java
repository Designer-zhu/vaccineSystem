package com.designal.vaccines.entity;

import java.util.Date;

/**
 * @Description 抽象用户类
 * @Author designal
 * @Date 2021/2/27 10:28
 */
public class User {

    private String user_id;
    private String username;
    private String password;
    private String sex;
    private String identity; //身份
    private String email;
    private Date birthday;
    private String telephone;
    private String photo;
    private int state;//0--未激活 1--激活
    private String code;//激活码


    public User() {
    }

    public User(String user_id, String username, String password, String sex, String identity, String email, Date birthday, String telephone, String photo, int state, String code) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.identity = identity;
        this.email = email;
        this.birthday = birthday;
        this.telephone = telephone;
        this.photo = photo;
        this.state = state;
        this.code = code;
    }

    /**
     * 获取
     * @return user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * 设置
     * @param user_id
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    /**
     * 获取
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
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

    /**
     * 获取
     * @return sex
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置
     * @param sex
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取
     * @return identity
     */
    public String getIdentity() {
        return identity;
    }

    /**
     * 设置
     * @param identity
     */
    public void setIdentity(String identity) {
        this.identity = identity;
    }

    /**
     * 获取
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取
     * @return birthday
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置
     * @param birthday
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取
     * @return telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置
     * @param telephone
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 获取
     * @return photo
     */
    public String getPhoto() {
        return photo;
    }

    /**
     * 设置
     * @param photo
     */
    public void setPhoto(String photo) {
        this.photo = photo;
    }

    /**
     * 获取
     * @return state
     */
    public int getState() {
        return state;
    }

    /**
     * 设置
     * @param state
     */
    public void setState(int state) {
        this.state = state;
    }

    /**
     * 获取
     * @return code
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置
     * @param code
     */
    public void setCode(String code) {
        this.code = code;
    }

    public String toString() {
        return "User{user_id = " + user_id + ", username = " + username + ", password = " + password + ", sex = " + sex + ", identity = " + identity + ", email = " + email + ", birthday = " + birthday + ", telephone = " + telephone + ", photo = " + photo + ", state = " + state + ", code = " + code + "}";
    }
}
