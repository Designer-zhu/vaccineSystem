package com.designal.vaccines.service;

import com.designal.vaccines.dao.AllocationDao;
import com.designal.vaccines.entity.AllocationCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/7 17:39
 */
public class AllocationService {

    private AllocationDao dao = new AllocationDao();

    ////查询全部市疾控中心
    public List<AllocationCity> viewAll(){
        List<AllocationCity> allocationCityList = null;
        try {
            allocationCityList = dao.viewAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allocationCityList;
    }

    //根据id查询市疾控中心的表名称
    public String viewCity_table(int id){
        String city_table = "";
        try {
            city_table = dao.selectTableName(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return city_table;
    }

    //根据不同的表名获取指定疫苗的库存量
    public int viewV_number(String city_table,String v_name,String v_spec){
        try {
            return dao.selectV_number(city_table, v_name, v_spec);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //修改相应表中的数据
    public boolean updateV_number(String city_table,String v_name,String v_spec,int v_number){
        try {
            return dao.setV_number(city_table, v_name, v_spec, v_number)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    //删除allocation中的记录
    public boolean dropAllocation(String vaccineName,String vaccineSpec){
        try {
            return dao.deleteOne(vaccineName, vaccineSpec)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
