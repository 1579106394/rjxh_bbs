<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>帖子详情</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/editor/dist/css/wangEditor.min.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/layui/lay/modules/element.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">

    <!-- 点赞与收藏 -->
    <script type="text/javascript">
        function zan(id) {

            var zan = parseInt($("#zanNum").html());
            if (!$("#zanButton").hasClass("layui-bg-gray")) {
                zan = zan + 1;
            } else {
                zan = zan - 1;
            }
            /* ajax加载点赞 */
            var d = "{\"cartId\":\"" + id + "\",\"zan\":\"" + zan + "\"}";
            $.ajax({
                url: "${pageContext.request.contextPath}/cart/ajaxZan.action",
                data: d,
                contentType: "application/json;charset=UTF-8",
                type: "post",
                dataType: "json",
                success: function (dep) {

                    $("#zanNum").html(dep.zan);
                    if (!$("#zanButton").hasClass("layui-bg-gray")) {
                        $("#zanButton").addClass("layui-bg-gray");
                    } else {
                        $("#zanButton").removeClass("layui-bg-gray");
                    }

                }
            });
        }


        function shoucang(id) {

            var shoucang = parseInt($("#shoucangNum").html());
            if (!$("#shoucangButton").hasClass("layui-bg-gray")) {
                shoucang = shoucang + 1;
            } else {
                shoucang = shoucang - 1;
            }
            /* ajax加载收藏 */
            var d = "{\"cartId\":\"" + id + "\",\"shoucang\":\"" + shoucang + "\"}";
            $.ajax({
                url: "${pageContext.request.contextPath}/cart/ajaxShoucang.action",
                data: d,
                contentType: "application/json;charset=UTF-8",
                type: "post",
                dataType: "json",
                success: function (dep) {

                    $("#shoucangNum").html(dep.shoucang);
                    if (!$("#shoucangButton").hasClass("layui-bg-gray")) {
                        $("#shoucangButton").addClass("layui-bg-gray");
                    } else {
                        9
                        $("#shoucangButton").removeClass("layui-bg-gray");
                    }

                }
            });
        }

        function jubao(id) {

            var jubao = parseInt($("#jubaoNum").html());
            if (!$("#jubaoButton").hasClass("layui-bg-gray")) {
                jubao = jubao + 1;
            } else {
                jubao = jubao - 1;
            }
            /* ajax加载收藏 */
            var d = "{\"cartId\":\"" + id + "\",\"jubao\":\"" + jubao + "\"}";
            $.ajax({
                url: "${pageContext.request.contextPath}/cart/ajaxJubao.action",
                data: d,
                contentType: "application/json;charset=UTF-8",
                type: "post",
                dataType: "json",
                success: function (dep) {

                    $("#jubaoNum").html(dep.jubao);
                    if (!$("#jubaoButton").hasClass("layui-bg-gray")) {
                        $("#jubaoButton").addClass("layui-bg-gray");
                    } else {
                        9
                        $("#jubaoButton").removeClass("layui-bg-gray");
                    }

                }
            });
        }


    </script>

    <!-- ajax点赞回复 -->
    <script type="text/javascript">
        function tieziZan(id) {

            var zan = parseInt($("#" + id + "zan").html());
            if (!$("#" + id + "span").hasClass("zanok")) {
                zan = zan + 1;
            } else {
                zan = zan - 1;
            }
            /* ajax加载点赞 */
            var d = "{\"cId\":\"" + id + "\",\"comZan\":\"" + zan + "\"}";
            $.ajax({
                url: "${pageContext.request.contextPath}/comment/ajaxZanHuiFu.action",
                data: d,
                contentType: "application/json;charset=UTF-8",
                type: "post",
                dataType: "json",
                success: function (dep) {

                    $("#" + id + "zan").html(zan);
                    if (!$("#" + id + "span").hasClass("zanok")) {
                        $("#" + id + "span").addClass("zanok");
                    } else {
                        $("#" + id + "span").removeClass("zanok");
                    }

                }
            });
        }
    </script>


    <style type="text/css">
        #div1 {
            width: 100%;
            height: 500px;
        }
    </style>
    <style type="text/css">
        .pagination {
            margin: 0 0 20px 0;
        }

        i {
            font-style: italic;
        }

        .pop_reward_page {
            border-radius: 19px !important;
        }

        .reward {
            width: 320px;
            height: 363px;
            border-radius: 14px;
            padding: 0 40px;
        }

        .reward_avatar img {
            border-radius: 100px;
            width: 92px;
            height: 92px;
            margin-top: -45px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.46);
        }

        .pop_reward_page .layui-layer-content {
            overflow: inherit !important;
        }

        .close_reward {
            width: 46px;
            height: 46px;
            position: absolute;
            right: 1px;
            cursor: pointer;
        }

        .reward_btn {
            background: #f1bc78;
            position: absolute;
            bottom: 40px;
            font-size: 30px;
            color: #d3454e;
            width: 320px;
            text-align: center;
            line-height: 60px;
            border-radius: 5px;
            cursor: pointer;
        }

        .reward_btn:hover {
            background: #fbd776;
        }

        .reward_name {
            text-align: center;
            margin: 10px;
            font-size: 20px;
            color: #fff;
        }

        div#reward_form {
            text-align: center;
            margin: 40px 0 0;
        }

        div#reward_form span {
            color: #FBD776;
            font-size: 70px;
        }

        div#reward_form i {
            color: #FBD776;
            font-style: normal;
            margin-left: 10px;
            font-size: 20px;
        }

        div#reward_edior {
            font-size: 18px;
            text-align: center;
            color: #fcc16e;
            cursor: pointer;
            width: 100px;
            margin: 10px auto 10px;
        }

        .reward_avatar {
            text-align: center;
        }

        div#reward_form input {
            background: 0;
            border: 0;
            color: #FBD776;
            font-size: 70px;
            text-align: center;
            width: 155px;
        }

        .jie-admin-delete,
        .jie-admin-color {
            cursor: pointer;
        }

        .setcolor {
            width: 20px;
            height: 20px;
            float: left;
            margin-right: 5px;
            cursor: pointer;
        }
    </style>


