package com.designal.vaccines.entity;

import java.util.Date;

/**
 * @Description 请求入库信息
 * @Author designal
 * @Date 2021/3/4 21:49
 */
public class RequestMess {

    private int id;
    private String vaccineName; //疫苗名称
    private String vaccineSpec; //疫苗规格
    private int vaccineNumber; //疫苗数量
    private String location; //请求方 ***疾控中心
    private Date requestDate; //请求日期

    public RequestMess() {
    }

    public RequestMess(int id, String vaccineName, String vaccineSpec, int vaccineNumber, String location, Date requestDate) {
        this.id = id;
        this.vaccineName = vaccineName;
        this.vaccineSpec = vaccineSpec;
        this.vaccineNumber = vaccineNumber;
        this.location = location;
        this.requestDate = requestDate;
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
     * @return vaccineName
     */
    public String getVaccineName() {
        return vaccineName;
    }

    /**
     * 设置
     * @param vaccineName
     */
    public void setVaccineName(String vaccineName) {
        this.vaccineName = vaccineName;
    }

    /**
     * 获取
     * @return vaccineSpec
     */
    public String getVaccineSpec() {
        return vaccineSpec;
    }

    /**
     * 设置
     * @param vaccineSpec
     */
    public void setVaccineSpec(String vaccineSpec) {
        this.vaccineSpec = vaccineSpec;
    }

    /**
     * 获取
     * @return vaccineNumber
     */
    public int getVaccineNumber() {
        return vaccineNumber;
    }

    /**
     * 设置
     * @param vaccineNumber
     */
    public void setVaccineNumber(int vaccineNumber) {
        this.vaccineNumber = vaccineNumber;
    }

    /**
     * 获取
     * @return location
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置
     * @param location
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * 获取
     * @return requestDate
     */
    public Date getRequestDate() {
        return requestDate;
    }

    /**
     * 设置
     * @param requestDate
     */
    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String toString() {
        return "RequestMess{id = " + id + ", vaccineName = " + vaccineName + ", vaccineSpec = " + vaccineSpec + ", vaccineNumber = " + vaccineNumber + ", location = " + location + ", requestDate = " + requestDate + "}";
    }
}
