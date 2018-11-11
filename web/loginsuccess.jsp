<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册成功</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <link ref="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css"/>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="main">
    <div class="fly-panel">
        <div class="fly-none">

            <h2><i style="color:#009688;" class="glyphicon glyphicon-ok-circle big"></i></h2>
            <p style="color:#009688">
                注册成功 </p>
            <p class="jump" style="color:#009688">
                页面自动 <a style="color:#393D49" id="href" href="${pageContext.request.contextPath }/login.jsp">跳转</a>
                等待时间： <b id="wait">3</b>
            </p>

        </div>
    </div>
</div>
<script type="text/javascript">
    (function () {
        var wait = document.getElementById('wait'),
            href = document.getElementById('href').href;
        var interval = setInterval(function () {
            var time = --wait.innerHTML;
            if (time <= 0) {
                location.href = href;
                clearInterval(interval);
            }
            ;
        }, 1000);
    })();
</script>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>
</body>

</html>