</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="navi.jsp"></jsp:include>


<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8 content detail">
            <div class="fly-panel detail-box">
                <h1>${cart.title }</h1>
                <input type="hidden" value="1" id="cateid"/>
                <div class="fly-detail-info">

							<span class="layui-hide-xs">
            <a style="color:#fff;" class="layui-badge layui-bg-green fly-detail-column"
               href="${pageContext.request.contextPath }/${cart.type.url }">${cart.type.name }</a>
          </span>
                    <c:if test="${cart.top==2 }">
                        <span style="margin-right: 4px;" class="layui-badge layui-bg-black">置顶</span>
                    </c:if>
                    <c:if test="${cart.great==2 }">
                        <span class="layui-badge layui-bg-red">精帖</span>
                    </c:if>

                    <div class="fly-admin-box" data-id="437">
                    </div>

                    <span class="fly-list-nums">
                            
                        <i class="layui-icon" title="评论">&#xe611;</i> ${cart.huifunum }
                    <i class="layui-icon" title="查看">&#xe705;</i> ${cart.readnum } </span>
                </div>
                <div class="detail-about">
                    <a class="fly-avatar" href="${pageContext.request.contextPath }/homepage${cart.user.id }.html">
                        <img src="${cart.user.image }" alt="${cart.user.niko }"> </a>
                    <div class="fly-detail-user">
                        <a href="#" class="fly-link">
                            <cite>${cart.user.niko }</cite>
                        </a>
                        <input type="hidden" value="${userV.flag }">
                        <c:if test="${userV.flag == 2 }">
                            <i class="layui-badge fly-badge-vip layui-hide-xs">管理员</i>
                        </c:if>
                        <!--  -->

                    </div>
                    <div class="detail-hits" id="LAY_jieAdmin" data-id="437">
                        <span>${cart.createtime}</span>
                    </div>
                </div>
                <div class="detail-body photos">
                    <div class="wangEditor-container cl" style="border: 0px solid #e6e6e6;">

                        <div class="wangEditor-txt" style="padding: 0;margin-top: 0;">
                            <!-- 帖子内容 -->
                            ${cart.article }
                        </div>

                    </div>

                </div>
            </div>

            <div class="fly-panel detail-box" style="text-align:center">
                <div class="layui-btn-container" data-id="188">
                    <input id="zuid" type="hidden" value="4"/>
                    <c:if test="${zanFlag == 1 }">
                        <button onclick="zan(${cart.cartId});" id="zanButton" data-type='1'
                                class="zancoll layui-btn layui-btn-primary layui-bg-gray">
                            <i class="layui-icon">&#xe6c6;</i> 点赞
                            <em id="zanNum">${cart.zan }</em></button>
                    </c:if>
                    <c:if test="${zanFlag != 1 }">
                        <button onclick="zan(${cart.cartId});" id="zanButton" data-type='1'
                                class="zancoll layui-btn layui-btn-primary">
                            <i class="layui-icon">&#xe6c6;</i> 点赞
                            <em id="zanNum">${cart.zan }</em></button>
                    </c:if>
                    <c:if test="${!empty sessionScope.user }">
                        <c:if test="${shoucangFlag == 1 }">
                            <button data-type='1' onclick="shoucang(${cart.cartId});" id="shoucangButton"
                                    class="zancoll layui-btn layui-btn-primary layui-bg-gray ">
                                <i class="layui-icon">&#xe600;</i> 收藏
                                <em id="shoucangNum">${cart.shoucang }</em></button>
                        </c:if>
                        <c:if test="${shoucangFlag != 1 }">
                            <button data-type='1' onclick="shoucang(${cart.cartId});" id="shoucangButton"
                                    class="zancoll layui-btn layui-btn-primary ">
                                <i class="layui-icon">&#xe600;</i> 收藏
                                <em id="shoucangNum">${cart.shoucang }</em></button>
                        </c:if>
                    </c:if>
                    <button data-type='1' onclick="jubao(${cart.cartId});" id="jubaoButton"
                            class="zancoll layui-btn layui-btn-primary ">
                        <i class="layui-icon">&#xe6c5;</i> 举报
                        <em id="jubaoNum">${cart.jubao }</em></button>
                </div>
            </div>


            <div class="fly-panel detail-box" id="flyReply">
                <a name="comment"> </a>
                <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                    <legend>回帖</legend>
                </fieldset>
                <ul class="jieda" id="jieda">


                </ul>


                <div class="pages"></div>
                <div style="text-align: center">
                </div>

                <div class="layui-form layui-form-pane">
                    <form action="${pageContext.request.contextPath }/comment/comment.html" method="post">
                        <!-- 富文本编辑器内容 -->
                        <input type="hidden" id="article" name="article" class="article"/>
                        <!-- 用户id1 -->
                        <input type="hidden" id="userId1" name="userId1" value="${sessionScope.user.id }"/>
                        <!-- 用户id2 -->
                        <input type="hidden" id="userId2" name="userId2" value="${userV.id }"/>
                        <!-- 帖子ID -->
                        <input type="hidden" id="cartId" name="cartId" value="${cart.cartId }"/>
                        <!-- 评论id2，默认为0，表示直接评论帖子 -->
                        <input type="hidden" id="commentId" name="commentId" value="0"/>

                        <!-- 富文本编辑器 -->
                        <div id="div1">

                        </div>

                        <script type="text/javascript"
                                src="${pageContext.request.contextPath }/editor/dist/js/lib/jquery-1.10.2.min.js"></script>
                        <script type="text/javascript"
                                src="${pageContext.request.contextPath }/editor/dist/js/wangEditor.js"></script>
                        <script type="text/javascript">
                            $(function () {
                                var editor = new wangEditor('div1');
                                editor.create();
                            });
                        </script>

                        <!-- 富文本编辑器 -->

                        <div class="layui-form-item">
                            <button class="layui-btn" lay-submit="" onclick="huifu();">提交回答</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="right.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!--页面JS脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>
