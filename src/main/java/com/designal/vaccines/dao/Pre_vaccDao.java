package com.designal.vaccines.dao;

import com.designal.vaccines.entity.Pre_vacc;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/2 11:44
 */
public class Pre_vaccDao extends BasicDao<Pre_vacc> {

    //预插入
    public int insert (Pre_vacc pre_vacc) throws SQLException {
        String sql = "insert into vacc_pre_storage values(?,?,?,?,?,?,?,?,null)";
        return this.update(sql,pre_vacc.getV_name(),pre_vacc.getV_detail(),pre_vacc.getV_site(),
                pre_vacc.getV_date(),pre_vacc.getV_term(),pre_vacc.getV_spec(),pre_vacc.getV_batch(),pre_vacc.getC_id());
    }

    //查询预存库
    public List<Pre_vacc> selectAll(String query) throws SQLException {
        String sql = "";
        List<Pre_vacc> pre_vaccList = null;

        if(query == null || query.equals("")){
            sql = "select * from vacc_pre_storage";
            pre_vaccList = this.getBeanList(sql,Pre_vacc.class);
        }else {
            sql = "select * from vacc_pre_storage where v_id = ?";
            pre_vaccList = this.getBeanList(sql,Pre_vacc.class,query);
        }
        return pre_vaccList;
    }

    //通过v_id进行删除
    public int deleteByV_id(String v_id) throws SQLException {
        String sql = "delete from vacc_pre_storage where v_id = ?";
        return this.update(sql,v_id);
    }

    //通过v_id查询单个
    public Pre_vacc selectOneByV_id(int v_id) throws SQLException {
        String sql = "select * from vacc_pre_storage where v_id = ?";
        return this.getBean(sql,Pre_vacc.class,v_id);
    }
}
