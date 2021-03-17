package com.designal.vaccines.service;

import com.designal.vaccines.dao.AdminDao;
import com.designal.vaccines.entity.Admin;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/16 22:48
 */
public class AdminService {

    private AdminDao dao = new AdminDao();

    //管理员登录
    public Admin login(String name,String password){
        Admin admin = null;

        try {
            admin = dao.selectOneByNameAndPassword(name, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
