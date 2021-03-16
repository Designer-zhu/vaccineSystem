package com.designal.vaccines.service;

import com.designal.vaccines.dao.Pre_vaccDao;
import com.designal.vaccines.entity.Pre_vacc;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/2 13:41
 */
public class Pre_vaccService {

    private Pre_vaccDao dao = new Pre_vaccDao();

    //添加
    public boolean addNew(Pre_vacc pre_vacc){
        try {
            return dao.insert(pre_vacc)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //查询
    public List<Pre_vacc> viewAll(String query){
        List<Pre_vacc> pre_vaccList = null;
        try {
            pre_vaccList = dao.selectAll(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pre_vaccList;
    }

    //执行删除
    public boolean drop(String v_id){
        try {
            return dao.deleteByV_id(v_id)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //通过v_id查询单个
    public Pre_vacc viewOne(int v_id){
        try {
            return dao.selectOneByV_id(v_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
