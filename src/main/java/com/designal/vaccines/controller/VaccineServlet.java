package com.designal.vaccines.controller;

import com.designal.vaccines.entity.Vaccine;
import com.designal.vaccines.service.VaccineService;
import com.designal.vaccines.vo.PageInfo;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "VaccineServlet",urlPatterns = "/vaccineServlet")
public class VaccineServlet extends BasicServlet {

    private VaccineService service = new VaccineService();

    //查看库中所有疫苗
    public void showVaccineByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取请求中的查询条件
        String query1 = request.getParameter("query1");

        //搜索框
        String search = request.getParameter("search");

        //获取请求中的当前页
        String page = request.getParameter("page");
        //获取请求中的每页行数
        String limit = request.getParameter("limit");

        PageInfo<Vaccine> vaccinePageInfo = service.viewVaccineByQuery(query1,search, Integer.parseInt(page),Integer.parseInt(limit));

        if(vaccinePageInfo != null){

            //封装结果集数据
            Result result = new Result(vaccinePageInfo);

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }
    }

    //修改疫苗信息
    public void editVaccine(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String v_id = request.getParameter("v_id");
        String v_name = request.getParameter("v_name");
        String v_detail = request.getParameter("v_detail");
        String v_site = request.getParameter("v_site");

        //处理String -> Date
        Date v_date = null;
        Date v_term = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            v_date = sdf.parse(request.getParameter("v_date"));
            v_term = sdf.parse(request.getParameter("v_term"));
        } catch (ParseException e) {
            e.printStackTrace();
        }


        String v_spec = request.getParameter("v_spec");
        String v_batch = request.getParameter("v_batch");

        //创建实例
        Vaccine vaccine = new Vaccine(v_id,v_name,v_detail,v_site,v_date,v_term,v_spec,v_batch);
        //System.out.println(v_id+" "+v_name+" "+v_detail+" "+v_site+" "+v_date+" "+v_term+" "+v_spec+" "+v_batch);

        boolean flag = service.update(vaccine);
        if(flag){
            //修改成功
            //封装结果集数据
            Result result = new Result("修改成功");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }else {
            //修改失败
            //封装结果集数据
            Result result = new Result("修改失败");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }

    }

    //通过v_id删除疫苗
    public void deleteByV_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String v_id = request.getParameter("v_id");
        boolean flag = service.drop(v_id);
        if(flag){
            //删除成功
            //封装结果集数据
            Result result = new Result("修改成功");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }else {
            //删除失败
            //封装结果集数据
            Result result = new Result("修改失败");

            //通过json数据的格式响应回页面
            RespWriterUtil.writer(response,result);
        }
    }

    //
    public void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("city_error.jsp").forward(request,response);

    }

}
