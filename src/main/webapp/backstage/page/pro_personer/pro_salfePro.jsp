<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>基础资料</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js"></script>
</head>
<body>
    <!-- 表头 -->
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">安全设置</h1></div>
    <br />
    <hr />
    <br />

    <fieldset class="layui-elem-field">
        <legend>修改</legend>
        <div class="layui-field-box">
            <form class="layui-form" action="" method="post" lay-filter="example">
                <input type="hidden" name="username" value="${pro_user.username}">

                <div class="layui-form-item">
                    <label class="layui-form-label">原密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="password" name="password" lay-verify="title" autocomplete="off"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="newPassword" name="newPassword" lay-verify="title" autocomplete="off"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" id="rePassword" name="rePassword" lay-verify="title" autocomplete="off"  class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn" id="submit" lay-submit lay-filter="*">立即提交</button>
                        <button type="reset" class="layui-btn" lay-submit="" lay-filter="demo2">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>

    <script>
        layui.use(['form', 'jquery', 'layer'], function() {
            //定义模块
            var form = layui.form; //表单
            var $ = layui.jquery;
            var layer = layui.layer; //弹出层

            form.on('submit(*)', function(data){
                //console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                $.post('${pageContext.request.contextPath}/userServlet?method=salfe',data.field,function (rs) {
                    if(rs.code == 200){
                        //layer.alert("修改成功");
                        alert("修改成功");
                        parent.document.location.href = '${pageContext.request.contextPath}/backstage/page/pro_login.jsp';
                    }else {
                        //layer.alert("修改失败");
                        alert("修改失败");
                        $("#password").val("");
                        $("#newPassword").val("");
                        $("#rePassword").val("");
                    }

                    //return false;
                })

                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });


        });


    </script>
</body>
</html>
