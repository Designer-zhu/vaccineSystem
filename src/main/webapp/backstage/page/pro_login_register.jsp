<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html >
  <head>
  <meta charset="UTF-8">
  <title>登录与注册</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/backstage/css/style.css">
  <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/backstage/js/jquery.validate.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/backstage/js/register_validate.js" type="text/javascript"></script>

  <style>
    .error{
      color: red;
    }

  </style>
  </head>

<body>

<%--自动登录--%>
    <%! String remember = ""; %>
    <%
      String username = null;
      String password = null;

      Cookie[] cookies = request.getCookies();
      if(cookies!=null){
        for (Cookie cookie : cookies) {
          if(cookie!=null){
            if(cookie.getName().equals("username")){
              username = URLDecoder.decode(cookie.getValue(),"UTF-8");
            }
            if(cookie.getName().equals("password")){
              password = cookie.getValue();
            }
            if(cookie.getName().equals("remember")){
              remember = URLDecoder.decode(cookie.getValue(),"UTF-8");
            }
          }
        }
      }

      if(username!=null && password!=null){
        request.getRequestDispatcher(request.getContextPath()+"/userServlet?method=login&code=free&username="+username+"&password="+password).forward(request,response);
      }
    %>


<div class="cotn_principal">
  <h1 style="margin: auto">省疾控中心管理系统</h1>
  <div class="cont_centrar" style="height: 750px">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">

        <%--拟登录--%>
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>登录</h2>
            <p>已有账号，请先登录</p>
            <button class="btn_login" onClick="cambiar_login()">登录</button>
          </div>
        </div>

          <%--拟注册--%>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>注册</h2>
            <p>没有账号，请先注册</p>
            <button class="btn_sign_up" onClick="cambiar_sign_up()">注册</button>
          </div>
        </div>
      </div>

      <%--背景1--%>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="${pageContext.request.contextPath}/backstage/images/疫苗1.jpg" alt="" /> </div>
      </div>

      <%--背景2+登录+注册--%>
      <div class="cont_forms cont_forms_active_sign_up" style="height: 720px" >
        <div class="cont_img_back_"> <img src="${pageContext.request.contextPath}/backstage/images/疫苗1.jpg" alt="" /> </div>

        <%--登录--%>
        <div class="cont_form_login" > <a href="${pageContext.request.contextPath}/index.jsp" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
          <br>

          <h2>登录</h2>
          <form action="${pageContext.request.contextPath}/userServlet?method=login" method="post">

            <table style="border-spacing: 20px" >
              <tr>
                <td style="text-align: left">用户名：</td>
                <td style="text-align: left">

                  <%
                    if(remember==null || remember.equals("")){
                  %>
                  <input type="text" style="height: 40px; width: 180px;" id="username"
                         name="username" placeholder="请输入用户名" />
                  <%
                    }
                  %>

                  <%
                    if(remember!=null && !remember.equals("")){
                  %>
                  <input type="text" style="height: 40px; width: 180px;" id="username"
                         name="username" placeholder="请输入用户名" value="<%= remember %>">
                  <%
                    }
                  %>
                </td>
              </tr>

              <tr>
                <td style="text-align: left">密码：</td>
                <td style="text-align: left"><input type="password" style="height: 40px; width: 180px;" name="password" placeholder="请输入密码" /></td>
              </tr>


            <c:if test="${msg!=null}">
              <div class="form-group">
                <label for="msg" class="col-sm-2 control-label">tips:</label>
                <div class="col-sm-6">
                  <span id="msg" style="color: red">${msg}</span>
                </div>
              </div>
            </c:if>

            <tr>
              <td style="text-align: left">登陆<br>身份：</td>
              <td style="text-align: left">
                <label>
                  <input type="radio" name="identity" value="pro_user"> 省疾控中心人员
                </label>
                <br>
                <label>
                  <input type="radio" name="identity" value="city_user"> 县、市疾控中心人员
                </label>
              </td>
            </tr>
            </table>

            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="free" value="free"> 自动登录
                  </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <label>
                    <input type="checkbox" name="remember" value="remember"> 记住用户名
                  </label>
                </div>
              </div>
            </div>

            <br>

            <input type="submit" class="btn_login" style="height: 40px" value="登录">
          </form>

        </div>


        <%--注册--%>
        <div class="cont_form_sign_up"> <a href="${pageContext.request.contextPath}/index.jsp" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>注册</h2><br>
          <%-- 隐藏域：存储项目发布路径 --%>
          <input type="hidden" id="path" value="${pageContext.request.contextPath}" />

          <form id="registerForm" action="${pageContext.request.contextPath}/userServlet?method=register" method="post" enctype="multipart/form-data">
            <table style="border-spacing: 10px">
              <tr>
                <td>用户名:</td>
                <td><input style="height: 30px; width: 180px;" type="text" placeholder="请输入用户名" name="username" />
              </tr>

              <tr>
                <td>密码:</td>
                <td><input style="height: 30px; width: 180px;" type="password" id="password" placeholder="请输入密码" name="password"/>
              </tr>

              <tr>
                <td>确认密码:</td>
                <td><input style="height: 30px; width: 180px;" type="password" id="rePassword" placeholder="请确认密码" name="rePassword" />
              </tr>

              <tr>
                <td>性别:</td>
                <td><input type="radio" id="sex1" value="男" name="sex">男&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="radio" id="sex2" value="女" name="sex">女
                </td>
              </tr>

              <tr>
                <td>身份选择:</td>
                <td><input style="margin-left: 10px" type="radio" id="pro_user" value="pro_user" name="identity">省疾控中心人员<br>
                  <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                  <input style="margin-left: 10px" type="radio" id="city_user" value="city_user" name="identity">县、市疾控中心人员
                </td>
              </tr>

              <tr>
                <td>邮箱:</td>
                <td><input style="height: 30px; width: 180px;" type="text" placeholder="请输入邮箱" id="email" name="email"/>
              </tr>

              <tr>
                <td>出生日期:</td>
                <td><input style="height: 30px; width: 180px;" type="date" id="birthday" name="birthday"/>
              </tr>

              <tr>
                <td>电话:</td>
                <td><input style="height: 30px; width: 180px;" type="text" placeholder="请输入电话号码" name="telephone" id="telephone"/></td>
              </tr>

              <tr>
                <td>头像:</td>
                <td>
                  <input  style="height: 30px; width: 180px;" type="file" class="form-control" id="file" placeholder="file" name="file" onchange="showPreview(this)">
                  <span class="proof cl-orange"></span>
                </td>
              </tr>

            </table>

            <input type="submit" class="btn_sign_up"  value="注册">
          </form>

        </div>


      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/backstage/js/login.js"></script>
<script type="text/javascript">
  //将文件流以url形式读取，实现图片实时显示：
  function showPreview(source){
    var file = source.files[0];
    if(window.FileReader){
      var fr = new FileReader();
      fr.onloadend= function (ev) {
        $("#pic").attr("src",ev.target.result);
        $("#pic").css({"width":"64px","height":"auto"});
      }
      fr.readAsDataURL(file);
    }
  }
</script>
</body>
</html>
