package com.designal.vaccines.dao;

import com.designal.vaccines.entity.Pre_vacc;
import com.designal.vaccines.entity.Vaccine;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/27 20:33
 */
public class VaccineDao extends BasicDao<Vaccine> {

    //通过疫苗分类查询所属疫苗
    public List<Vaccine> selectVaccineListByC_id(String c_id) throws SQLException {
        String sql = "select * from vaccine where c_id = ?";
        return this.getBeanList(sql,Vaccine.class,c_id);
    }

    //通过“条件” 查询数据空中疫苗总记录数
    public int selectCounts(String query1,String search) throws SQLException {
        Long counts = 0L;

        String sql = "";
        if((query1==null || query1.equals("")) && (search==null || search.equals(""))){
            //无搜索条件
            sql = "select count(*) from vaccine";
            counts = (Long) this.getSingleValue(sql);
        }else if(query1!=null && (search==null || search.equals(""))){
            //有query1搜索条件
            int c_id = Integer.parseInt(query1);
            sql = "select count(*) from vaccine where c_id = ?";
            counts = (Long)this.getSingleValue(sql,c_id);
        }else if((query1==null || query1.equals(""))){
            //有search搜索条件
            int v_id = Integer.parseInt(search);
            sql = "select count(*) from vaccine where v_id = ?";
            counts = (Long)this.getSingleValue(sql,v_id);
        }else {
            //有search+query1搜索条件
            int v_id = Integer.parseInt(search);
            int c_id = Integer.parseInt(query1);
            sql = "select count(*) from vaccine where v_id = ? and c_id = ?";
            counts = (Long)this.getSingleValue(sql,v_id,c_id);
        }

        return counts.intValue();
    }

    //条件 + 分页查询
    public List<Vaccine> viewAllVaccineByPage(String query1,String search,int begin, int limit) throws SQLException {
        List<Vaccine> vaccineList = null;

        String sql = "";
        if((query1==null || query1.equals("")) && (search==null || search.equals(""))){
            //无条件搜索查询
            sql = "select * from vaccine limit ?,?";
            vaccineList = this.getBeanList(sql,Vaccine.class,begin,limit);
        }else if(query1!=null && (search==null || search.equals(""))){
            //query1搜索查询
            int c_id = Integer.parseInt(query1);
            sql = "select * from vaccine where c_id = ? limit ?,?";
            vaccineList = this.getBeanList(sql,Vaccine.class,c_id,begin,limit);
        }else if(query1 == null || query1.equals("")){
            //search搜索查询
            int v_id = Integer.parseInt(search);
            sql = "select * from vaccine where v_id = ? limit ?,?";
            vaccineList = this.getBeanList(sql,Vaccine.class,v_id,begin,limit);
        }else {
            //search+query1搜索查询
            int v_id = Integer.parseInt(search);
            int c_id = Integer.parseInt(query1);
            sql = "select * from vaccine where v_id = ? and c_id = ? limit ?,?";
            vaccineList = this.getBeanList(sql,Vaccine.class,v_id,c_id,begin,limit);
        }

        return vaccineList;
    }

    //修改商品
    public int update(Vaccine vaccine) throws SQLException {
        String sql = "update vaccine set v_name = ?,v_detail = ?,v_site = ?,v_date = ?,v_term = ?,v_spec = ?,v_batch = ? where v_id = ?";
        //System.out.println("1111111");
        return this.update(sql,vaccine.getV_name(),vaccine.getV_detail(),vaccine.getV_site(),
                vaccine.getV_date(),vaccine.getV_term(),vaccine.getV_spec(),vaccine.getV_batch(),
                vaccine.getV_id());
    }

    //通过v_id查询单个疫苗
    public Vaccine selectOneByV_id(int v_id) throws SQLException {
        String sql = "select * from vaccine where v_id = ?";
        return this.getBean(sql,Vaccine.class,v_id);
    }

    //通过v_id删除疫苗
    public int deleteOneByV_id(String v_id) throws SQLException {
        String sql = "delete from vaccine where v_id = ?";
        return this.update(sql,v_id);
    }

    //插入
    public int insertOne(Pre_vacc pre_vacc) throws SQLException {
        String sql = "insert into vaccine values(null,?,?,?,?,?,?,?,?)";
        return this.update(sql,pre_vacc.getV_name(),pre_vacc.getV_detail(),pre_vacc.getV_site(),pre_vacc.getV_date()
            ,pre_vacc.getV_term(),pre_vacc.getV_spec(),pre_vacc.getV_batch(),pre_vacc.getC_id());
    }

    //通过疫苗名称和规格模糊查询
    public List<Vaccine> selectByV_name(String v_name,String v_spec) throws SQLException {
        String sql = "select * from vaccine where v_name like concat('%',?,'%') and v_spec like concat('%',?,'%')";
        return this.getBeanList(sql,Vaccine.class,v_name,v_spec);
    }


}
