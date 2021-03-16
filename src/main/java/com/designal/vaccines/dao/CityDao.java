package com.designal.vaccines.dao;

import com.designal.vaccines.entity.City;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/2 20:06
 */
public class CityDao extends BasicDao<City> {

    //通过p_id查询所属城市
    public List<City> selectCityList(int p_id) throws SQLException {
        String sql = "select * from city where p_id = ?";
        return this.getBeanList(sql,City.class,p_id);
    }

    //通过p_id和c_id获取省份+城市
    public String selectProvince_City(int p_id, int c_id) throws SQLException {
        String sql1 = "select p_name from province where p_id = ?";
        String provinceName = (String)this.getSingleValue(sql1, p_id);
        String sql2 = "select c_name from city where c_id = ?";
        String cityName = (String)this.getSingleValue(sql2, c_id);

        return provinceName+cityName;
    }

}
