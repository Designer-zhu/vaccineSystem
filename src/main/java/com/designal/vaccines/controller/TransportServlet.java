package com.designal.vaccines.controller;

import com.designal.vaccines.entity.Record;
import com.designal.vaccines.service.RecordService;
import com.designal.vaccines.service.TransportService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "TransportServlet",urlPatterns = "/transportServlet")
public class TransportServlet extends BasicServlet {

    private TransportService service = new TransportService();

    //显示所有同意的下发记录
    public void sto_tans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecordService recordService = new RecordService();
        String res = "同意";
        List<Record> recordList = recordService.selectRecord(res);
        if(recordList!=null){
            //通过json数据传递商品类别的集合
            Gson gson = new Gson();
            String json = gson.toJson(recordList);

            //将json数据响应至客户端
            response.getWriter().write(json);
        }
    }

    //运输提交操作
    public void submit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RecordService recordService = new RecordService();
        String i = request.getParameter("id");
        int id = 0;
        if(i!=null){
           id = Integer.parseInt(i);
        }
        boolean submit = recordService.submit(id);
        if(submit){
            response.sendRedirect(request.getContextPath()+"/backstage/page/vacc_transport/vacc_sto_trans.jsp");
        }
    }
}
