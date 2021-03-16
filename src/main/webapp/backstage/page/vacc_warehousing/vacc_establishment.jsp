<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>疫苗初期建账</title>
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
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">疫苗期初建账</h1></div>
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

    <%--行工具栏--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="warehousing">入库</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <%--table数据表格--%>
    <table id="test" lay-filter="test"></table>

    <%--弹出层新增疫苗信息from表单--%>
    <script type="text/html" id="addNew">
        <form class="layui-form layui-form-pane" style="margin-left: 40px">

            <div class="layui-form-item" style="margin-top: 10px">
                <label class="layui-form-label">疫苗名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="v_name" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">疫苗批号</label>
                <div class="layui-input-inline">
                    <input type="text" name="v_batch" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text" style="margin-right: 48px">
                <label class="layui-form-label">疫苗介绍与描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="v_detail" class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item layui-form-text" style="margin-right: 48px;margin-bottom: 0px;">
                <label class="layui-form-label">疫苗出厂地址</label>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">省份：</label>
                <div class="layui-input-inline">
                    <select name="province" lay-filter="bigType">
                        <option value="" selected="">请选择省</option>
                        <option value="1" >浙江省</option>
                        <option value="2">安徽省</option>
                        <option value="3">江苏</option>
                        <option value="4">陕西省</option>
                        <option value="5">湖北省</option>
                        <option value="6">湖南省</option>
                    </select>
                </div>

                <label class="layui-form-label">地区市：</label>
                <div class="layui-input-inline">
                    <select name="city" id="smallType">
                        <option value="">请选择区/市</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">生产日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="v_date" id="date1" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">截止有效期</label>
                    <div class="layui-input-block">
                        <input type="text" name="v_term" id="date2" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item" style="margin-top: 10px">

                <div class="layui-form-item">
                    <label class="layui-form-label">疫苗规格</label>
                    <div class="layui-input-block">
                        <input type="text" name="v_spec" lay-verify="title" autocomplete="off" placeholder="请输入" class="layui-input">
                    </div>
                </div>

                <label class="layui-form-label">疫苗分类</label>
                <div class="layui-input-block" >
                    <input type="radio" id="c_id" name="c_id" value="1" title="一类疫苗" checked >
                    <input type="radio" name="c_id" value="2" title="二类疫苗">
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
                ,url: '/preServlet?method=viewAll' //数据接口
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
                ,title: '疫苗预存信息表'
                ,limit:Number.MAX_VALUE
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field: 'v_id', title: 'ID', sort: true, fixed: 'left'}
                    ,{field: 'v_name', title: '疫苗名称'}
                    ,{field: 'v_detail', title: '描述'}
                    ,{field: 'v_site', title: '出厂商'}
                    ,{field: 'v_date', title: '生产日期',
                        templet: "<div>{{layui.util.toDateString(d.v_date, 'yyyy-MM-dd')}}</div>",edit: true
                    }
                    ,{field: 'v_term', title: '截止有效期',type:'date',
                        templet: "<div>{{layui.util.toDateString(d.v_date, 'yyyy-MM-dd')}}</div>",edit: true
                    }
                    ,{field: 'v_spec', title: '规格'}
                    ,{field: 'v_batch', title: '批号'}
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

            //搜索按钮绑定事件
            var $ = layui.$, active = {
                reload: function(){
                    var v_id = $('#demoReload');

                    //执行重载
                    table.reload('testReload', {


                        /*page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,*/where: {
                            query: v_id.val()
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

            //监听行工具栏事件
            table.on('tool(test)', function(obj){
                var event = obj.event; //事件名称
                var data = obj.data; //行中的信息

                //console.log(data);
                //console.log(event);

                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        //调用删除方法
                        delByV_id(data);
                    });
                } else if(obj.event === 'warehousing'){ //入库
                    //调用入库方法
                    warehousing(data);
                }

                //调用入库方法
                function warehousing(data) {
                    layer.confirm("确定入库选中的疫苗吗？", function (index) {
                        var v_id = data.v_id;
                        $.post("/preServlet?method=warehousing&v_id="+v_id, function (rs) {
                            //判断业务响应码
                            if (rs.code == 200) {
                                layer.msg("入库成功");

                                //通过搜索进行刷新
                                $('.demoTable .layui-btn').click();

                                layer.close(index);
                                return false;
                            }
                            layer.msg("入库失败");
                            layer.close(index);
                        });
                    });
                }

                //删除单行的方法
                function delByV_id(data) {
                    layer.confirm("确定删除选中的疫苗吗？", function (index) {
                        var v_id = data.v_id;
                        $.post("/preServlet?method=delete&v_id="+v_id, function (rs) {
                            //判断业务响应码
                            if (rs.code == 200) {
                                layer.msg("删除成功");

                                //通过搜索进行刷新
                                $('.demoTable .layui-btn').click();

                                layer.close(index);
                                return false;
                            }
                            layer.msg("删除失败");
                            layer.close(index);
                        });
                    });
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
                var v_id = "";
                //console.log(data);
                $.each(data, function (index, value) {
                    v_id += value.v_id + "@";//传回后台的是2&3...
                });
                //console.log(v_id)
                $.post("/preServlet?method=delete&v_id="+v_id, function (rs) {
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
                    area: ['700', '500'],
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
                            $.post("/preServlet?method=addNew", d.field, function (rs) {
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

                        laydate.render({
                            elem:'#date2',
                            trigger:'click', //呼出事件改为click
                            format:'yyyy-MM-dd'
                        });

                        //二级联动选择城市
                        form.on('select(bigType)', function (data) {
                            //console.log(data)
                            $.post("/cityServlet?method=viewCity&p_id=" + (data.value), function (data) {

                                //判断业务响应码
                                if (data.code == 200) {
                                    var optionstring = "";

                                    $.each(data.data, function (index, city) {
                                        optionstring += "<option value=\"" + city.c_id + "\">" + city.c_name + "</option>";
                                        //console.log(city.c_id)
                                        //console.log(city.c_name)
                                    });
                                    $("#smallType").html('<option value=""></option>' + optionstring);
                                    form.render('select'); //这个很重要

                                }


                            });
                        });
                    }
                });
            }

        });
    </script>

</body>
</html>
