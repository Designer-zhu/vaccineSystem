package com.designal.vaccines.dao;

import com.designal.vaccines.entity.RequestMess;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/4 22:03
 */
public class RequestMessDao extends BasicDao<RequestMess> {

    //查询库中的所有请求
    public List<RequestMess> viewAll(String query) throws SQLException {
        String sql = "";
        if(query==null || query.equals("")){
            sql = "select * from requestmess";
            return this.getBeanList(sql,RequestMess.class);
        }else {
            sql = "select * from requestmess where id = ?";
            int id = Integer.parseInt(query);
            return this.getBeanList(sql,RequestMess.class,id);
        }

    }

    //根据name和spec查询单条记录
    public RequestMess viewOne(String vaccineName,String vaccineSpec) throws SQLException {
        String sql = "select * from requestmess where vaccineName = ? and vaccineSpec = ?";
        return this.getBean(sql,RequestMess.class,vaccineName,vaccineSpec);
    }


    //插入
    public int insert(RequestMess requestMess) throws SQLException {
        String sql = "insert into requestmess values(null,?,?,?,?,?)";
        return this.update(sql,requestMess.getVaccineName(),requestMess.getLocation(),requestMess.getRequestDate()
            ,requestMess.getVaccineSpec(),requestMess.getVaccineNumber());
    }

    //根据id删除
    public int deleteById(int id) throws SQLException {
        String sql = "delete from requestmess where id = ?";
        return this.update(sql,id);
    }

    //根据vaccineName 和 vaccineSpec删除
    public int deleteByNameAndSpec(String vaccineName,String vaccineSpec) throws SQLException {
        String sql = "delete from requestmess where vaccineName = ? and vaccineSpec = ?";
        return this.update(sql,vaccineName,vaccineSpec);
    }

    //往allocation表中插入
    public int insertIntoAllocation(RequestMess requestMess) throws SQLException {
        String sql = "insert into allocation values(?,?,?,?,?,?)";
        return this.update(sql,requestMess.getId(),requestMess.getVaccineName(),requestMess.getLocation(),requestMess.getRequestDate()
                ,requestMess.getVaccineSpec(),requestMess.getVaccineNumber());
    }

    //查询allocation中的所有调拨请求
    public List<RequestMess> selectAll(String query) throws SQLException {
        String sql = "";
        if(query==null || query.equals("")){
            sql = "select * from allocation";
            return this.getBeanList(sql,RequestMess.class);
        }else {
            sql = "select * from allocation where id = ?";
            int id = Integer.parseInt(query);
            return this.getBeanList(sql,RequestMess.class,id);
        }
    }

}
