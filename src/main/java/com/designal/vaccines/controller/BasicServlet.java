package com.designal.vaccines.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet(name = "BasicServlet")
public class BasicServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过请求参数获取对应的方法名
        String methodName = request.getParameter("method");
        //通过反射获取子类的类类型
        Class<? extends BasicServlet> clazz = this.getClass();
        //根据方法名及 方法方法参数获得方法对象
        try {
            Method declaredMethod = clazz.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            //通过反射执行具体方法的内容
            declaredMethod.invoke(this,request,response);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}
