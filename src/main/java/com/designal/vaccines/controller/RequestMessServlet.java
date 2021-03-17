package com.designal.vaccines.controller;

import com.designal.vaccines.entity.RequestMess;
import com.designal.vaccines.service.RequestMessService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "RequestMessServlet",urlPatterns = "/requestMessServlet")
public class RequestMessServlet extends BasicServlet {

    private RequestMessService service = new RequestMessService();

    //查看库中所有
    public void viewAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<RequestMess> requestMessList = service.viewAll(request.getParameter("query"));

        if(requestMessList!=null){

            //响应回页面
            Result result = new Result(requestMessList);
            RespWriterUtil.writer(response,result);
        }

    }

    //添加入库请求
    public void insertRequest(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, String[]> parameterMap = request.getParameterMap();

        RequestMess requestMess = new RequestMess();

        //处理时间问题
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class clazz, Object o) {
                Date requestDate = null;
                if(o instanceof String){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        requestDate = sdf.parse(request.getParameter("requestDate"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return requestDate;
            }
        }, Date.class);

        //通过BeanUtils工具类，给pre_vacc对象赋值属性
        try {
            BeanUtils.populate(requestMess,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        boolean flag = service.addToRequestMess(requestMess);
        if(flag){
            Result result = new Result("成功");
            RespWriterUtil.writer(response,result);
        }
    }

    //删除
    public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String i = request.getParameter("id");

        if(i!=null){
            String[] ids = i.split("@");
            for (String id : ids) {
                boolean flag = service.dropById(Integer.parseInt(id));
            }

            Result result = new Result("成功");
            RespWriterUtil.writer(response,result);
        }


    }

}
