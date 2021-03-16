package com.designal.vaccines.service;

import com.designal.vaccines.dao.VaccineDao;
import com.designal.vaccines.entity.Pre_vacc;
import com.designal.vaccines.entity.Vaccine;
import com.designal.vaccines.vo.PageInfo;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/27 20:40
 */
public class VaccineService {

    private VaccineDao dao = new VaccineDao();

    //产看分类下的全部疫苗
    /*public List<Vaccine> viewCateVaccineByC_id(String c_id){
        List<Vaccine> vaccineList = null;
        try {
            vaccineList = dao.selectVaccineListByC_id(c_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vaccineList;
    }*/

    //条件+分页查询
    public PageInfo<Vaccine> viewVaccineByQuery(String query1,String search,int pageNow,int limit){
        PageInfo pageInfo = null;

        try {
            //总记录数
            int counts = dao.selectCounts(query1,search);
            //总页数
            int myPages = counts%limit==0? counts/limit: (int)Math.ceil(counts/Double.parseDouble(limit+""));
            //起始条目数
            int begin = (pageNow-1)*limit;

            List<Vaccine> vaccineList = dao.viewAllVaccineByPage(query1,search, begin,limit);

            pageInfo = new PageInfo(pageNow,limit,counts,myPages,vaccineList);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pageInfo;
    }

    //修改疫苗信息
    public boolean update(Vaccine vaccine){
        Vaccine vaccineTest = null;
        try {
            vaccineTest = dao.selectOneByV_id(Integer.parseInt(vaccine.getV_id()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(vaccineTest!=null){
            try {
                return dao.update(vaccine)>0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    //删除疫苗1
    public boolean drop(String v_id){
        try {
            return dao.deleteOneByV_id(v_id)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //删除疫苗
   /* public boolean drop(String v){
        try {
            return dao.deleteOneByV_id(v)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }*/

    //插入
    public boolean addOne(Pre_vacc pre_vacc){
        try {
            return dao.insertOne(pre_vacc)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //通过疫苗名称模糊查询
    public List<Vaccine> viewByV_name(String v_name,String v_spec){
        List<Vaccine> vaccineList = null;
        try {
            vaccineList = dao.selectByV_name(v_name,v_spec);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vaccineList;
    }

}
