package com.designal.vaccines.dao;

import com.designal.vaccines.entity.AllocationCity;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/7 17:27
 */
public class AllocationDao extends BasicDao<AllocationCity> {

    //查询全部市疾控中心
    public List<AllocationCity> viewAll() throws SQLException {
        String sql = "select * from allocation_city";
        return this.getBeanList(sql,AllocationCity.class);
    }

    //根据id查询市疾控中心的表名称
    public String selectTableName(int id) throws SQLException {
        String sql = "select city_table from allocation_city where id = ?";
        return (String) this.getSingleValue(sql, id);
    }

    //根据不同的表名获取指定疫苗的库存量
    public int selectV_number(String city_table,String v_name,String v_spec) throws SQLException {
        String sql = "";
        switch (city_table){
            case "xi_an":
                sql = "select v_number from xi_an where v_name = ? and v_spec = ?";
                break;
            case "xian_yang":
                sql = "select v_number from xian_yang where v_name = ? and v_spec = ?";
                break;
        }
        return (Integer)this.getSingleValue(sql,v_name,v_spec);
    }

    //修改相应表中的数据
    public int setV_number(String city_table,String v_name,String v_spec,int v_number) throws SQLException {
        String sql = "";
        switch (city_table){
            case "xi_an":
                sql = "update xi_an set v_number = ? where v_name = ? and v_spec = ?";
                break;
            case "xian_yang":
                sql = "update xian_yang set v_number = ? where v_name = ? and v_spec = ?";
                break;
        }
        return this.update(sql,v_number,v_name,v_spec);
    }

    //删除allocation中的请求记录
    public int deleteOne(String vaccineName,String vaccineSpec) throws SQLException {
        String sql = "delete from allocation where vaccineName = ? and vaccineSpec = ?";
        return this.update(sql,vaccineName,vaccineSpec);
    }

}
