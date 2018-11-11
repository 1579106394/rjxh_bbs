<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>全部帖子</title>


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
<div class="layui-container fly-marginTop fly-user-main">

    <jsp:include page="mineleft.jsp"></jsp:include>

    <div class="site-mobile-shade"></div>
    <div class="fly-panel fly-panel-user" pad20="">

        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title" id="LAY_mine">
                <li data-type="mine-jie" lay-id="index" class="layui-this">帖子列表（
                    <span id="myCaryNum">0</span>）
                </li>
            </ul>
            <div class="layui-tab-content" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">

                    <table id="demo" lay-filter="test"></table>
                    <div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" style=" ">
                        <div class="layui-table-box">
                            <div class="layui-table-header">
                                <table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
                                    <thead>
                                    <tr>
                                        <th data-field="title" data-minwidth="300">
                                            <div class="layui-table-cell laytable-cell-1-title"><span>帖子标题</span></div>
                                        </th>
                                        <th data-field="status">
                                            <div class="layui-table-cell laytable-cell-1-3" align="center">
                                                <span>状态</span></div>
                                        </th>
                                        <th data-field="time">
                                            <div class="layui-table-cell laytable-cell-1-time" align="center">
                                                <span>发表时间</span></div>
                                        </th>
                                        <th data-field="3">
                                            <div class="layui-table-cell laytable-cell-1-4" align="center">
                                                <span>点赞</span></div>
                                        </th>
                                        <th data-field="4">
                                            <div class="layui-table-cell laytable-cell-1-3" align="center">
                                                <span>操作</span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="layui-table-body layui-table-main">
                                <table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
                                    <tbody id="myCartTbody">

                                    </tbody>
                                </table>
                                <div id="myCartNone" class="layui-none">无数据</div>

                            </div>
                        </div>
                        <div class="layui-table-page layui-hide">
                            <div id="layui-table-page1"></div>
                        </div>
                        <style>
                            .laytable-cell-1-title {
                                width: 349px;
                                text-aline: left;
                            }

                            .laytable-cell-1-status {
                                width: 100px;
                            }

                            .laytable-cell-1-time {
                                width: 165px;
                            }

                            .laytable-cell-1-3 {
                                width: 150px;
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
    /* ajax加载帖子 */
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/cart/getAllCartList.action",
            contentType: "application/json;charset=UTF-8",
            type: "post",
            dataType: "json",
            success: function (data) {
                var cartList = eval(data);
                var tbody = document.getElementById("myCartTbody");
                var trArrays = tbody.getElementsByTagName("tr");
                //清除操作
                for (var i = 0; i < trArrays.length; i++) {
                    tbody.removeChild(trArrays[i]);
                    i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
                        //如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
                }

                for (var i = 0; i < cartList.length; i++) {
                    $("#myCartNone").html("");
                    $("#myCaryNum").html(cartList.length);
                    var flag;
                    if (cartList[i].great == 2)
                        flag = "加精";
                    else if (cartList[i].top == 2)
                        flag = "置顶";
                    else
                        flag = "正常";
                        $("#myCartTbody").append(
                            "<tr>                                                                                                 " +
                            "	<td  data-minwidth='300'>                                                                         " +
                            "		<div class='layui-table-cell laytable-cell-1-title'><span>" +
                            "<a href='${pageContext.request.contextPath}/cart/" + cartList[i].cartId + ".html'>" + cartList[i].title + "</a>" +
                            "</span></div>               " +
                            "	</td>                                                                                             " +
                            "	<td >                                                                                             " +
                            "		<div class='layui-table-cell laytable-cell-1-3' align='center'><span>" + flag + "</span></div>   " +
                            "	</td>                                                                                             " +
                            "	<td  data-minwidth='150'>                                                                                             " +
                            "		<div class='layui-table-cell laytable-cell-1-time' align='center'><span>" + cartList[i].createtime + "</span></div> " +
                            "	</td>                                                                                            " +
                            "	<td >                                                                                            " +
                            "		<div class='layui-table-cell laytable-cell-1-4'><span>" + cartList[i].zan + "</span></div>                       " +
                            "	</td>                                                                                            " +
                            "	<td >                                                                                            " +
                            "		<div class='layui-table-cell laytable-cell-1-3'><span>" +
                            "<div class='layui-btn-group'>                " +
                            "  <button class='layui-btn layui-btn-xs' onclick='Top(" + cartList[i].cartId + ")'>置顶</button>    " +
                            "  <button class='layui-btn layui-btn-xs' onclick='great(" + cartList[i].cartId + ")'>加精</button>    " +
                            "  <button class='layui-btn layui-btn-xs' onclick='deleteCart(" + cartList[i].cartId + ")'>删除</button>    " +
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
    function deleteCart(id) {
        layer.confirm('确定要删除吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            window.location.href = "${pageContext.request.contextPath}/cart/delete" + id + ".html";
            layer.close(index);
        });
    }

    /* 加精 */
    function great(id) {
        layer.confirm('确定要加精吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            window.location.href = "${pageContext.request.contextPath}/cart/great" + id + ".html";
            layer.close(index);
        });
    }

    /* 置顶 */
    function Top(id) {
        layer.confirm('确定要置顶吗?', {icon: 3, title: '提示'}, function (index) {
            //do something
            window.location.href = "${pageContext.request.contextPath}/cart/top" + id + ".html";
            layer.close(index);
        });
    }

</script>


</body>


</html>