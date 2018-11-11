<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>找回密码</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath }/layui/lay/modules/layer.js"></script>
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/css/layer.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>


    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jigsaw.css">

</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief" lay-filter="user">
            <ul class="layui-tab-title">
                <li class="layui-this">找回密码</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item">
                            <label for="L_username" class="layui-form-label">账号</label>
                            <div class="layui-input-inline">
                                <input type="text" id="username2" name="username" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <span id="timea">
											<a id="timea" style="color: blue;" href="javascript:void(0);"
                                               onclick="sendEmail();">向此账号的邮箱发送验证码</a>
										</span>

                        </div>
                        <form id="form" action="${pageContext.request.contextPath}/zhaohui.html" method="post">
                            <input id="yanzheng" type="hidden" value="">
                            <input id="username" name="username" type="hidden" value="">
                            <div class="layui-form-item">
                                <label for="L_vercode" class="layui-form-label">验证码</label>
                                <div class="layui-input-inline">
                                    <input id="code" type="text" required lay-verify="required|code"
                                           placeholder="请填写验证码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <p color="red">${zhaohui }</p>
                                <button class="layui-btn">提交</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!--页面JS脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>

</body>

<script type="text/javascript">
    /* 发送邮件 */
    function sendEmail() {
        var username = $("#username2").val();
        var Ivalue = "{\"username\":\"" + username + "\"}";
        $.ajax({
            url: "${pageContext.request.contextPath}/getCode.action",
            data: Ivalue,
            contentType: "application/json;charset=UTF-8",
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data == 0) {
                    //邮箱没注册
                    layer.msg('该用户没有绑定邮箱');
                } else if (data == 1) {
                    //用户没注册
                    layer.msg('该用户并没有注册');
                } else {
                    //验证码为code
                    $("#timea").html("<a color='#f2f2f2'>验证码已发送，若没收取到，<em id='time'></em>秒后可重新发送</a>");
                    layer.msg('发送成功，请进入该账户的邮箱查看验证码');
                    $("#yanzheng").val(data);
                    $("#username").val($("#username2").val());
                    time();
                }
            }
        });

    }

    function time() {
        var em = 60;
        $("#time").html(em);
        var interval = setInterval(function () {
            em = em - 1;
            $("#time").html(em);
            if (em <= 0) {
                $("#timea").html("<a id='timea' style='color: blue;' href='javascript:void(0);' onclick='sendEmail();''>向此账号的邮箱发送验证码</a>");
                clearInterval(interval);
            }
            ;
        }, 1000);
    }
</script>

<!-- 表单验证 -->
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //自定义验证规则
        form.verify({
            code: function (value) {
                var code = $('#code').val();
                var yanzheng = $("#yanzheng").val();
                if (code != yanzheng) {
                    return '验证码错误!';
                }
            }

        });


    });
</script>

</html>