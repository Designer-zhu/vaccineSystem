package com.designal.vaccines.service;

import com.designal.vaccines.dao.RecordDao;
import com.designal.vaccines.entity.Record;

import java.sql.SQLException;
import java.util.List;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/3/4 23:22
 */
public class RecordService {

    private RecordDao dao = new RecordDao();

    //插入
    public boolean addNew(Record record){
        try {
            return dao.insert(record) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    //查询
    public List<Record> viewAll(){
        List<Record> recordList = null;

        try {
            recordList = dao.selectAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recordList;
    }

    //查询下发记录表中所有带 ‘同意’ 字段的处理结果
    public List<Record> selectRecord(String result){
        List<Record> recordList = null;

        try {
            recordList = dao.selectRecord(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return recordList;
    }

    //提交运输操作
    public boolean submit(int id){
        try {
            return dao.updateStatusById(id)>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
