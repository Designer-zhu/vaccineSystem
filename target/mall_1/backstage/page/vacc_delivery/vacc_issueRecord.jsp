<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>疫苗下发</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js"></script>
</head>
<body>
    <%-- 隐藏域：存储项目发布路径 --%>
    <input type="hidden" id="path" value="${pageContext.request.contextPath}" />

    <%--表名--%>
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">疫苗下发记录</h1></div>
    <hr />

    <%--数据表格--%>
    <table id="test" lay-filter="test"></table>

    <%--行工具栏--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="agree">无</a>
    </script>


    <script>
        layui.use(['form', 'jquery', 'table', 'layer', 'util','laydate'], function(){
            //定义模块
            var table = layui.table; //表格
            var form = layui.form; //表单
            var $ = layui.jquery;
            var layer = layui.layer; //弹出层
            var util = layui.util; //组件工具
            var laydate = layui.laydate;

            /*初始化表格*/
            var t = table.render({
                elem: '#test'
                ,url: '/recordServlet?method=viewAll' //数据接口
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
                ,title: '疫苗下发记录表'
                ,limit:Number.MAX_VALUE
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field: 'id', title: '请求ID', sort: true, fixed: 'left'}
                    ,{field: 'vaccineName', title: '疫苗名称'}
                    ,{field: 'location', title: '疾控中心'}
                    ,{field: 'requestDate', title: '请求日期',
                        templet: "<div>{{layui.util.toDateString(d.requestDate, 'yyyy-MM-dd')}}</div>",edit: true
                    }
                    ,{field: 'result', title: '处理结果'}
                    ,{field: 'processDate', title: '处理日期',
                        templet: "<div>{{layui.util.toDateString(d.processDate, 'yyyy-MM-dd')}}</div>",edit: true
                    }
                    ,{filed: 'right', title: '操作', toolbar: '#barDemo'}
                ]]
                ,id:'testReload',
                parseData: function (rs) {//数据格式解析
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
