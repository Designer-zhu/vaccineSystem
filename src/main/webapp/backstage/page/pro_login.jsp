<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>登录</title>
	<link href="http://cdn.bootcss.com/jqueryui/1.11.0/jquery-ui.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backstage/css/default.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/backstage/css/styles.css">
	<%--<script src="Sliding_Validation_Gu/jquery.min.js"></script>
	<script src="Sliding_Validation_Gu/Sliding_Validation_Gu.js" type="text/javascript" charset="utf-8"></script>--%>


</head>
<body>

	<%--自动登录--%>
	<%! String remember = ""; %>
	<%
		String username = null;
		String password = null;

		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				if(cookie!=null){
					if(cookie.getName().equals("username")){
						username = URLDecoder.decode(cookie.getValue(),"UTF-8");
					}
					if(cookie.getName().equals("password")){
						password = cookie.getValue();
					}
					if(cookie.getName().equals("remember")){
						remember = URLDecoder.decode(cookie.getValue(),"UTF-8");
					}
				}
			}
		}

		if(username!=null && password!=null){
			request.getRequestDispatcher(request.getContextPath()+"/userServlet?method=login&identity=pro_user&code=free&username="+username+"&password="+password).forward(request,response);
		}
	%>


	<c:set value="${pageContext.request.contextPath}" scope="application" var="path" ></c:set>

	<header class="htmleaf-header">
		<h1>省疾控中心管理人员</h1>
	</header>


	<div class='login'>

		<c:if test="${msg!=null}">
			<div class="form-group">
				<label for="msg" class="col-sm-2 control-label" style="color: red">tips:</label>
				<div class="col-sm-6">
					<span id="msg" style="color: red">${msg}</span>
				</div>
			</div>
		</c:if>

		  <div class='login_title'>
			<span>请输入您的账户</span>
		  </div>

		<form action="${pageContext.request.contextPath}/userServlet?method=login&identity=pro_user" method="post">
			<div class='login_fields'>
				<div class='login_fields__user'>
					<div class='icon'>
						<img src='${path}/backstage/images/user_icon_copy.png'>
					</div>
					<%
						if(remember==null || remember.equals("")){
					%>
					<input placeholder='请输入用户名' type='text' name="username" id="username">
					<%
						}
					%>

					<%
						if(remember!=null && !remember.equals("")){
					%>
					<input placeholder='请输入用户名' type='text' name="username" id="username" value="<%= remember %>">
					<%
						}
					%>

					<div class='validation'>
						<img src='${path}/backstage/images/tick.png'>
					</div>
					</input>

				</div>

				<div class='login_fields__password'>
					<div class='icon'>
						<img src='${path}/backstage/images/lock_icon_copy.png'>
					</div>
					<input placeholder='请输入密码' type='password' name="password" id="password">
					<div class='validation'>
						<img src='${path}/backstage/images/tick.png'>
					</div>
				</div>

				<div class="form-group" style="margin-top: 30px; margin-left: 30px">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="free" value="free"> 自动登录
							</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>
								<input type="checkbox" name="remember" value="remember"> 记住用户名
							</label>
						</div>
					</div>
				</div>

				<div class='login_fields__submit'>
					<input type='button' value='登录'>
					<div class='forgot'>
						<a href='${path}/index.jsp'>返回</a>
					</div>
				</div>

			</div>

			<div class='success'>
				<h2>确认验证结果</h2>
				<input type="submit" value="确认">
				<%--<script type="text/javascript">
						var sliding_validation = SlidingValidation.create($('body'),{},function(){});

						/**
						 *参数1 —— 在传入的元素的结尾插入-obj
						 */

						/**
						 *参数2 —— 修改滑动验证的样式-{"key":"value"}
						 * position: "relative", 滑动验证的定位
						 top: "0px", 滑动验证的top值
						 left: "0px", 滑动验证的left值
						 slide_block_wrapper_width: "300px", 滑动验证的宽度
						 slide_block_wrapper_height: "40px", 滑动验证的高度
						 slide_block_width: "50px", 滑动块的宽度
						 slide_block_height: "100%", 滑动块的高度
						 margin: "0px 0px 0px 0px", 滑动验证的marigin
						 slider_wrapper_zindex: 10000, 滑动验证的z-index
						 slider_wrapper_bg: "#e8e8e8", 滑动验证的背景颜色
						 slider_bg: "rgb(255,255,255)", 滑块的背景颜色
						 progress_bg: "rgb(255,184,0)", 滑动进度的背景颜色
						 default_text: "请向右滑动滑块", 滑动区域的文字
						 default_text_color: "black", 滑动文字的默认颜色
						 success_text_color: "white", 成功后滑动文字的颜色
						 default_text_font_size: "12px", 滑动文字的文字大小
						 success_show_text: "验证成功", 验证成功后滑动文字的内容
						 success_slider_wrapper_bg: "rgb(76,175,80)", 滑动成功后 滑动进度的背景颜色
						 success_url_icon: "sliding_block_image/ok.png", 滑动成功后滑块上面的图片 url地址
						 default_url_icon: "sliding_block_image/right-arrow.png",  默认滑块上面的url地址
						 box_shadow: "1px 1px 5px rgba(0,0,0,0.2)", 滑动验证的阴影
						 border: "1px solid #ccc" 滑块的border
						 */

						/**
						 *参数3 —— 滑动验证成功之后执行的方法-function(){}
						 */
					</script>--%>

			</div>

		</form>

	</div>

	<div class='authent'>
	  <img src="${path}/backstage/images/puff.svg">
	  <p>正在登录验证...</p>
	</div>

	<script src='${path}/backstage/js/stopExecutionOnTimeout.js?t=1'></script>
	<script src="${path}/backstage/js/jquery-2.1.1.min.js"></script>
	<script src="http://cdn.bootcss.com/jqueryui/1.11.0/jquery-ui.min.js"></script>
	<script>
	$('input[type="button"]').click(function () {
	    $('.login').addClass('test');
	    setTimeout(function () {
	        $('.login').addClass('testtwo');
	    }, 300);
	    setTimeout(function () {
	        $('.authent').show().animate({ right: -320 }, {
	            easing: 'easeOutQuint',
	            duration: 600,
	            queue: false
	        });
	        $('.authent').animate({ opacity: 1 }, {
	            duration: 200,
	            queue: false
	        }).addClass('visible');
	    }, 500);
	    setTimeout(function () {
	        $('.authent').show().animate({ right: 90 }, {
	            easing: 'easeOutQuint',
	            duration: 600,
	            queue: false
	        });
	        $('.authent').animate({ opacity: 0 }, {
	            duration: 200,
	            queue: false
	        }).addClass('visible');
	        $('.login').removeClass('testtwo');
	    }, 2500);
	    setTimeout(function () {
	        $('.login').removeClass('test');
	        $('.login div').fadeOut(123);
	    }, 2800);
	    setTimeout(function () {
	        $('.success').fadeIn();
	    }, 3200);
	});
	$('input[type="text"],input[type="password"]').focus(function () {
	    $(this).prev().animate({ 'opacity': '1' }, 200);
	});
	$('input[type="text"],input[type="password"]').blur(function () {
	    $(this).prev().animate({ 'opacity': '.5' }, 200);
	});
	$('input[type="text"],input[type="password"]').keyup(function () {
	    if (!$(this).val() == '') {
	        $(this).next().animate({
	            'opacity': '1',
	            'right': '30'
	        }, 200);
	    } else {
	        $(this).next().animate({
	            'opacity': '0',
	            'right': '20'
	        }, 200);
	    }
	});
	var open = 0;
	$('.tab').click(function () {
	    $(this).fadeOut(200, function () {
	        $(this).parent().animate({ 'left': '0' });
	    });
	});
	</script>
</body>
</html>