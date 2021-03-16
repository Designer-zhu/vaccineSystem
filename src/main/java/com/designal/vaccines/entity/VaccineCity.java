package com.designal.vaccines.entity;

/**
 * @Description 市库存疫苗实体类
 * @Author designal
 * @Date 2021/3/7 16:57
 */
public class VaccineCity extends Vaccine {

    private int v_number;

    public VaccineCity() {
    }

    public VaccineCity(int v_number) {
        this.v_number = v_number;
    }

    /**
     * 获取
     * @return v_number
     */
    public int getV_number() {
        return v_number;
    }

    /**
     * 设置
     * @param v_number
     */
    public void setV_number(int v_number) {
        this.v_number = v_number;
    }

    public String toString() {
        return "VaccineCity{v_number = " + v_number + "}";
    }
}
