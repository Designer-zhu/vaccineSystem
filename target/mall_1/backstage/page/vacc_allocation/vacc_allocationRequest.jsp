<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>调拨请求</title>
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
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">调拨请求</h1></div>
    <hr />

    <!--隐藏搜索框-->
    <div type="hidden" class="demoTable">
        搜索ID：
        <div class="layui-inline">
            <input class="layui-input" name="i" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload" id="serachBtn">搜索</button>
    </div>

    <%--数据表格--%>
    <table id="test" lay-filter="test"></table>

    <%--头部工具栏--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="addNewVaccines" id="refuseBtn">批量同意</button>
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delMany" id="">批量拒绝</button>
        </div>
    </script>

    <%--行工具栏--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="agree">调拨</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="ref">拒绝</a>
    </script>

    <%--弹出层下发疫苗具体信息from表单--%>
    <script type="text/html" id="confirm">
        <div class="layui-form" lay-filter="formTest" id="formTest">

            <div class="layui-form-item">
                <label class="layui-form-label">疫苗名称</label>
                <div class="layui-input-block">
                    <input type="text" id="vaccineName" name="vaccineName" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">规格</label>
                <div class="layui-input-block">
                    <input type="text" id="vaccineSpec" name="vaccineSpec" required  lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">数量</label>
                <div class="layui-input-block">
                    <input type="text" id="vaccineNumber" name="vaccineNumber" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">请求地址</label>
                <div class="layui-input-block">
                    <input type="text" id="location" name="location" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">调拨库存地址：</label>
                <div class="layui-input-inline">
                    <select name="allocationCity" id="allocationCity" lay-filter="bigType">
                        <option id="city" value="" selected>--请选择--</option>
                        <option  value="xi_an">西安市疾控中心</option>
                        <option  value="xian_yang">咸阳市疾控中心</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">库存量</label>
                <div class="layui-input-block">
                    <input type="text" id="v_number" name="v_number" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>


            <input type="hidden" lay-submit lay-filter="submitFormFilter" id="submitForm"/>

        </div>

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
                ,url: '/recordServlet?method=allocationView' //数据接口
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
                ,title: '疫苗请求表'
                ,limit:Number.MAX_VALUE
                ,cols: [[
                    {type: 'checkbox', fixed: 'left'}
                    ,{field: 'id', title: '请求ID', sort: true, fixed: 'left'}
                    ,{field: 'vaccineName', title: '疫苗名称'}
                    ,{field: 'vaccineSpec', title: '规格'}
                    ,{field: 'vaccineNumber', title: '数量'}
                    ,{field: 'location', title: '疾控中心'}
                    ,{field: 'requestDate', title: '请求日期',
                        templet: "<div>{{layui.util.toDateString(d.requestDate, 'yyyy-MM-dd')}}</div>",edit: true
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

            //监听头部工具栏事件,可解决按钮失效问题  --未实现
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
            table.on('tool(test)', function(obj) {
                var event = obj.event; //事件名称
                var data = obj.data; //行中的信息

                //console.log(data);
                //console.log(event);

                if (obj.event === 'ref') {
                    layer.confirm('真的拒绝么', function (index) {
                        //调用拒绝方法
                        refByV_id(data);
                    });
                } else if (obj.event === 'agree') { //调拨，转运
                    //调用调拨，转运方法
                    allocation(data);
                }

                //调拨，转运方法
                function allocation(data) {
                    layer.open({
                        id: "addNewVaccine",
                        type: 1,
                        content: $("#confirm").html(),
                        btn: ['确认', '取消'],
                        area: ['700', '500'],
                        yes: function (layero, index) {//点击提交时触发
                            $("#submitForm").click();
                        },
                        btnAlign: 'c',
                        success: function (layero, index) {//页面弹出成功触发
                            //为form表达赋值
                            //console.log(data);
                            form.val("formTest", {
                                //以键值对的新式赋值
                                'vaccineName': data.vaccineName,
                                'vaccineSpec': data.vaccineSpec,
                                'vaccineNumber': data.vaccineNumber,
                                'location': data.location
                            });

                            //更新渲染表单
                            form.render(); //更新全部
                            form.render('select'); //刷新select选择框渲染

                            //二级联动选择城市
                            form.on('select(bigType)', function (aaa) {
                                //console.log(data)
                                $.post("/allocationServlet?method=getCity_number&city_table="+aaa.value+"&v_name="+data.vaccineName+"&v_spec="+data.vaccineSpec, function (data) {
                                    //判断业务响应码
                                    if (data.code == 200) {

                                        $("#v_number").val(data.data);

                                    }
                                });

                            });


                            //为表单新增监听提交事件
                            form.on("submit(submitFormFilter)", function (d) {
                                $.post("/allocationServlet?method=updateV_number", d.field, function (rs) {
                                    //业务正常
                                    if (rs.code == 200) {
                                        layer.msg("调拨成功");

                                        //通过搜索进行刷新
                                        $('.demoTable .layui-btn').click();

                                        layer.close(index);
                                        return false
                                    }
                                    layer.msg("调拨失败");
                                    layer.close(index);
                                });
                            });

                        }
                    });
                };

                //拒绝的方法
                function refByV_id(data) {
                    layer.confirm("确定拒绝调拨吗？", function (index) {
                        var vaccineName = data.vaccineName;
                        var vaccineSpec = data.vaccineSpec;
                        $.post("/allocationServlet?method=refuse&vaccineName="+vaccineName+"&vaccineSpec="+vaccineSpec, function (rs) {
                            //判断业务响应码
                            if (rs.code == 200) {
                                layer.msg("拒绝调拨成功");

                                //通过搜索进行刷新
                                $('.demoTable .layui-btn').click();

                                layer.close(index);
                                return false;
                            }
                            layer.msg("拒绝调拨失败");
                            layer.close(index);
                        });
                    });
                };

            });


        })

    </script>

</body>
</html>
