package com.designal.vaccines.dao;

import com.designal.vaccines.entity.Admin;
import com.designal.vaccines.entity.User;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/16 22:44
 */
public class AdminDao extends BasicDao<Admin> {

    //通过姓名和密码查询
    public Admin selectOneByNameAndPassword(String name,String password) throws SQLException {
        String sql = "select * from admin where name = ? and password = ?";
        return this.getBean(sql,Admin.class,name,password);
    }

}
