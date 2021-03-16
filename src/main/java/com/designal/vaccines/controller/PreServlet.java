package com.designal.vaccines.controller;

import com.designal.vaccines.entity.Pre_vacc;
import com.designal.vaccines.service.CityService;
import com.designal.vaccines.service.Pre_vaccService;
import com.designal.vaccines.service.VaccineService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "PreServlet",urlPatterns = "/preServlet")
public class PreServlet extends BasicServlet {

    private Pre_vaccService service = new Pre_vaccService();

    //查询预存库
    public void viewAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        List<Pre_vacc> pre_vaccList = service.viewAll(query);

        if(pre_vaccList != null){
            Result result = new Result(pre_vaccList);
            RespWriterUtil.writer(response,result);
        }
    }

    //删除
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String v_idStr = request.getParameter("v_id");

        String[] split = v_idStr.split("@");

        if(split!=null){
            //循环执行删除
            for (String v_id : split) {
                service.drop(v_id);
            }
            //封装结果集数据
            Result result = new Result("删除成功");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }else {
            //封装结果集数据
            Result result = new Result("删除失败");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }

    }

    //添加初期前账
    public void addNew(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取form表单中的值
        Map<String, String[]> parameterMap = request.getParameterMap();

        Pre_vacc pre_vacc = new Pre_vacc();

        //处理日期问题1
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class clazz, Object o) {
                Date v_date = null;
                if(o instanceof String){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        v_date = sdf.parse(request.getParameter("v_date"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return v_date;
            }
        }, Date.class);

        //处理日期问题2
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class clazz, Object o) {
                Date v_term = null;
                if(o instanceof String){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        v_term = sdf.parse(request.getParameter("v_term"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return v_term;
            }
        }, Date.class);

        //通过BeanUtils工具类，给pre_vacc对象赋值属性
        try {
            BeanUtils.populate(pre_vacc,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //处理出厂商地址问题
        String province = request.getParameter("province");
        String city = request.getParameter("city");

        //从数据库中获取省和对应城市的信息
        CityService cityService  = new CityService();
        String v_site = "";
        if(province!=null && !"".equals(province) && city !=null && !"".equals(city)){
            int p_id = Integer.parseInt(province);
            int c_id = Integer.parseInt(city);
            v_site = cityService.viewProCityName(p_id, c_id);
        }
        //给pre_vacc装配出厂商
        pre_vacc.setV_site(v_site);

        //System.out.println(pre_vacc);

        //添加至数据库
        boolean flag = service.addNew(pre_vacc);
        if(flag){
            //插入成功
            //封装结果集数据
            Result result = new Result("插入成功");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }else {
            //封装结果集数据
            Result result = new Result("插入失败");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }

    }

    //入库操作
    public void warehousing(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String v_idStr = request.getParameter("v_id");

        if(v_idStr != null && !"".equals(v_idStr)){

            int v_id = Integer.parseInt(v_idStr);

            //入库操作具体执行步骤：
            /**
             * 1.通过v_id获取初期建账库中的疫苗并创建实例对象
             * 2.先删除初期建账库中的该疫苗
             * 3.往疫苗库存中插入该疫苗
             */

            //获取疫苗实例
            Pre_vacc pre_vacc = service.viewOne(v_id);

            //删除初期建账中的该疫苗
            boolean flag = service.drop(v_idStr);

            //完成前面两步后
            if(pre_vacc != null && flag){
                VaccineService vaccineService = new VaccineService();
                boolean b = vaccineService.addOne(pre_vacc);
                if(b){
                    //入库成功
                    //封装结果集数据
                    Result result = new Result("入库成功");

                    //通过json数据的格式响应回页面
                    RespWriterUtil.writer(response,result);
                }else {
                    //封装结果集数据
                    Result result = new Result("入库失败");

                    //通过json数据的格式响应回页面
                    RespWriterUtil.writer(response,result);
                }
            }


        }

    }
}
