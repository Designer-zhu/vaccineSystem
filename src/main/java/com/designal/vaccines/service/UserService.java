package com.designal.vaccines.service;

import com.designal.vaccines.dao.UserDao;
import com.designal.vaccines.entity.User;

import java.sql.SQLException;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/25 16:06
 */
public class UserService {

    private UserDao dao = new UserDao();

    //注册
    public boolean register(User user){
        try {
            int i = dao.insertOne(user);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //激活验证
    public boolean activeState(String code,String identity){
        try {
            int i = dao.updateState(code,identity);
            return i>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //用户名唯一校验
    public boolean validate(String username, String identity){

        User user = null;
        try {
            user = dao.selectOneByUsername(username,identity);
            if(user !=null){
                //若为true则存在 ， 若为false则不存在
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //登录
    public User login(String username,String password,String identity){
        User user = null;
        try {
            user = dao.selectOne(username,password,identity);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //根据用户id查询用户信息
    public User viewOneBvUser_id(String user_id,String identity){
        User user = null;
        try {
            user = dao.selectOne(user_id,identity);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //更新用户信息
    public boolean updateUser(User user){
        try {
            return dao.updateOne(user)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //更新密码
    public boolean updatePassword(User user){
        try {
            return dao.updatePassword(user)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
