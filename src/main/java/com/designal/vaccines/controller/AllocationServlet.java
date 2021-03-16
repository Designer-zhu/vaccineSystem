package com.designal.vaccines.controller;

import com.designal.vaccines.entity.AllocationCity;
import com.designal.vaccines.service.AllocationService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet(name = "AllocationServlet",urlPatterns = "/allocationServlet")
public class AllocationServlet extends BasicServlet {

    private AllocationService service = new AllocationService();

    //查询全部市疾控中心
    public void viewAllCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<AllocationCity> allocationCityList = service.viewAll();
        if(allocationCityList.size() != 0){
            Result result = new Result(allocationCityList);
            RespWriterUtil.writer(response,result);
        }

    }

    //查询不同城市的疫苗库存
    public void getCity_number(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city_table = request.getParameter("city_table");
        String v_name = request.getParameter("v_name");
        String v_spec = request.getParameter("v_spec");

        int v_number = service.viewV_number(city_table, v_name, v_spec);

        if(v_number>0){
            Result result = new Result(v_number);
            RespWriterUtil.writer(response,result);
        }

    }

    //确认调拨，修改相应表中的疫苗数量
    public void updateV_number(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String v_name = request.getParameter("vaccineName");
        String v_spec = request.getParameter("vaccineSpec");
        String vaccineNumber = request.getParameter("vaccineNumber");  //请求量
        String city_table = request.getParameter("allocationCity");
        String v_number = request.getParameter("v_number");  //库存量

        //计算剩余量
        int a = Integer.parseInt(v_number);
        int b = Integer.parseInt(vaccineNumber);



        //删除
        boolean flag1 = service.dropAllocation(v_name, v_spec);

        //修改
        int i = a - b;
        boolean flag2 = service.updateV_number(city_table, v_name, v_spec, i);

        if(flag1 && flag2){
            Result result = new Result("");
            RespWriterUtil.writer(response,result);
        }

    }

    //拒绝
    public void refuse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String vaccineName = request.getParameter("vaccineName");
        String vaccineSpec = request.getParameter("vaccineSpec");

        boolean flag = service.dropAllocation(vaccineName, vaccineSpec);

        if(flag){
            Result result = new Result("");
            RespWriterUtil.writer(response,result);
        }

    }

}
