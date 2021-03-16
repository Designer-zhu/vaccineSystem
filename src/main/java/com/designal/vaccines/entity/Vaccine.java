package com.designal.vaccines.entity;

import java.util.Date;

/**
 * @Description 疫苗类
 * @Author designal
 * @Date 2021/2/27 15:56
 */
public class Vaccine {

    private String v_id;
    private String v_name; //疫苗名称
    private String v_detail; //疫苗介绍与描述
    private String v_site; //疫苗出厂商
    private Date v_date; //生产日期
    private Date v_term; //截止有效期
    private String v_spec; //规格 20ml/支
    private String v_batch; //批号

    private Vacc_Category vacc_category;  //关联疫苗分类

    public Vaccine() {
    }

    public Vaccine(String v_id, String v_name, String v_detail, String v_site, Date v_date, Date v_term, String v_spec, String v_batch) {
        this.v_id = v_id;
        this.v_name = v_name;
        this.v_detail = v_detail;
        this.v_site = v_site;
        this.v_date = v_date;
        this.v_term = v_term;
        this.v_spec = v_spec;
        this.v_batch = v_batch;
    }

    public Vaccine(String v_id, String v_name, String v_detail, String v_site, Date v_date, Date v_term, String v_spec, String v_batch, Vacc_Category vacc_category) {
        this.v_id = v_id;
        this.v_name = v_name;
        this.v_detail = v_detail;
        this.v_site = v_site;
        this.v_date = v_date;
        this.v_term = v_term;
        this.v_spec = v_spec;
        this.v_batch = v_batch;
        this.vacc_category = vacc_category;
    }

    /**
     * 获取
     * @return v_id
     */
    public String getV_id() {
        return v_id;
    }

    /**
     * 设置
     * @param v_id
     */
    public void setV_id(String v_id) {
        this.v_id = v_id;
    }

    /**
     * 获取
     * @return v_name
     */
    public String getV_name() {
        return v_name;
    }

    /**
     * 设置
     * @param v_name
     */
    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    /**
     * 获取
     * @return v_detail
     */
    public String getV_detail() {
        return v_detail;
    }

    /**
     * 设置
     * @param v_detail
     */
    public void setV_detail(String v_detail) {
        this.v_detail = v_detail;
    }

    /**
     * 获取
     * @return v_site
     */
    public String getV_site() {
        return v_site;
    }

    /**
     * 设置
     * @param v_site
     */
    public void setV_site(String v_site) {
        this.v_site = v_site;
    }

    /**
     * 获取
     * @return v_date
     */
    public Date getV_date() {
        return v_date;
    }

    /**
     * 设置
     * @param v_date
     */
    public void setV_date(Date v_date) {
        this.v_date = v_date;
    }

    /**
     * 获取
     * @return v_term
     */
    public Date getV_term() {
        return v_term;
    }

    /**
     * 设置
     * @param v_term
     */
    public void setV_term(Date v_term) {
        this.v_term = v_term;
    }

    /**
     * 获取
     * @return v_spec
     */
    public String getV_spec() {
        return v_spec;
    }

    /**
     * 设置
     * @param v_spec
     */
    public void setV_spec(String v_spec) {
        this.v_spec = v_spec;
    }

    /**
     * 获取
     * @return v_batch
     */
    public String getV_batch() {
        return v_batch;
    }

    /**
     * 设置
     * @param v_batch
     */
    public void setV_batch(String v_batch) {
        this.v_batch = v_batch;
    }

    /**
     * 获取
     * @return vacc_category
     */
    public Vacc_Category getVacc_category() {
        return vacc_category;
    }

    /**
     * 设置
     * @param vacc_category
     */
    public void setVacc_category(Vacc_Category vacc_category) {
        this.vacc_category = vacc_category;
    }

    public String toString() {
        return "Vaccine{v_id = " + v_id + ", v_name = " + v_name + ", v_detail = " + v_detail + ", v_site = " + v_site + ", v_date = " + v_date + ", v_term = " + v_term + ", v_spec = " + v_spec + ", v_batch = " + v_batch + ", vacc_category = " + vacc_category + "}";
    }
}
