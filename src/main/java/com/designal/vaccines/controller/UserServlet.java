package com.designal.vaccines.controller;

import com.designal.vaccines.entity.User;
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
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * @Description TODO
 * @Author designal
 * @Date 2021/2/25 21:53
 */

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")
@MultipartConfig//以二进制方式获取属性值
public class UserServlet extends BasicServlet {

    private UserService service = new UserService();

    //用户昵称校验
    /*public void validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String identity = request.getParameter("identity");
        boolean flag = service.validate(username,identity);

        //封装成json数据格式响应至客户端  json串：{"flag":flag}
        String str = "{\"flag\":"+flag+"}";
        response.getWriter().write(str);
    }*/

    //登录
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //通过MD5技术登陆密码
        String code = request.getParameter("code");
        if(code==null){
            //不是自动登录
            password = MD5Utils.md5(password);
        }

        //登录
        User user = service.login(username,password,request.getParameter("identity"));
        if(user!=null){
            //邮件已激活，可登录
            if(user.getState() == 1){

                //选择免登录
                String free = request.getParameter("free");
                //记住用户名
                String remember = request.getParameter("remember");

                //选择记住用户名：若点击了remember,则在Cookie中存储用户名
                if(remember!=null && "remember".equals(remember)){
                    Cookie usernameCookie = new Cookie("remember", URLEncoder.encode(username, "UTF-8"));
                    usernameCookie.setMaxAge(7*24*60*60);
                    response.addCookie(usernameCookie);
                }

                //若选择了自动登录，点击了free，则在Cookie中存储用户名和密码
                else if(free!=null && "free".equals(free)){
                    Cookie usernameCookie = new Cookie("username", URLEncoder.encode(username,"UTF-8"));
                    Cookie passwordCookie = new Cookie("password",password);
                    usernameCookie.setMaxAge(7*24*60*60);
                    passwordCookie.setMaxAge(7*24*60*60);
                    response.addCookie(usernameCookie);
                    response.addCookie(passwordCookie);
                }

                //将当前查询到的用户信息存储值会话中
                HttpSession session = request.getSession();

                //根据身份跳转至对应的页面
                if(user.getIdentity().equals("pro_user")){
                    session.setAttribute("pro_user",user);
                    //跳转
                    request.getRequestDispatcher(request.getContextPath()+"backstage/page/pro_index.jsp").forward(request,response);
                }else {
                    session.setAttribute("city_user",user);
                    //跳转
                    request.getRequestDispatcher(request.getContextPath()+"backstage/page/cityPage/city_index.jsp").forward(request,response);
                }

            }else{
                request.setAttribute("msg","当前账户未激活，请尽快前往您的邮箱激活！");
                request.getRequestDispatcher(request.getContextPath()+"backstage/page/pro_login.jsp").forward(request,response);
            }

        }else {
            request.setAttribute("msg","用户名与密码不匹配");
            request.getRequestDispatcher(request.getContextPath()+"backstage/page/pro_login.jsp").forward(request,response);
        }
    }

    //用户登出
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //销毁会话
        session.invalidate();

        //清除Cookie
        Cookie usernameCookie = new Cookie("username", "");
        Cookie passwordCookie = new Cookie("password","");

        usernameCookie.setMaxAge(0);
        passwordCookie.setMaxAge(0);

        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);

        request.getRequestDispatcher(request.getContextPath()+"backstage/page/pro_login.jsp").forward(request,response);
    }


    //修改基础资料
    public void update(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        Part part = request.getPart("photo");
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
        }

        //System.out.println(user);
        boolean flag = service.updateUser(user);
        if(flag){
            //修改成功
            User user1 = service.viewOneBvUser_id(user.getUser_id(), "pro_user");
            //存储user信息至会话中
            //将当前查询到的用户信息存储值会话中
            HttpSession session = request.getSession();
            session.setAttribute("pro_user",user1);

            //跳转
            response.sendRedirect(request.getContextPath()+"/backstage/page/pro_personer/pro_updatePro.jsp");

        }

    }

    //安全设置
    public void salfe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //原密码
        String password = request.getParameter("password");
        password = MD5Utils.md5(password);
        //新密码
        String newPassword = request.getParameter("newPassword");
        //确认密码
        String rePassword = request.getParameter("rePassword");

        String username = request.getParameter("username");

        //通过username和原密码查询账户
        User user = service.login(username, password,"pro_user");

        if(user!=null){
            //可更改
            if(!"".equals(newPassword)&&!"".equals(rePassword)&&newPassword.equals(rePassword)){
                //两次密码输入一致,修改用户密码
                //密码加密
                user.setPassword(MD5Utils.md5(newPassword));
                //更新密码
                boolean flag = service.updatePassword(user);
                if(flag){
                    //System.out.println("密码修改成功");
                    //更新成功，返回登陆页面
                    //记住用户名则在Cookie中存储用户名
                    Cookie usernameCookie = new Cookie("remember", URLEncoder.encode(username, "UTF-8"));
                    usernameCookie.setMaxAge(7*24*60*60);
                    response.addCookie(usernameCookie);

                    Result result = new Result("成功");
                    RespWriterUtil.writer(response,result);

                }else {
                    response.sendRedirect(request.getContextPath()+"/backstage/page/pro_error.jsp");
                }
            }else {
                response.sendRedirect(request.getContextPath()+"/backstage/page/pro_error.jsp");
            }
        }else {
            response.sendRedirect(request.getContextPath()+"/backstage/page/pro_error.jsp");
        }

    }

}
