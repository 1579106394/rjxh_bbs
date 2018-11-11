<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>模块</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath }/layui/lay/modules/layer.js"></script>

    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/css/layer.css" media="all">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="/template/u_default/css/tp5page.css">
<style type="text/css">
    .home-jieda li .mine-edit {
        margin-left: 15px;
        padding: 4px 6px;
        background-color: #8FCDA0;
        color: #fff;
        font-size: 12px;
    }
</style>
<div class="layui-container fly-marginTop fly-user-main">

    <jsp:include page="mineleft.jsp"></jsp:include>

    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20="">
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">

                <li class="layui-this">论坛模块（
                    <span id="myHuifuNum">0</span>）
                </li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                <a class='layui-btn layui-btn-xs' href="${pageContext.request.contextPath}/addMokuai.jsp">新增版块</a>

                    <table id="demo" lay-filter="test"></table>
                    <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" style=" ">
                        <div class="layui-table-box">
                            <div class="layui-table-header">
                                <table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
                                    <thead>
                                    <tr>
                                        <th al data-field="title" data-minwidth="100">
                                            <div class="layui-table-cell laytable-cell-1-title"><span>模块名称</span></div>
                                        </th>
                                        <th data-field="status">
                                            <div class="layui-table-cell laytable-cell-1-status"><span>模块路径</span></div>
                                        </th>
                                        <th data-field="4">
                                            <div class="layui-table-cell laytable-cell-1-4"><span>操作</span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="layui-table-body layui-table-main">
                                <table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
                                    <tbody id="myHuifuTbody">

                                    </tbody>
                                </table>
                                <div id="myHuifuNone" class="layui-none">无数据</div>

                            </div>
                        </div>
                        <div class="layui-table-page layui-hide">
                            <div id="layui-table-page1"></div>
                        </div>
                        <style>
                            .laytable-cell-1-title {
                                width: 400px;
                            }

                            .laytable-cell-1-status {
                                width: 400px;
                            }

                            .laytable-cell-1-4 {
                                width: 100px;
                            }
                        </style>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!--页面JS脚本-->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>
<ul class="layui-fixbar">
    <li class="layui-icon" lay-type="bar1" style="background-color:#009688"></li>
    <li class="layui-icon layui-fixbar-top" lay-type="top" style="background-color:#009688"></li>
</ul>

<script type="text/javascript">
    /* ajax加载模块 */
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/type/ajaxGetTypeList.action",
            contentType: "application/json;charset=UTF-8",
            type: "post",
            dataType: "json",
            success: function (data) {
                var commonList = eval(data);
                var tbody = document.getElementById("myHuifuTbody");
                var trArrays = tbody.getElementsByTagName("tr");
                //清除操作
                for (var i = 0; i < trArrays.length; i++) {
                    tbody.removeChild(trArrays[i]);
                    i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
                        //如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
                }

                for (var i = 0; i < commonList.length; i++) {
                    $("#myHuifuNone").html("");
                    $("#myHuifuNum").html(commonList.length);

                    $("#myHuifuTbody").append(
                        "<tr>                                                                                                 " +
                        "	<td  data-minwidth='100'>                                                                         " +
                        "		<div class='layui-table-cell laytable-cell-1-title'><span>" + commonList[i].name +
                        "</span></div>               " +
                        "	</td>                                                                                             " +
                        "	<td >                                                                                             " +
                        "		<div class='layui-table-cell laytable-cell-1-status'><span>" + commonList[i].url + "</span></div>   " +
                        "	</td>                                                                                             " +
                        "	<td >                                                                                           " +
                        "		<div class='layui-table-cell laytable-cell-1-4'><span>" +
                        "<div class='layui-btn-group'>                " +
                        "  <a class='layui-btn layui-btn-xs' href='${pageContext.request.contextPath}/type/toEdit"+commonList[i].typeId+".html'>编辑</a>    " +
                        "  <button class='layui-btn layui-btn-xs'onclick='deleteHuifu(" + commonList[i].typeId + ")'>删除</button>    " +
                        "</div>                                       " +

                        "</span></div>                       " +
                        "	</td>                                                                                             " +
                        "</tr>		                                                                                          "
                    );
                }


            }
        });
    });

    /* 删除帖子 */
    function deleteHuifu(id) {
        layer.confirm('确定要删除吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            window.location.href = "${pageContext.request.contextPath}/type/deleteType" + id + ".html";
            layer.close(index);
        });
    }

    /* 编辑帖子 */
    function editHuifu(id) {

    }

</script>

</body>

</html>