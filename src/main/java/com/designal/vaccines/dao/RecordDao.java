package com.designal.vaccines.dao;

import com.designal.vaccines.entity.Record;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/4 23:14
 */
public class RecordDao extends BasicDao<Record> {

    //插入
    public int insert(Record record) throws SQLException {
        String sql = "insert into record values(?,?,?,?,?,?,?,?,1)";
        return this.update(sql,record.getId(),record.getVaccineName(),record.getLocation(),record.getRequestDate()
        ,record.getResult(),record.getProcessDate(),record.getVaccineSpec(),record.getVaccineNumber());
    }

    //查询
    public List<Record> selectAll() throws SQLException {
        String sql = "select * from record";
        return this.getBeanList(sql,Record.class);
    }

    //查询下发记录表中所有带 ‘同意’ 字段的处理结果
    public List<Record> selectRecord(String result) throws SQLException {
        String sql = "select * from record where result like concat('%',?,'%') and status = 1";
        return this.getBeanList(sql,Record.class,result);
    }

    //将status字段改为0
    public int updateStatusById(int id) throws SQLException {
        String sql = "update record set status = 0 where id = ?";
        return this.update(sql,id);
    }

}
