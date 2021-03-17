package com.designal.vaccines.controller;

import com.designal.vaccines.entity.Admin;
import com.designal.vaccines.entity.User;
import com.designal.vaccines.service.AdminService;
import com.designal.vaccines.service.UserService;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet",urlPatterns = "/adminServlet")
public class AdminServlet extends BasicServlet {

    private AdminService service = new AdminService();

    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        Admin admin = service.login(name, password);
        if(admin!=null){
            request.setAttribute("admin",admin);
            request.getRequestDispatcher(request.getContextPath()+"backstage/page/adminPage/admin_index.jsp").forward(request,response);
        }
    }

    //查看省疾控中心人员列表
    public void viewAllPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> userList = userService.viewProUserList();
        if(userList!=null){
            Result result = new Result(userList);
            RespWriterUtil.writer(response,result);
        }
    }

    //查看市疾控中心人员列表
    public void viewAllCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }




}
