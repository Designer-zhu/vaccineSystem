//注册页面校验
$(function(){
    $("#registerForm").validate({

        //规则：
        rules:{
            "username":{
                "required":true,
                "validateName":true
            },
            "password":{
                "required":true,
                "rangelength":[6,12]
            },
            "rePassword":{
                "required":true,
                "equalTo":"#password"
            },
            "sex":{
                "required":true
            },
            "email":{
                "required":true,
                "email":true
            },
            "birthday":{
                "required":true,
                "date":true
            },
            "telephone":{
                "required":true
            }

        },

        //信息
        messages:{
            "username":{
                "required":"昵称必填",
                "validateName":"昵称已占用"
            },
            "password":{
                "required":"密码必填",
                "rangelength":"密码长度为6~12"
            },
            "rePassword":{
                "required":"重复密码必填",
                "equalTo":"两次输入的密码要一致"
            },
            "email":{
                "required":"邮箱必填",
                "email":"邮箱格式不正确"
            },
            "telephone":{
                "required":"手机号必填"
            },
            "sex":{
                "required":"性别必选"
            },
            "birthday":{
                "required":"生日必填",
                "date":"生日格式不正确"
            }
        },

        /**
         * errorPlacement  指定错误信息出现的位置
         * 第一个参数error： 错误信息
         * 第二个参数element：产生错误的标签元素
         */
        errorPlacement: function (error, element) {
            //如果是radio或checkbox
            if (element.is(':radio') || element.is(':checkbox')) {
                //将错误信息添加到当前元素的祖父节点后面
                error.appendTo(element.parent().parent());
            } else {
                //将错误信息直接插入到当前元素的后面
                error.insertAfter(element);
            }
        }

    });
});

/**
 *  自定义校验规则：
 *  $.validator.addMethod("校验规则名称",function(输入框中的值,标签对象,输入参数){});
 */
/*
$.validator.addMethod("validateName",function(value,element,params){
    var flag = false;
    $.ajax({
        async:false,  //若为true，异步；若false，同步
        type:"post",
        url:$("#path").val()+"/userServlet?method=validate",
        data:{"username":value},
        dataType:"json",
        success:function (rs) {
            flag = rs.flag;
        }
    });
    return !flag;  //flag为true，代表存在此昵称；false为不存在此昵称
});*/
