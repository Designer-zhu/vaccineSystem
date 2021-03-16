<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
    <title>省疾控中心</title>
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
        <div class="layui-logo layui-bg-green"><a href="${path}/backstage/page/pro_index.jsp">省疾控中心</a></div>

       <%-- <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>--%>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a onclick="index()">首页</a></li>

            <%--未登录--%>
            <c:if test="${sessionScope.pro_user == null}">
                <li class="layui-nav-item"><a onclick="login()">登录</a></li>
            </c:if>

            <%--已登录--%>
            <c:if test="${sessionScope.pro_user != null}">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="${sessionScope.pro_user.photo}" class="layui-nav-img">
                            ${sessionScope.pro_user.username}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="${path}/backstage/page/pro_personer/pro_updatePro.jsp">基本资料</a></dd>
                        <dd><a href="${path}/backstage/page/pro_personer/pro_salfePro.jsp">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a onclick="logout()">注销</a></li>
            </c:if>
        </ul>
    </div>

    <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
    <div class="layui-side layui-bg-cyan">
        <div class="layui-side-scroll">

            <%--未登录需强制登录，否则不显示内容--%>
            <c:if test="${sessionScope.pro_user == null}">

            </c:if>

            <%--已登录--%>
            <c:if test="${sessionScope.pro_user != null}">
                <ul class="layui-nav layui-nav-tree layui-bg-cyan"  lay-filter="test">

                    <li class="layui-nav-item">
                        <a href="javascript:;">自助管理统计</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/backstage/page/vacc_total/vacc_totalOne.jsp">统计一</a></dd>
                            <dd><a href="${path}/backstage/page/vacc_total/vacc_totalTwo.jsp">统计二</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">区域化评估管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">管理一</a></dd>
                            <dd><a href="javascript:;">管理二</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">疫苗库存管理</a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;" id="menu_three">库存盘点</a>
                                <ol class="layui-nav-child" style="display: none;" >
                                    <li><a href="${path}/backstage/page/vacc_category/vacc_categoryAll.jsp">全部疫苗</a></li>
                                    <li><a href="${path}/backstage/page/vacc_category/vacc_categoryOne.jsp">一类疫苗</a></li>
                                    <li><a href="${path}/backstage/page/vacc_category/vacc_categoryTwo.jsp">二类疫苗</a></li>
                                </ol>
                            </dd>
                            <dd><a href="${path}/backstage/page/vacc_warehousing/vacc_establishment.jsp">疫苗期初建账</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">疫苗出库管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/backstage/page/vacc_delivery/vacc_issue.jsp">处理请求</a></dd>
                            <dd><a href="${path}/backstage/page/vacc_delivery/vacc_issueRecord.jsp">下发记录</a></dd>
                            <dd><a href="${path}/backstage/page/vacc_delivery/vacc_reflect.jsp">下发反映情况</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">疫苗运输方式</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/backstage/page/vacc_transport/vacc_sto_trans.jsp">运输及保存方式</a></dd>
                            <dd><a href="${path}/backstage/page/vacc_transport/vacc_transport.jsp">运输监管</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">疫苗调拨管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/backstage/page/vacc_allocation/vacc_allocationRequest.jsp" target="content">调拨请求</a></dd>
                            <dd><a href="javascript:;">处理二</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">疫苗报废</a>
                        <dl class="layui-nav-child">
                            <dd><a href="" target="content">报废处理细则</a></dd>
                        </dl>
                    </li>

                </ul>
            </c:if>

        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-body">

        <%--未登录状态--%>
        <c:if test="${sessionScope.pro_user == null}">
            <div style="padding: 15px;">请先<a href="${path}/backstage/page/pro_login.jsp">登录</a></div>
        </c:if>

        <%--已登录状态--%>
        <c:if test="${sessionScope.pro_user != null}">

            <%--title--%>
            <%--<div id="h1">
                <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">欢迎您进入山西省疾控中心疫苗管理系统</h1></div>
            </div>--%>


            <iframe src="${path}/backstage/page/lunbotu/lb2.jsp" id="main" name="content" height="100%" width="100%">

            </iframe>
        </c:if>

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
                $("li>a").click(function (e) {
                    e.preventDefault();
                    $('#h1').html("");
                    $('#main').attr("src",$(this).attr("href"));
                });
            });

            //三级菜单
            $("#menu_three").on("click",function(){
                $(this).next().toggle();
            })
            $("ol").on("click","li a",function(){
                $.each($(this).parent().siblings(),function(i,e){
                    $(e).find("a").removeClass('three_this')
                });
                $(this).addClass('three_this');
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
        window.document.location.href = "${path}/userServlet?method=logout";
    }
    function login() {
        window.document.location.href = "${path}/backstage/page/pro_login.jsp";
    }
</script>

</html>
