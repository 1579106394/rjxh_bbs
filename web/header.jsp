<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${empty sessionScope.user }">
    <div class="fly-header layui-bg-green"
         style="border-bottom: 1px solid #01AAED;">
        <div class="layui-container">
            <a class="fly-logo" href="${pageContext.request.contextPath }/" style="top: 0;">
                <img src="${pageContext.request.contextPath }/images/logo.png" style="height: 60px" alt="laysns"></a>
            <ul class="layui-nav fly-nav layui-hide-xs">
                <span class="layui-nav-bar"></span>
            </ul>
            <ul class="layui-nav fly-nav-user">
                <input id="uid" value="" type="hidden">
                <li class="layui-nav-item"><a
                        class="iconfont layui-hide-xs iconwidth" href="#"> <img
                        src="${pageContext.request.contextPath }/images/icon/137.png" class="touxiang"/>
                </a></li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath }/login.jsp">登录</a></li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath }/register.jsp">注册</a></li>

                <span class="layui-nav-bar"
                      style="left: 27px; top: 55px; width: 0px; opacity: 0;"></span>
            </ul>
        </div>
    </div>

</c:if>

<c:if test="${!empty sessionScope.user }">
    <div class="fly-header layui-bg-green"
         style="border-bottom: 1px solid #01AAED;">
        <div class="layui-container">
            <a class="fly-logo" href="${pageContext.request.contextPath }/"
               style="top: 0;"> <img
                    src="${pageContext.request.contextPath }/images/logo.png"
                    style="height: 60px" alt="laysns"></a>

            <ul class="layui-nav fly-nav-user">

                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath }/homepage${sessionScope.user.id }.html">
                        <img id="headerImage" src="${sessionScope.user.image }" class="layui-nav-img">
                            ${sessionScope.user.niko }
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="${pageContext.request.contextPath }/base.html">
                                <i class="layui-icon"></i>
                                <c:if test="${sessionScope.user.flag == 1}">
                                    个人中心
                                </c:if>
                                <c:if test="${sessionScope.user.flag == 2}">
                                    管理中心
                                </c:if>
                            </a>

                        </dd>


                        <hr style="margin: 5px 0;">
                        <dd>
                            <a href="${pageContext.request.contextPath }/logout.html"
                               class="logi_logout" style="text-align: center;">退出</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>


</c:if>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>

<script type="text/javascript">/* 鼠标点击特效 */
var a_idx = 0;
jQuery(document).ready(function ($) {
    $("body").click(function (e) {
        var a = new Array("富强", "民主", "文明", "和谐", "自由", "平等", "公正", "法治", "爱国", "敬业", "诚信", "友善");
        var $i = $("<span/>").text(a[a_idx]);
        a_idx = (a_idx + 1) % a.length;
        var x = e.pageX,
            y = e.pageY;
        $i.css({
            "z-index": 999999999999999999999999999999999999999999999999999999999999999999999,
            "top": y - 20,
            "left": x,
            "position": "absolute",
            "font-weight": "bold",
            "color": "#ff6651"
        });
        $("body").append($i);
        $i.animate({
                "top": y - 180,
                "opacity": 0
            },
            1500,
            function () {
                $i.remove();
            });
    });
});</script>
	