package com.designal.vaccines.controller;

import com.designal.vaccines.entity.City;
import com.designal.vaccines.service.CityService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CityServlet",urlPatterns = "/cityServlet")
public class CityServlet extends BasicServlet {

    private CityService service = new CityService();

    //查询城市
    public void viewCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String p_pid = request.getParameter("p_id");

        if(p_pid!=null && !p_pid.equals("")){
            int p_id = Integer.parseInt(p_pid);
            List<City> cityList = service.viewAllCityByP_id(p_id);
            if(cityList!=null){
                //响应回页面
                Result result = new Result(cityList);
                RespWriterUtil.writer(response,result);
            }
        }
    }

}
