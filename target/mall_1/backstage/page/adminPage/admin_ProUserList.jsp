<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>省疾控中心人员列表</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>

    <%-- 隐藏域：存储项目发布路径 --%>
    <input type="hidden" id="path" value="${pageContext.request.contextPath}" />

    <%--表名--%>
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">省疾控中心人员列表</h1></div>
    <hr />

    <%--数据表格--%>
    <table id="test" lay-filter="test"></table>

    <script>
    //全部疫苗
    //引入所需模块组件
    layui.use('table', function(){
        //定义模块
        var table = layui.table; //表格

        /*初始化表格*/
        var t = table.render({
            elem: '#test'
            ,url: '/adminServlet?method=viewAllPro' //数据接口
            /*,height: 'full-15' //!*/
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
            ,title: '疫苗信息表'
            ,cols: [[
                {field: 'user_id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'username', title: '用户名'}
                ,{field: 'sex', title: '性别'}
                ,{field: 'email', title: '邮箱'}
                ,{field: 'birthday', title: '出生日期',
                        templet: "<div>{{layui.util.toDateString(d.birthday, 'yyyy-MM-dd')}}</div>"}
                ,{field: 'telephone', title: '电话'}
                ,{field: 'photo', title: '头像'}
            ]],
            parseData: function (rs) {//数据格式解析
                console.log(rs);
                return {
                    "code": rs.code,
                    "msg": rs.msg,
                    "data": rs.data
                }
            },
            response: {//设置响应码
                statusCode: 200
            }
        });

    });



</script>
</body>

</html>
