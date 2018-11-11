<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>编辑帖子</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/editor/dist/css/wangEditor.min.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        #div1 {
            width: 100%;
            height: 500px;
        }
    </style>
    <style type="text/css">
        .tpt_sels a {
            padding-right: 15px;
            position: relative
        }

        .tpt_sels a {
            padding: 0 20px 0 8px;
            color: #3B6268;
            background: #FFFFBA;
            border: 1px #F8E06E solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_pres a.selected {
            padding: 0 8px;
            color: #3B6268;
            background: #FFFFBA;
            border: 1px #F8E06E solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_pres a {
            padding: 0 8px;
            color: #fff;
            background: #5AC7A9;
            border: 1px #5AC7A9 solid;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 14px;
            height: 26px;
            line-height: 26px;
            display: block;
            float: left
        }

        .tpt_sels a em {
            width: 12px;
            height: 12px;
            font-style: normal;
            display: block;
            position: absolute;
            top: 7px;
            right: 4px;
            z-index: 2;
            background: url(/public//images/sx.png) no-repeat 0 0;
        }

        .cl {
            zoom: 1
        }

        .cl:after {
            content: '\20';
            display: block;
            height: 0;
            clear: both;
            visibility: hidden
        }

    </style>


    <script type="text/javascript">
        function formSubmit() {
            var article = $("#div1").html();
            $(".article").val(article);
            var value = $(".article").val();
            $(".form").submit();
        }
    </script>


</head>

<body>
<script>
    (function () {
        var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec" : "https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
</script>
<jsp:include page="header.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20="" style="padding-top: 5px;">
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">编辑帖子（BBS）</li>

            </ul>
            <form id="form" action="${pageContext.request.contextPath }/cart/editCart.html" method="post">
                <!-- 富文本编辑器内容 -->
                <input type="hidden" name="article" class="article"/>
                <!--帖子Id-->
                <input type="hidden" name="cartId" value="${cart.cartId}"/>
                <div class="layui-form layui-form-pane" style="padding: 20px 0;">

                    <div class="layui-form-item">
                        <label class="layui-form-label">板块</label>
                        <div class="layui-input-block">
                            <select id="select1" class="select1" name="typeId">
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">帖子类型</label>
                        <div class="layui-input-block">
                            <select id="select2" class="select2" name="mold">
                                <option value="普通帖">普通帖</option>
                                <option value="提问帖">提问帖</option>
                                <option value="投票帖">投票帖</option>
                                <option value="视频帖">视频帖</option>
                                <option value="技术帖">技术帖</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_title" class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input id="L_title" type="text" name="title" required lay-verify="required"
                                   autocomplete="off" class="layui-input" value="${cart.title}">
                        </div>
                    </div>

                    <!-- 富文本编辑器 -->

                    <div id="div1">

                    </div>


                    <script type="text/javascript"
                            src="${pageContext.request.contextPath }/editor/dist/js/wangEditor.js"></script>
                    <script type="text/javascript">
                        $(function () {
                            var editor = new wangEditor('div1');
                            editor.create();
                            $("#div1").html("${cart.article}")
                        });
                    </script>

                    <!-- 富文本编辑器 -->


                    <style type="text/css">
                        .wp_urls a {
                            padding-right: 15px;
                            position: relative
                        }

                        .wp_urls a {
                            padding: 0 20px 0 8px;
                            color: #3B6268;
                            background: #FFFFBA;
                            border: 1px #F8E06E solid;
                            margin-right: 5px;
                            margin-bottom: 5px;
                            font-size: 14px;
                            height: 26px;
                            line-height: 26px;
                            display: block;
                            float: left
                        }

                        .wp_urls a em {
                            width: 12px;
                            height: 12px;
                            font-style: normal;
                            display: block;
                            position: absolute;
                            top: 7px;
                            right: 4px;
                            z-index: 2;
                            background: url("public/images/sx.png") no-repeat 0 0;
                        }
                    </style>
                    <input type="hidden" name="linkinfo" value="">
                    <input type="hidden" name="linkinfo" value="">


                    <div class="layui-form-item">
                        <button class="layui-btn" onclick="formSubmit();">提交</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>

</body>
<!-- ajav加载板块 -->
<script type="text/javascript">

    $(function () {
        typeList();
    });

    function typeList() {
        $.ajax({
            url: "${pageContext.request.contextPath}/type/ajaxGetTypeList.action",
            contentType: "application/json;charset=UTF-8",
            type: "post",
            dataType: "json",
            success: function (dep) {
                var cartList = eval(dep);
                //获得下拉框节点
                var select = document.getElementById("select1");
                //先确定节点中是否有值，如果有就进行清空操作
                //获得菜单下的option节点
                var optionArrays = select.getElementsByTagName("option");
                //清除操作
                for (var i = 0; i < optionArrays.length; i++) {
                    select.removeChild(optionArrays[i]);
                    i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
                        //如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
                }
                $(".select1").append("<option selected='selected' disabled='disabled'>请选择版块</option");
                for (var i = 1; i < cartList.length; i++) {
                    $(".select1").append("<option id='" + cartList[i].typeId + "' value='" + cartList[i].typeId + "'>" + cartList[i].name + "</option");
                }

                if (optionArrays.length == 0) {
                    typeList();
                }
            }
        });
    }
</script>

</html>