<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>市疾控中心人员注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js"></script>
</head>
<body>
    <!-- 表头 -->
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">市疾控中心人员注册</h1></div>
    <br />
    <hr />

    <fieldset class="layui-elem-field">
        <legend>注册</legend>
        <div class="layui-field-box">
            <form class="layui-form" action="" method="post" lay-filter="example" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="title" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="password" name="password" lay-verify="title" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="rePassword" name="rePassword" lay-verify="title" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="男" title="男" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>男</div></div>
                        <input type="radio" name="sex" value="女" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" lay-verify="title" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">出生日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="birthday" id="date1" lay-verify="date" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">联系方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="telephone" lay-verify="title" autocomplete="off" class="layui-input">
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                        <button type="reset" class="layui-btn" lay-submit="" lay-filter="demo2">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>

    <script>
        layui.use(['form', 'jquery', 'table', 'layer', 'util','laydate'], function() {
            //定义模块
            var form = layui.form; //表单
            var $ = layui.jquery;
            var layer = layui.layer; //弹出层
            var util = layui.util; //组件工具
            var laydate = layui.laydate;

            //更新渲染表单
            form.render(); //更新全部
            form.render('select'); //刷新select选择框渲染

            //为表单新增监听提交事件
            form.on("submit(*)", function (d) {
                $.post("/adminServlet?method=register&identity=city_user", d.field, function (rs) {
                    //业务正常
                    if (rs.code == 200) {
                        console.log(rs)
                        layer.msg("注册成功");
                        window.location.href = "${pageContext.request.contextPath}/backstage/page/pro_registerSuccess.jsp";

                    }else {
                        layer.msg("注册失败");
                        $("#password").val("");
                        $("#rePassword").val("");
                    }

                });
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });

            //渲染日期控件
            laydate.render({
                elem:'#date1',
                trigger:'click', //呼出事件改为click
                format:'yyyy-MM-dd'
            });


        });
    </script>

    <%--实时显示上传图片--%>
    <script type="text/javascript">
        function showPreview(source){
            var file = source.files[0];
            if(window.FileReader){
                var fr = new FileReader();
                fr.onloadend = function(e){
                    document.getElementById("itemPic").src=e.target.result;
                }
                fr.readAsDataURL(file);
            }
        }
    </script>

</body>
</html>
