
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>疫苗统计一</title>

    <!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/backstage/js/echarts.min.js"></script>


</head>
<body>

    <%--标题--%>
    <div id="h1" style="margin-left: 20px;margin-top: 10px"><h1  style="color: slategrey">疫苗请求量</h1></div>
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
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                left: 'center',
                top: 'bottom',
                data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            series: [
                {
                    name: '请求量--2019',
                    type: 'pie',
                    radius: '50%',
                    center: ['20%', '50%'],
                    roseType: 'radius',
                    itemStyle: {
                        borderRadius: 5
                    },
                    label: {
                        show: false
                    },
                    emphasis: {
                        label: {
                            show: true
                        }
                    },
                    data: [
                        {value: 40, name: '乙肝疫苗'},
                        {value: 38, name: '卡介苗'},
                        {value: 32, name: '狂犬疫苗'},
                        {value: 30, name: '百白破疫苗'},
                        {value: 28, name: '脊灰疫苗'},
                        {value: 26, name: 'HIB疫苗'},
                        {value: 22, name: '流感疫苗'},
                        {value: 18, name: '麻疹疫苗'}
                    ]
                },
                {
                    name: '请求量--2020',
                    type: 'pie',
                    radius: '90%',
                    center: ['71%', '50%'],
                    roseType: 'area',
                    itemStyle: {
                        borderRadius: 5
                    },
                    data: [
                        {value: 40, name: '乙肝疫苗'},
                        {value: 38, name: '卡介苗'},
                        {value: 32, name: '狂犬疫苗'},
                        {value: 30, name: '百白破疫苗'},
                        {value: 28, name: '脊灰疫苗'},
                        {value: 26, name: 'HIB疫苗'},
                        {value: 22, name: '流感疫苗'},
                        {value: 18, name: '麻疹疫苗'}
                    ]
                }
            ]
        };

        option && myChart.setOption(option);
    </script>

</body>
</html>
