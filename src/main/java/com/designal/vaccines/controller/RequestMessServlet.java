package com.designal.vaccines.controller;

import com.designal.vaccines.entity.RequestMess;
import com.designal.vaccines.service.RequestMessService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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

}
