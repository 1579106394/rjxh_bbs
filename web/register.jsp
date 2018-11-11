<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户注册</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>


    <script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/layui/lay/modules/layer.js"></script>
    <link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/css/layer.css" media="all">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jigsaw.css">

    <!-- 表单验证 -->
    <script>
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;

            //自定义验证规则
            form.verify({
                username: function (value) { //value：表单的值、item：表单的DOM对象
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                        return '用户名不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                        return '用户名首尾不能出现下划线\'_\'';
                    }
                    if (value.length < 6 || value.length > 12) {
                        return '用户名长度必须在6-12之间';
                    }
                }
                , repass: function (value) {
                    var repassvalue = $('#L_pass').val();
                    if (value != repassvalue) {
                        return '两次输入的密码不一致!';
                    }
                }
                , code: function (value) {
                    if (value != 1) {
                        return '请滑动验证码！';
                    }
                }
                //我们既支持上述函数式的方式，也支持下述数组的形式
                //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
                , pass: [
                    /^[\S]{6,12}$/
                    , '密码必须6到12位，且不能出现空格'
                ]
            });


        });
    </script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="layui-container fly-marginTop">
    <div class="fly-panel fly-panel-user" pad20>
        <div class="layui-tab layui-tab-brief">
            <ul class="layui-tab-title">

                <li class="layui-this">注册</li>
            </ul>
            <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                <div class="layui-tab-item layui-show">
                    <div class="layui-form layui-form-pane">
                        <form action="${pageContext.request.contextPath }/register.html" class="layui-form"
                              method="post">
                            <input type="hidden" id="L_code" lay-verify="code" autocomplete="off" class="layui-input">
                            <div class="layui-form-item">
                                <label for="L_username" class="layui-form-label">账号</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_username" name="username" required
                                           lay-verify="required|username" placeholder="必填：6-12个字符，建议用QQ号或者学号"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_username" class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_niko" name="niko" required placeholder="必填"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sex" value="1" title="男" checked>
                                    <input type="radio" name="sex" value="2" title="女">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_pass" class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_pass" name="password" required
                                           lay-verify="required|pass" placeholder="必填：6到12个字符" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_repass" class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="L_repass" required lay-verify="required|repass"
                                           placeholder="必填：6到12个字符" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_email" class="layui-form-label">邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_email" name="email" lay-verify="email"
                                           placeholder="建议填，用于找回密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label for="L_mobile" class="layui-form-label">手机号</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="L_mobile" name="telephone" autocomplete="off" required
                                           lay-verify="required|phone" placeholder="必填：响应国家号召" class="layui-input">
                                </div>
                            </div>
                            <!-- 验证码 -->
                            <div class="container">
                                <div id="captcha" style="position: relative"></div>
                                <div id="msg"></div>
                            </div>

                            <script type="text/javascript"
                                    src="${pageContext.request.contextPath }/js/jigsaw.js"></script>
                            <script type="text/javascript">
                                jigsaw.init(document.getElementById('captcha'), function () {
                                    layui.use('layer', function () {
                                        var layer = layui.layer;

                                        layer.msg('验证成功');
                                    });

                                    $("#L_code").val(1);
                                })
                            </script>


                            <div>
                                <p style="color: red;">
                                    ${error }
                                </p>
                            </div>
                            <!-- 验证码 -->
                            <div class="layui-form-item">
                                <input class="layui-btn" type="submit" value="立即注册"/>
                                <a href="${pageContext.request.contextPath }/login.jsp"
                                   class="layui-btn layui-btn-primary" lay-filter="login_index">登录</a>
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


</html>