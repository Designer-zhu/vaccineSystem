<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运输及存贮</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/backstage/js/jquery-1.11.3.min.js"></script>

    <style>
        table {
            width: 100%;
        }

        th {
            background-color: #4CAF50;
            color: white;
            height: 50px;
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {background-color: #f5f5f5;}

        tr:nth-child(even) {background-color: #f2f2f2;}
    </style>

</head>
<body>

    <div class="layui-carousel" id="test10">

        <c:set value="${pageContext.request.contextPath}" scope="application" var="path"></c:set>

        <div carousel-item="">
            <div><img src="${pageContext.request.contextPath}/backstage/images/slider-03.jpg"></div>
            <div><img src="${pageContext.request.contextPath}/backstage/images/slider-03.jpg"></div>
            <div><img src="${pageContext.request.contextPath}/backstage/images/slider-03.jpg"></div>
            <div><img src="${pageContext.request.contextPath}/backstage/images/slider-03.jpg"></div>
        </div>

    </div>
    <br>

    <fieldset class="layui-elem-field">
        <legend>疫苗运输及存储方式</legend>
        <div class="layui-field-box" >
            <center>
                <form action="" method="post" style="">
                    <table style="text-align: center;" id="testTable">
                        <tr>
                            <th>ID</th>
                            <th>疫苗名称</th>
                            <th>疫苗规格</th>
                            <th>疫苗数量</th>
                            <th>目标地址</th>
                            <th>运输方式</th>
                            <th>存储方式</th>
                            <th>操作</th>
                        </tr>

                    </table>

                </form>
            </center>

        </div>
    </fieldset>



    <script>

        layui.use(['carousel', 'form'], function(){
            var carousel = layui.carousel
                ,form = layui.form;

            //图片轮播
            carousel.render({
                elem: '#test10'
                ,width: '100%'
                ,height: '200px'
                ,interval: 5000
            });

        });

    </script>

</body>

<script>

    var data = "";
    $.ajax({
        type:"post",
        url:"${path}/transportServlet?method=sto_tans",
        dataType:"json",
        success:function (rsList) {

            for(var i in rsList){
                data += "<tr><td>"+rsList[i].id+"</td><td>"+rsList[i].vaccineName+"</td><td>"+rsList[i].vaccineSpec+"</td><td>"+rsList[i].vaccineNumber+"</td>" +
                    "<td>"+rsList[i].location+"</td><td>"+
                    "<select name=\"transport\">" +
                    "<option value=\"long\">长途运输</option><option value=\"short\">短程运输</option></select>" +
                    "</td><td>" +
                    "<select name=\"storage\">" +
                    "<option value=\"lower\">0-8低温存储</option><option value=\"former\">常温存储</option></select>" +
                    "</td><td><a href="+"${path}/transportServlet?method=submit&id="+rsList[i].id+">提交</a></td></tr>";
            }
            var htmlElement = document.getElementById("testTable");
            htmlElement.innerHTML += data+"<br>";
        }
    });
</script>
</html>