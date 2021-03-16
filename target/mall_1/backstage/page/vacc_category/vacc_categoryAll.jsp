<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部疫苗</title>
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
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">全部库存疫苗</h1></div>
    <hr />

    <!--搜索框-->
    <div class="demoTable">
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
            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        </div>
    </script>

    <%--行工具栏--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <%--修改信息--%>
    <script type="text/html" id="editMsg">
        <div class="layui-form" lay-filter="formTest" id="formTest">

            <div class="layui-form-item">
                <label class="layui-form-label">疫苗ID</label>
                <div class="layui-input-block">
                    <input type="text" id="v_id" name="v_id" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">疫苗名称</label>
                <div class="layui-input-block">
                    <input type="text" id="v_name" name="v_name" required  lay-verify="required" placeholder="请输入疫苗名称" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">疫苗介绍与描述</label>
                <div class="layui-input-block">
                    <textarea name="v_detail" id="v_detail" placeholder="请输入疫苗介绍与描述" class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">疫苗出厂商</label>
                <div class="layui-input-block">
                    <input type="text" id="v_site" name="v_site" required  lay-verify="required" placeholder="请输入疫苗出厂商" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">生产日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="date1" name="v_date" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">截止有效期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="date2" name="v_term" class="layui-input" id="test2" placeholder="yyyy-MM-dd">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">规格</label>
                <div class="layui-input-block">
                    <input type="text" id="v_spec" name="v_spec" required  lay-verify="required" placeholder="请输入疫苗规格" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">批号</label>
                <div class="layui-input-block">
                    <input type="text" id="v_batch" name="v_batch" required  lay-verify="required" placeholder="请输入疫苗批号" autocomplete="off" class="layui-input">
                </div>
            </div>

            <input type="hidden" lay-submit lay-filter="submitFormFilter" id="submitForm"/>

        </div>

    </script>

    <script>
    //全部疫苗
    //引入所需模块组件
    layui.use(['form','table','jquery','layer','util'], function(){
        //定义模块
        var table = layui.table; //表格
        var form = layui.form; //表单
        var layer = layui.layer; //弹出层
        var util = layui.util; //组件工具

        /*初始化表格*/
        var t = table.render({
            elem: '#test'
            ,url: '/vaccineServlet?method=showVaccineByCategory' //数据接口
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            /*,height: 'full-15' //*/
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
            ,title: '疫苗信息表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'v_id', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'v_name', title: '疫苗名称'}
                ,{field: 'v_detail', title: '描述'}
                ,{field: 'v_site', title: '出厂商'}
                ,{field: 'v_date', title: '生产日期',
                        templet: "<div>{{layui.util.toDateString(d.v_date, 'yyyy-MM-dd')}}</div>"}
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
                    "count": rs.data.counts,
                    "data": rs.data.data
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

                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        search: v_id.val()
                    }
                }, 'data');
            }
        };

        //搜索按钮绑事件
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听事件
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

            };
        });

        //监听行工具事件
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
            } else if(obj.event === 'edit'){ //编辑
                //实现编辑功能 调用编辑的方法
                edit(data);
            }

            //编辑每行信息的方法
            function edit(data) {
                layer.open({ //打开弹出层
                    id:"editVaccine",
                    type:1,
                    content:$("#editMsg").html(),
                    area: ['700', '500'],
                    btn: ['确定','取消'],
                    yes:function (layero,index) {//点击提交时触发
                        //console.log(layero);
                        //console.log(index);
                        $("#submitForm").click();
                    },
                    btnAlign: 'c',
                    success: function (layero, index) {//页面弹出成功触发
                        //为form表达赋值
                        form.val("formTest",{
                            //以键值对的新式赋值
                            'v_id':data.v_id,
                            'v_name':data.v_name,
                            'v_detail':data.v_detail,
                            'v_site':data.v_site,
                            'v_date':util.toDateString(data.v_date,'yyyy-MM-dd'),
                            'v_term':util.toDateString(data.v_term,'yyyy-MM-dd'),
                            'v_spec':data.v_spec,
                            'v_batch':data.v_batch
                        });



                        //更新渲染表单
                        form.render(); //更新全部
                        form.render('select'); //刷新select选择框渲染

                        //监听表单的提交
                        form.on("submit(submitFormFilter)", function (d) {
                            //console.log(d); //d.field包括疫苗信息 全部字段
                            $.post("/vaccineServlet?method=editVaccine", d.field, function (rs) {
                                //业务正常
                                if (rs.code == 200) {
                                    layer.msg("更新成功");

                                    //刷新table
                                    //通过搜索进行刷新
                                    $('.demoTable .layui-btn').click();

                                    layer.close(index);
                                    return false;
                                }
                                layer.msg("更新失败");
                                layer.close(index);
                            });
                        });

                        //渲染日期控件
                        layui.use('laydate', function () {
                            var laydate = layui.laydate;
                            laydate.render({
                                elem: '#date1',
                                trigger: 'click'
                            });
                            laydate.render({
                                elem: '#date2',
                                trigger: 'click'
                            });
                        });

                    }



                });
            }

            //删除单行的方法
            function delByV_id(data) {
                layer.confirm("确定删除选中的商品吗？", function (index) {
                    var v_id = data.v_id;
                    $.post("/vaccineServlet?method=deleteByV_id&v_id="+v_id, function (rs) {
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



    });



</script>
</body>

</html>
