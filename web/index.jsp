<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>

    <link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
    <script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
    <script src="${pageContext.request.contextPath }/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/layui/lay/modules/element.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
</head>

<body>
<script type="text/javascript">
    function toPage(orderBy) {
        var value = $(".zhuandao-input").val();
        window.location.href = "${pageContext.request.contextPath}/cart/cartList.html?currentPage="
            + value + "&orderBy=" + orderBy;
    }
</script>
<script>
    (function () {
        var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec" : "https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
</script>
<!-- 引入顶部 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 引入导航栏 -->
<jsp:include page="navi.jsp"></jsp:include>

<div class="layui-container">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8">

            <style type="text/css">
                #span1 {
                    position: absolute;
                    /*绝对定位*/
                    width: 100%;
                    bottom: 240px;
                    /*离底下0像素*/
                    left: 14px;
                    /*离左边0像素*/
                    text-align: center;
                    font-size: 20px;
                    color: #fff;
                }

                @media screen and (max-width: 980px) {
                    .yca {
                        display: none;
                    }
                }
            </style>
            <div class="yca ">
                <table width="100%" bgcolor="#FFFFFF">
                    <tr>
                        <td>
                            <div class="layui-carousel" id="test1">
                                <div carousel-item>

                                    <div>
                                        <a title="" target="_blank"> <span id="span1" class="a3333"></span>
                                            <img src="${pageContext.request.contextPath }/images/lunbo2.jpg"
                                                 width="100%" height="100%"/></a>
                                    </div>

                                    <div>
                                        <a title="" target="_blank"> <span id="span1" class="a3333"></span>
                                            <img src="${pageContext.request.contextPath }/images/lunbo3.jpg"
                                                 width="100%" height="100%"/></a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>

                <p>&nbsp;</p>
                <script>
                    layui.use('carousel', function () {
                        var carousel = layui.carousel;
                        //建造实例
                        carousel.render({
                            elem: '#test1',
                            width: '100%' //设置容器宽度
                            ,
                            arrow: 'always' //始终显示箭头
                            //,anim: 'updown' //切换动画方式
                        });
                    });
                </script>
            </div>

            <div class="fly-panel" style="margin-bottom: 0;">
                <jsp:include page="tiezititle.jsp"></jsp:include>
                <ul class="fly-list">
                    <!-- 新帖、新回复、热帖、精华 -->
                    <c:forEach items="${pageBean.list }" var="cart">

                        <li><a href="${pageContext.request.contextPath }/homepage${cart.user.id }.html"
                               class="fly-avatar"> <img
                                src="${cart.user.image }" alt="${cart.user.niko }">
                        </a>
                            <h2>
                                <a class="layui-badge">${cart.type.name }</a><a class="layui-badge">${cart.mold }</a> <a
                                    href="${pageContext.request.contextPath }/cart/${cart.cartId }.html">${cart.title } </a>
                            </h2>
                            <div class="fly-list-info">

									<span>${cart.createtime}
                                    </span> <span class="fly-list-nums"> <i
                                    class="layui-icon" title="查看">&#xe705;</i>${cart.readnum }
									</span>
                            </div>
                            <div class="fly-list-badge">
                                <c:if test="${cart.top == 2 }">
                                    <span class="layui-badge layui-bg-black">置顶</span>
                                </c:if>
                                <c:if test="${cart.great == 2 }">
                                    <span class="layui-badge layui-bg-red">精帖</span>
                                </c:if>
                            </div>
                        </li>

                    </c:forEach>

                </ul>
                <div style="border-top: 1px dotted #e2e2e2; text-align: center;">
                    <ul class="pagination">
                        <!-- 判断是否是第一页 -->
                        <c:if test="${pageBean.currentPage == 1 }">
                            <li disabled="disabled"><span>&laquo;</span></li>
                        </c:if>
                        <c:if test="${pageBean.currentPage != 1 }">
                            <li>
                                <a href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${pageBean.currentPage-1 }&orderBy=${orderBy }">&laquo;</a>
                            </li>
                        </c:if>

                        <c:forEach begin="1" end="${end }" var="page">
                            <c:if test="${pageBean.currentPage == page }">
                                <li class="active"><span>${page }</span></li>
                            </c:if>
                            <c:if test="${pageBean.currentPage != page }">
                                <li>
                                    <a href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${page }&orderBy=${orderBy }">${page }</a>
                                </li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageBean.currentPage == pageBean.totalPage }">
                            <li disabled="disabled"><span>&raquo;</span></li>
                        </c:if>
                        <c:if test="${pageBean.currentPage != pageBean.totalPage }">
                            <li>
                            <li>
                                <a href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${pageBean.currentPage+1 }&orderBy=${orderBy }">&raquo;</a>
                            </li>
                            </li>
                        </c:if>

                        <li>
                            <input type="text" value="${pageBean.currentPage }" name="title" autocomplete="off"
                                   class="layui-input zhuandao-input">
                        </li>
                        <li>
                            <a href="javascript:void(0);" onclick="toPage('${orderBy}');"
                               class="layui-btn-mini zhuandao">转到 →</a>
                        </li>

                    </ul>
                    <!--         <div class="laypage-main"> <a href="/bbs/index/cate/cate_alias/all.html?page=2" class="laypage-next">更多>></a> </div>
 -->
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

</html>