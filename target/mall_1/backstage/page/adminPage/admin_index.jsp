<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
    <title>管理员首页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js"></script>

    </head>

    <body class="layui-layout-body">
    <c:set value="${pageContext.request.contextPath}" var="path" scope="application" ></c:set>

    <div class="layui-layout layui-layout-admin">

    <!-- 头部区域-->
    <div class="layui-header layui-bg-cyan">
        <div class="layui-logo layui-bg-green"><a href="${path}/backstage/page/adminPage/admin_index.jsp">管理员页面</a></div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a onclick="index()">首页</a></li>

            <li class="layui-nav-item"><a onclick="logout()">注销</a></li>
        </ul>
    </div>

    <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
    <div class="layui-side layui-bg-cyan">
        <div class="layui-side-scroll">

            <ul class="layui-nav layui-nav-tree layui-bg-cyan"  lay-filter="test">

                <li class="layui-nav-item">
                    <a href="javascript:;">省疾控中心人员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${path}/backstage/page/adminPage/admin_ProUserList.jsp">查询人员列表</a></dd>
                        <dd><a href="${path}/backstage/page/adminPage/pro_register.jsp">添加省疾控中心人员</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;">市疾控中心人员管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${path}/backstage/page/adminPage/admin_CityUserList.jsp">查询人员列表</a></dd>
                        <dd><a href="${path}/backstage/page/adminPage/city_register.jsp">添加市疾控中心人员</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <h1 id="h1" style="color: crimson">管理员页面</h1>
        <iframe src="" id="main" name="content" height="100%" width="100%"></iframe>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © designal.com - 山西省疾控中心疫苗管理系统
    </div>
</div>
    <script>
        //JavaScript代码区域
        layui.use(['element','jquery'], function(){
            var element = layui.element;
            var  $ = layui.jquery;
            $(document).ready(function () {
                $("dd>a").click(function (e) {
                    e.preventDefault();
                    $('#h1').html("");
                    $('#main').attr("src",$(this).attr("href"));
                });
            });

        });
    </script>
</body>

<script>

    function index() {
        <%--<a href="${path}/lb1.jsp">首页</a>--%>
        window.document.location.href = "${path}/index.jsp";
    }
    function logout() {
        window.document.location.href = "${path}/index.jsp";
    }
</script>

</html>