</body>

<script type="text/javascript">
    function huifu() {
        var article = $("#div1").html();
        $(".article").val(article);
        $(".form").submit();


    }

    /* AJAX直接加载评论 */
    $(function () {
        var cartId = "${cart.cartId}";
        var value = "{\"cartId\":\"" + cartId + "\"}";
        $.ajax({
            url: "${pageContext.request.contextPath}/comment/ajaxLoadComment.action",
            data: value,
            contentType: "application/json;charset=UTF-8",
            type: "post",
            dataType: "json",
            success: function (map) {
                // var courseList = eval(dep);
                //获得ul节点
                var ul = document.getElementById("jieda");
                //先确定第二个菜单节点中是否有值，如果有就进行清空操作
                //获得第二个菜单下的option节点
                var liArrays = ul.getElementsByTagName("li");
                //清除操作
                for (var i = 0; i < liArrays.length; i++) {
                    ul.removeChild(liArrays[i]);
                    i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
                        //如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
                }
                for (var jian in map) {

                    var key = eval('(' + jian + ')');//json字符串转成json对象

                    var user1 = key.user;

                    var comment1 = key.comment;

                    if (!$.isEmptyObject(map[jian].comment)) {
                        var user2 = map[jian].user;
                        var comment2 = map[jian].comment;
                        $(".jieda").append(
                            //遍历。1.用户信息
                            "<li id='tpt83' class='jieda-daan'>" +
                            "<div class='detail-about detail-about-reply'>" +
                            "<a class='fly-avatar'  href='${pageContext.request.contextPath }/homepage${cart.user.id }.html'>" +
                            "<img src='" + user1.image + "' alt='" + user1.niko + "'> " +
                            "</a>" +
                            "<div class='fly-detail-user'>" +
                            "<a href='#' class='fly-link'>" +
                            "<cite class='niko' id='" + comment1.cId + "user'>" + user1.niko + "</cite>" +
                            "</a>" +

                            "</div>" +
                            "<div class='detail-hits'>" +
                            "<span>" + comment1.artTime + "</span>" +
                            "</div>" +

                            "</div>" +
                            //2.评论信息
                            "<div class='detail-body jieda-body photos'>" +
                            "<p></p><p>" + comment1.article + "</p><p></p>            " +
                            "<div class='home-dacontent'>               " +
                            user2.niko + ":<p>" + comment2.article + "</p>             " +
                            "</div>                                     " +
                            "</div>							            " +
                            //3.其他信息
                            "	 <div class='jieda-reply'>                                                                " +
                            "	                                                                                          " +
                            "    <span id='" + comment1.cId + "span' class='jieda-zan' onclick='tieziZan(" + comment1.cId + ");' type='zan'> " +
                            "     <i class='layui-icon'>&#xe6c6;</i>                                                       " +
                            "        <em id='" + comment1.cId + "zan'>" + comment1.comZan + "</em>                                                                           " +
                            "      </span>                                                                                " +
                            "        <span type='reply' data-id='83' onclick='huifuCart(" + comment1.cId + ");'>                                                     " +
                            "            <i class='layui-icon'>&#xe611;</i>回复                                     " +
                            "        </span>                                                                              " +
                            "</div>                                                                                       " +
                            "    </li>                                                                                    "
                        );
                    } else {
                        $(".jieda").append(
                            //遍历。1.用户信息
                            "<li id='tpt83' class='jieda-daan'>" +
                            "<div class='detail-about detail-about-reply'>" +
                            "<a class='fly-avatar' href='#'>" +
                            "<img src='" + user1.image + "' alt='" + user1.niko + "'> " +
                            "</a>" +
                            "<div class='fly-detail-user'>" +
                            "<a href='#' class='fly-link'>" +
                            "<cite  class='niko' id='" + comment1.cId + "user'>" + user1.niko + "</cite>" +
                            "</a>" +

                            "</div>" +
                            "<div class='detail-hits'>" +
                            "<span>" + comment1.artTime + "</span>" +
                            "</div>" +

                            "</div>" +
                            //2.评论信息
                            "<div class='detail-body jieda-body photos'>" +
                            "<p></p><p>" + comment1.article + "</p><p></p>            " +

                            "</div>							            " +
                            //3.其他信息
                            "	 <div class='jieda-reply'>                                                                " +
                            "	                                                                                          " +
                            "    <span id='" + comment1.cId + "span' class='jieda-zan' onclick='tieziZan(" + comment1.cId + ");' type='zan'> " +
                            "     <i class='layui-icon'>&#xe6c6;</i>                                                       " +
                            "        <em id='" + comment1.cId + "zan'>" + comment1.comZan + "</em>                                                                           " +
                            "      </span>                                                                                " +
                            "        <span type='reply' data-id='83' onclick='huifuCart(" + comment1.cId + ", "+comment1.userId1+");'>                                                     " +
                            "            <i class='layui-icon'>&#xe611;</i>回复                                     " +
                            "        </span>                                                                              " +
                            "</div>                                                                                       " +
                            "    </li>                                                                                    "
                        );
                    }
                }
            }
        });
    });

    /* 点击“回复”，表示回复哪个帖子 */
    function huifuCart(commentId, userId) {
        $("#commentId").val(commentId);
        $("#userId2").val(userId)
        var niko = $("#" + commentId + "user").html();
        var div = document.getElementById("div1");
        var liArrays = div.getElementsByTagName("p");
        div.removeChild(liArrays[liArrays.length - 1]);
        $("#div1").append("<p><b><font color='#0000ff'>@" + niko + " </font></b></p><p><br></p>");

    }

</script>

</html>