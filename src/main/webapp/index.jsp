<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>山西省疾控中心疫苗管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Custom Theme files -->
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <link href="css/menufullpage.css" rel="stylesheet">
    <link href="css/fontawesome-all.min.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Fira+Sans+Condensed:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- //online-fonts -->
</head>

<body>
    <!-- header -->
    <c:set value="${pageContext.request.contextPath}" scope="application" var="path" ></c:set>
    <header>
        <!--nav -->
        <a href="#menu" class="menu-link">
            <span>toggle menu</span>
        </a>
        <nav id="menu" class="panel">
            <ul>
                <li>
                    <a href="index.jsp" class="active">首页</a>
                </li>
                <li>
                    <a href="${path}/backstage/page/adminPage/login/admin_login.jsp">管理员登录</a>
                </li>
                <li>
                    <a href="index.jsp">帮助</a>
                </li>
            </ul>
        </nav>
        <!-- //nav -->
        <!-- logo -->
        <%--<div class="logo_wthree">
            <a href="province_index.jsp">
                <i class="fab fa-node-js"></i>
            </a>
        </div>--%>
        <!-- //logo -->
    </header>
    <!-- //header -->
    <!-- banner -->
    <section class="slide-wrapper">
        <!-- banner slide -->
        <div class="agile_banner bg1">
            <div class="layer">
                <div class="container">
                    <div class="banner_text_wthree">
                        <div class="d-flex">
                            <h1 style="color: cyan">山西省 </h1>
                            <h2 style="color: cyan">疾控中心疫苗管理系统</h2>
                        </div>
                        <div id="text" class="banner_text_w3ls my-md-5 my-3"></div>
                        <ul class="list-inline bnr_list_w3">
                            <li class="list-inline-item">
                                <a class="btn  text-white  scroll" href="${path}/backstage/page/pro_login.jsp">省疾控中心 </a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn  text-white bg-dark scroll" href="${path}/backstage/page/city_login.jsp">市疾控中心</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="btn  text-white bg-dark scroll" href="${path}/backstage/page/pro_index.jsp">浏览</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //banner-->
    <!-- footer -->
    <footer>
        <div class="cpy-right text-center py-4">
            <p class="text-white">Copyright &copy; 2020.Company name All rights reserved.</p>
        </div>
    </footer>
    <!-- //footer -->
    <!-- js -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- //js -->
    <!-- few java snippets-->
    <script src="js/strive.js"></script>
    <!-- banner text animation -->
       <script>
        //text effect

        document.addEventListener('DOMContentLoaded', function (event) {

            var dataText = [
                "专 注 疫 苗 存 储 运 输 管 理",
                "最 精 准 的 调 度 与 分 发",
                "最 安 全 的 实 施 与 管 理"
            ];

            // type one text in the typwriter
            // keeps calling itself until the text is finished
            function typeWriter(text, i, fnCallback) {
                // chekc if text isn't finished yet
                if (i < (text.length)) {
                    // add next character to h1
                    document.getElementById("text").innerHTML = text.substring(0, i + 1) +
                        '<span aria-hidden="true" class="banner_text_w3ls"></span>';

                    // wait for a while and call this function again for next character
                    setTimeout(function () {
                        typeWriter(text, i + 1, fnCallback)
                    }, 50);
                }
                // text finished, call callback if there is a callback function
                else if (typeof fnCallback == 'function') {
                    // call callback after timeout
                    setTimeout(fnCallback, 1000);
                }
            }
            // start a typewriter animation for a text in the dataText array
            function StartTextAnimation(i) {
                // check if dataText[i] exists
                if (i < dataText[i].length) {
                    // text exists! start typewriter animation
                    typeWriter(dataText[i], 0, function () {
                        // after callback (and whole text has been animated), start next text
                        StartTextAnimation(i + 1);
                    });
                }
            }
            // start the text animation
            StartTextAnimation(0);
        });
    </script>

    <!-- //banner text animation -->
    <!-- nav -->
    <script src="js/menuFullpage.min.js"></script>
    <!-- //nav -->
    <!-- smooth scroll -->
    <script src="js/SmoothScroll.min.js "></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.js"></script>
</body>

</html>