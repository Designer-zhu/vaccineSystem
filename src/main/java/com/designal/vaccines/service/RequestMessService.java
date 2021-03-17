package com.designal.vaccines.service;

import com.designal.vaccines.dao.RequestMessDao;
import com.designal.vaccines.entity.RequestMess;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/4 22:33
 */
public class RequestMessService {

    private RequestMessDao dao = new RequestMessDao();

    //查询库中所有
    public List<RequestMess> viewAll(String query){

        List<RequestMess> requestMessList = null;

        try {
            requestMessList = dao.viewAll(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requestMessList;
    }

    public List<RequestMess> viewAllAllocation(String query){

        List<RequestMess> requestMessList = null;

        try {
            requestMessList = dao.selectAll(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requestMessList;
    }



    //查询单个
    public RequestMess viewOne(String vaccineName,String vaccineSpec){
        RequestMess requestMess = null;

        try {
            requestMess = dao.viewOne(vaccineName, vaccineSpec);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return requestMess;
    }

    //根据id删除
    public boolean dropById(int id){
        try {
            return dao.deleteById(id)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //根据vaccineName,vaccineSpec删除
    public boolean dropByNameAndSpec(String vaccineName,String vaccineSpec){
        try {
            return dao.deleteByNameAndSpec(vaccineName,vaccineSpec)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //往allocation表中插入
    public boolean addToAllocation(RequestMess requestMess){
        try {
            return dao.insertIntoAllocation(requestMess) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //往requestmess表中插入
    public boolean addToRequestMess(RequestMess requestMess){
        try {
            return dao.insert(requestMess)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
