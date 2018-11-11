<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 左边 -->

<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath }/homepage${sessionScope.user.id }.html">
            <i class="layui-icon">&#xe68e;</i> 我的主页
        </a>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath }/base.html">
            <i class="layui-icon">&#xe716;</i> 基本设置
        </a>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath }/mycart.html">
            <i class="layui-icon">&#xe63c;</i> 我的帖子
        </a>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath }/myhuifu.html">
            <i class="layui-icon">&#xe63a;</i>评论我的
        </a>
    </li>
    <li class="layui-nav-item">
        <a href="${pageContext.request.contextPath }/myinfo.html">
            <i class="layui-icon">&#xe667;</i> 我的通知
        </a>
    </li>

    <!--下面是管理员的功能-->
    <c:if test="${sessionScope.user.flag == 2}">
        <hr/>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath }/mokuai.html">
                <i class="layui-icon">&#xe653;</i> 模块管理
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath }/cart.html">
                <i class="layui-icon">&#xe63c;</i> 帖子管理
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath }/user.html">
                <i class="layui-icon">&#xe770;</i> 用户管理
            </a>
        </li>
        <li class="layui-nav-item">
            <a href="${pageContext.request.contextPath }/info.html">
                <i class="layui-icon">&#xe667;</i> 通知管理
            </a>
        </li>
    </c:if>

</ul>
<script>
    layui.use(['jquery', 'element'], function () {
        var jq = layui.jquery;
        var element = layui.element;
        //显示当前tab
        if (location.hash) {
            element.tabChange('user', location.hash.replace(/^#/, ''));
        }
        element.on('tab(user)', function () {
            var othis = jq(this),
                layid = othis.attr('lay-id');
            if (layid) {
                location.hash = layid;
            }
        });
        var treeMobile = jq('.site-tree-mobile'),
            shadeMobile = jq('.site-mobile-shade');
        treeMobile.on('click', function () {
            jq('body').addClass('site-mobile');
        });
        shadeMobile.on('click', function () {
            jq('body').removeClass('site-mobile');
        });
        //----------动态添加导航active样式--------------
        var _nava = jq('.layui-nav .layui-nav-item a');
        var _url = window.location.href;
        var _host = window.location.host;
        for (var i = 0; i < _nava.length; i++) {
            var _astr = _nava.eq(i).attr('href');
            // alert(_astr);
            if (_url.indexOf(_astr) != -1) {
                _nava.eq(i).addClass('layui-this').siblings().removeClass('layui-this');
            } else if (_url == ('http://' + _host + '/')) {
                _nava.eq(0).addClass('layui-this').siblings().removeClass('layui-this');
            }
        }
        //----------动态添加导航active样式结束------------
    })
</script>
<div class="site-tree-mobile layui-hide">
    <i class="layui-icon"></i>
</div>