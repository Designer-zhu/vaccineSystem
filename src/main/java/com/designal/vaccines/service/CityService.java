package com.designal.vaccines.service;

import com.designal.vaccines.dao.CityDao;
import com.designal.vaccines.entity.City;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/2 20:11
 */
public class CityService {

    private CityDao dao = new CityDao();

    //查询省所属城市
    public List<City> viewAllCityByP_id(int p_id){
        List<City> cityList = null;
        try {
            cityList = dao.selectCityList(p_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cityList;
    }

    //查询省和城市名
    public String viewProCityName(int p_id,int c_id){
        try {
            return dao.selectProvince_City(p_id,c_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
