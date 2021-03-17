<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>疫苗入库请求</title>
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
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">疫苗入库请求</h1></div>
    <hr />

    <!--搜索框-->
    <div class="demoTable">
        搜索疫苗ID：
        <div class="layui-inline">
            <input class="layui-input" name="i" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload" id="serachBtn">搜索</button>
    </div>

    <%--头部工具栏--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="addNewVaccines" id="addBtn">新增疫苗</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delMany" id="delBtn">批量删除</button>
        </div>
    </script>


    <%--table数据表格--%>
    <table id="test" lay-filter="test"></table>

    <%--弹出层新增疫苗信息from表单--%>
    <script type="text/html" id="addNew">
        <form class="layui-form layui-form-pane" style="margin-left: 40px">

            <div class="layui-form-item" style="margin-top: 10px">

                <div class="layui-form-item">
                    <label class="layui-form-label">疫苗名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="vaccineName" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">请求地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="location" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">请求日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="requestDate" id="date1" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">疫苗规格</label>
                    <div class="layui-input-block">
                        <input type="text" name="vaccineSpec" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">疫苗数量</label>
                    <div class="layui-input-block">
                        <input type="text" name="vaccineNumber" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
                    </div>
                </div>

            </div>

            <!--添加隐藏的监听事件-->
            <input type="hidden" lay-submit lay-filter="submitFormFilter" id="submitForm"/>
        </form>
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
                ,url: '/requestMessServlet?method=viewAll' //数据接口
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
                ,title: '疫苗预存信息表'
                ,limit:Number.MAX_VALUE
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field: 'id', title: 'ID', sort: true, fixed: 'left'}
                    ,{field: 'vaccineName', title: '疫苗名称'}
                    ,{field: 'vaccineSpec', title: '疫苗规格'}
                    ,{field: 'vaccineNumber', title: '疫苗数量'}
                    ,{field: 'location', title: '请求地址'}
                    ,{field: 'requestDate', title: '生产日期',
                        templet: "<div>{{layui.util.toDateString(d.requestDate, 'yyyy-MM-dd')}}</div>",edit: true
                    }
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

            //搜索按钮绑定事件
            var $ = layui.$, active = {
                reload: function(){
                    var id = $('#demoReload');

                    //执行重载
                    table.reload('testReload', {


                        /*page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,*/where: {
                            query: id.val()
                        }
                    }, 'data');
                }
            };

            //搜索按钮绑事件
            $('.demoTable .layui-btn').on('click', function(){
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

            //监听头部工具栏事件,可解决按钮失效问题
            table.on("toolbar(test)",function (obj) {
                switch (obj.event) {
                    case 'addNewVaccines':
                        addNew();
                        break;
                    case 'delMany':
                        delV();
                        break;
                }

            });

            //批量删除疫苗的方法
            function delV() {
                //获取选中的id
                var checkStatus = table.checkStatus("testReload");
                var data = checkStatus.data;
                //console.log(data);
                if (data.length == 0) {
                    layer.msg("请先选择要删除的数据");
                    return false;
                }
                layer.confirm("确定删除选中的商品吗？", function (index) {
                    delPreVacc(data, index);
                })

            }

            //批量删除的具体方法
            function delPreVacc(data, index) {
                var id = "";
                //console.log(data);
                $.each(data, function (index, value) {
                    id += value.id + "@";//传回后台的是2@3...
                });
                //console.log(v_id)
                $.post("/requestMessServlet?method=delete&id="+id, function (rs) {
                    if (rs.code == 200) {
                        layer.msg("删除成功");
                        //通过搜索进行刷新
                        $('.demoTable .layui-btn').click();

                        layer.close(index);
                        // window.location.reload();
                        return false;
                    }
                    //删除失败显示失败信息，并关闭弹窗
                    layer.msg(rs.msg);
                    layer.close(index);
                });

            }

            //新增的具体方法
            function addNew() {
                layer.open({
                    id: "addNewVaccine",
                    type: 1,
                    content: $("#addNew").html(),
                    btn: ['提交', '取消'],
                    area: ['700', '400'],
                    yes: function (layero, index) {//点击提交时触发
                        $("#submitForm").click();
                    },
                    btnAlign: 'c',
                    success: function (layero, index) {//页面弹出成功触发
                        //更新渲染表单
                        form.render(); //更新全部
                        form.render('select'); //刷新select选择框渲染

                        //为表单新增监听提交事件
                        form.on("submit(submitFormFilter)", function (d) {
                            $.post("/requestMessServlet?method=insertRequest", d.field, function (rs) {
                                //业务正常
                                if (rs.code == 200) {
                                    layer.msg("新增成功");

                                    //通过搜索进行刷新
                                    $('.demoTable .layui-btn').click();

                                    layer.close(index);
                                    return false
                                }
                                layer.msg("添加失败");
                                layer.close(index);
                            });
                        });

                        //渲染日期控件
                        laydate.render({
                            elem:'#date1',
                            trigger:'click', //呼出事件改为click
                            format:'yyyy-MM-dd'
                        });
                    }
                });
            }

        });
    </script>

</body>
</html>
