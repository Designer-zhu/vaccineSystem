package com.designal.vaccines.controller;

import com.designal.vaccines.entity.Admin;
import com.designal.vaccines.entity.User;
import com.designal.vaccines.service.AdminService;
import com.designal.vaccines.service.UserService;
import com.designal.vaccines.utils.CommonUtils;
import com.designal.vaccines.utils.MD5Utils;
import com.designal.vaccines.utils.MailUtils;
import com.designal.vaccines.vo.RespWriterUtil;
import com.designal.vaccines.vo.Result;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "AdminServlet",urlPatterns = "/adminServlet")
@MultipartConfig//以二进制方式获取属性值
public class AdminServlet extends BasicServlet {

    private AdminService service = new AdminService();
    private UserService userService = new UserService();

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
        List<User> userList = userService.viewProUserList();
        if(userList!=null){
            Result result = new Result(userList);
            RespWriterUtil.writer(response,result);
        }
    }

    //查看市疾控中心人员列表
    public void viewAllCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.viewCityUserList();
        if(userList!=null){
            Result result = new Result(userList);
            RespWriterUtil.writer(response,result);
        }
    }

    //注册
    public void register(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //根据name = value 进行获取键值对，例：name=username  value=文本和输入框中的内容
        Map<String, String[]> parameterMap = request.getParameterMap();

        //处理String -> Data类型
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class aClass, Object o) {
                Date birthday = null;
                if(o instanceof  String){
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    try {
                        birthday = simpleDateFormat.parse(request.getParameter("birthday"));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
                return birthday;
            }
        }, Date.class);

        //创建空用户
        User user = new User();

        //通过BeanUtils工具类，给user对象对应的属性根据键值对赋值
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //处理头像
        /*Part part = request.getPart("photo");
        if(part!=null){
            //获取上传上传图片信息（包括图片名称）
            String oldName = part.getHeader("content-disposition");

            if(oldName!=null && oldName.contains(".")){
                //真正成功上传图片
                //图片的新name = 随机数 + oldName的后缀
                String newName = UUID.randomUUID() +
                        oldName.substring(oldName.lastIndexOf("."),oldName.length()-1);

                //将当前图片信息存进items对象中
                user.setPhoto("/pic/"+newName);
                //将图片信息传递至本地服务器上
                part.write("D:\\IGeek\\Work-IDEA\\github--designal\\maven\\project\\temp\\"+newName);
            }
        }*/

        //设置pro_id
        user.setUser_id(CommonUtils.getUUID().replaceAll("-",""));
        //设置code
        String code = CommonUtils.getUUID().replaceAll("-","");
        user.setCode(code);
        //密码加密
        user.setPassword(MD5Utils.md5(user.getPassword()));

        //注册
        boolean flag = userService.register(user);
        if(flag){
            //注册成功
            //发送邮件
            //获取user的id
            String user_id = user.getUser_id();
            String emailMess = "恭喜您注册成功，这是一封激活邮件，请点击<a href='http://localhost:8080/adminServlet?method=active&identity="+user.getIdentity()+"&user_id="+user_id+"&code="+code+"'>"+code+"</a>激活";
            try {
                MailUtils.sendMail(user.getEmail(),"注册邮件激活",emailMess);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            Result result = new Result("激活成功");
            RespWriterUtil.writer(response,result);
            //跳转至注册成功 前往邮件激活界面
            //request.getRequestDispatcher(request.getContextPath()+"/backstage/page/pro_registerSuccess.jsp").forward(request,response);
        }else {
            //注册失败
            //request.getRequestDispatcher(request.getContextPath()+"/backstage/page/pro_registerFail.jsp").forward(request,response);
        }
    }

    //用户激活
    public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String identity = request.getParameter("identity");
        boolean flag = userService.activeState(code,identity);

        //激活成功后跳转至相应页面
        if(flag && identity.equals("pro_user")){
            //激活成功 跳转至province首页
            response.sendRedirect(request.getContextPath()+"/backstage/page/adminPage/admin_index.jsp");
        }else if(flag && identity.equals("city_user")){
            //激活成功 跳转至province首页
            response.sendRedirect(request.getContextPath()+"/backstage/page/adminPage/admin_index.jsp");
        }else {
            //激活失败
            response.sendRedirect(request.getContextPath()+"/backstage/page/pro_error.jsp");
        }


        /*//根据user_id查询user对象
        String user_id = request.getParameter("user_id");
        User user = userService.viewOneBvUser_id(user_id, identity);

        if(flag && identity.equals("pro_user")){

            //存储user信息至会话中
            //将当前查询到的用户信息存储值会话中
            HttpSession session = request.getSession();
            session.setAttribute("pro_user",user);

            //激活成功 跳转至province首页
            response.sendRedirect(request.getContextPath()+"/backstage/page/pro_index.jsp");

        }else if(flag && identity.equals("city_user")){

            //存储user信息至会话中
            //将当前查询到的用户信息存储值会话中
            HttpSession session = request.getSession();
            session.setAttribute("city_user",user);

            //激活成功 跳转至city首页
            response.sendRedirect(request.getContextPath()+"/backstage/page/cityPage/city_index.jsp");

        }else {
            //激活失败
            response.sendRedirect(request.getContextPath()+"/backstage/page/pro_error.jsp");
        }*/
    }




}
