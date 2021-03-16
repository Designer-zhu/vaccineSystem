
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>疫苗统计一</title>

    <!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/js/echarts.min.js"></script>


</head>
<body>

    <%--标题--%>
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">疫苗转运量</h1></div>
    <hr />

    <div class="layui-field-box">
        <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
        <div id="main" style="width: 100%; height: 400px;"></div>
    </div>

    <script type="text/javascript">

        var chartDom = document.getElementById('main');
        var myChart = echarts.init(chartDom);
        var option;

        option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['出库', '入库', '调拨']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'value'
                }
            ],
            yAxis: [
                {
                    type: 'category',
                    axisTick: {
                        show: false
                    },
                    data: ['太原市', '大同市', '朔州市', '忻州市', '阳泉市', '吕梁市', '晋中市']
                }
            ],
            series: [
                {
                    name: '出库',
                    type: 'bar',
                    label: {
                        show: true,
                        position: 'inside'
                    },
                    emphasis: {
                        focus: 'series'
                    },
                    data: [2, 1, 4, 4, 2, 5, 2]
                },
                {
                    name: '入库',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        show: true
                    },
                    emphasis: {
                        focus: 'series'
                    },
                    data: [2, 3, 4, 3, 3, 5, 4]
                },
                {
                    name: '调拨',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        show: true,
                        position: 'left'
                    },
                    emphasis: {
                        focus: 'series'
                    },
                    data: [-1, -2, -1, -2, -2, -3, -4]
                }
            ]
        };

        option && myChart.setOption(option);
    </script>

</body>
</html>
