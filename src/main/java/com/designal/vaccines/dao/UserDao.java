package com.designal.vaccines.dao;

import com.designal.vaccines.entity.User;
import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/25 14:50
 */
public class UserDao extends BasicDao<User> {

    //插入用户至用户表
    public int insertOne(User user) throws SQLException {
        String sql = null;

        //判断用户类型
        if(user.getIdentity().equals("pro_user")){
            sql = "insert into pro_user values(?,?,?,?,?,?,?,'',0,?,?)";
        }else if(user.getIdentity().equals("city_user")){
            sql = "insert into city_user values(?,?,?,?,?,?,?,'',0,?,?)";
        }

        return this.update(sql, user.getUser_id(), user.getUsername(), user.getPassword(), user.getSex(),
                user.getEmail(), user.getBirthday(), user.getTelephone(), user.getCode(),user.getIdentity());
    }

    //验证用户激活码 更新状态
    public int updateState(String code, String identity) throws SQLException {
        String sql = null;

        //判断用户类型
        if(identity.equals("pro_user")){
            sql = "update pro_user set state = ? where code = ?";
        }else if(identity.equals("city_user")){
            sql = "update city_user set state = ? where code = ?";
        }

        return this.update(sql,1,code);
    }

    //通过username和password查询用户
    public User selectOne(String username, String password ,String identity) throws SQLException {
        String sql = null;

        //判断用户类型
        if(identity.equals("pro_user")){
            sql = "select * from pro_user where username = ? and password = ?";
        }else if(identity.equals("city_user")){
            sql = "select * from city_user where username = ? and password = ?";
        }

        return this.getBean(sql,User.class,username,password);
    }

    //通过username查询用户
    public User selectOneByUsername(String username, String identity) throws SQLException {
        String sql = null;

        //判断用户类型
        if(identity.equals("pro_user")){
            sql = "select * from pro_user where username = ?";
        }else if(identity.equals("city_user")){
            sql = "select * from city_user where username = ?";
        }

        return this.getBean(sql,User.class,username);
    }

    //根据用户id查询用户信息
    public User selectOne(String user_id,String identity) throws SQLException {

        String sql = "";

        //判断用户类型
        if(identity.equals("pro_user")){
            sql = "select * from pro_user where user_id = ?";
        }else if(identity.equals("city_user")){
            sql = "select * from city_user where user_id = ?";
        }

        return this.getBean(sql,User.class,user_id);

    }

    //修改信息
    public int updateOne(User user) throws SQLException {
        String sql = "update pro_user set username = ?,sex = ?,email = ?,birthday = ?,telephone = ?,photo = ? where user_id = ?";
        return this.update(sql,user.getUsername(),user.getSex(),user.getEmail(),user.getBirthday(),
                user.getTelephone(),user.getPhoto(),user.getUser_id());
    }

    //更新密码
    public int updatePassword(User user) throws SQLException {
        String sql = "update pro_user set password = ? where user_id = ?";
        return this.update(sql,user.getPassword(),user.getUser_id());
    }

    //查看省疾控中心人员列表
    public List<User> selectProUserList() throws SQLException {
        String sql = "select * from pro_user";
        return this.getBeanList(sql,User.class);
    }

    //查看市疾控中心人员列表
    public List<User> selectCityUserList() throws SQLException {
        String sql = "select * from city_user";
        return this.getBeanList(sql,User.class);
    }
}
