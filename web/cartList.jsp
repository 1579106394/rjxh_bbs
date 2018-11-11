<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>浏览帖子</title>


<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/images/favicon.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/globall.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/tp5page.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/mycss.css">
<script
	src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>


<script type="text/javascript">
	function toPage(orderBy) {
		var value = $(".zhuandao-input").val();
		window.location.href = "${pageContext.request.contextPath}/cart/cartList.html?currentPage="
				+ value + "&orderBy=" + orderBy + "&typeId=${typeId}";
	}
</script>


</head>

<body>
	<script>
		(function() {
			var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec"
					: "https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
			document.write('<script src="' + src + '" id="sozz"><\/script>');
		})();
	</script>
	<script
		src="http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec"
		id="sozz"></script>
	<script charset="utf-8"
		src="http://s5.qhres.com/static/ab77b6ea7f3fbf79.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="navi.jsp"></jsp:include>
	<div class="layui-container">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md8">

				<div class="fly-panel" style="margin-bottom: 0;">
					<jsp:include page="tiezititle.jsp"></jsp:include>
					<ul class="fly-list">

						<c:forEach items="${pageBean.list }" var="cart">

							<li><a href="${pageContext.request.contextPath }/homepage${cart.user.id }.html" class="fly-avatar"> <img
									src="${cart.user.image }" alt="${cart.user.niko }">
							</a>
								<h2>
									<a class="layui-badge">${cart.type.name }</a><a class="layui-badge">${cart.mold }</a> <a
										href="${pageContext.request.contextPath }/cart/${cart.cartId }.html">${cart.title } </a>
								</h2>
								<div class="fly-list-info">

									<span>${cart.createtime}
									</span> <span class="fly-list-nums"> <i class="layui-icon" title="查看">&#xe705;</i>${cart.readnum }
									</span>
								</div>
								<div class="fly-list-badge">
									<c:if test="${cart.top == 2 }">
										<span class="layui-badge layui-bg-black">置顶</span>
									</c:if>
									<c:if test="${cart.great == 2 }">
										<span class="layui-badge layui-bg-red">精帖</span>
									</c:if>
								</div></li>

						</c:forEach>

					</ul>
					<div style="border-top: 1px dotted #e2e2e2; text-align: center;">
						<ul class="pagination">
							<!-- 判断是否是第一页 -->
							<c:if test="${pageBean.currentPage == 1 }">
								<li disabled="disabled"><span>&laquo;</span></li>
							</c:if>
							<c:if test="${pageBean.currentPage != 1 }">
								<li><a
									href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${pageBean.currentPage-1 }&orderBy=${orderBy }&typeId=${typeId}">&laquo;</a>
								</li>
							</c:if>

							<c:forEach begin="1" end="${end }" var="page">
								<c:if test="${pageBean.currentPage == page }">
									<li class="active"><span>${page }</span></li>
								</c:if>
								<c:if test="${pageBean.currentPage != page }">
									<li><a
										href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${page }&orderBy=${orderBy }&typeId=${typeId}">${page }</a></li>
								</c:if>
							</c:forEach>
							
							<c:if test="${pageBean.currentPage == pageBean.totalPage }">
								<li disabled="disabled"><span>&raquo;</span></li>
							</c:if>
							<c:if test="${pageBean.currentPage != pageBean.totalPage }">
								<li>
								<li><a
									href="${pageContext.request.contextPath }/cart/cartList.html?currentPage=${pageBean.currentPage+1 }&orderBy=${orderBy }&typeId=${typeId}">&raquo;</a>
								</li>
								</li>
							</c:if>

							<li><input type="text" value="${pageBean.currentPage }"
								name="title" autocomplete="off"
								class="layui-input zhuandao-input"></li>
							<li><a href="javascript:void(0);"
								onclick="toPage('${orderBy}');" class="layui-btn-mini zhuandao">转到
									→</a></li>

						</ul>

						<!--  <ul class="pagination"><li class="disabled"><span>&laquo;</span></li> <li class="active"><span>1</span></li><li><a href="/cate/all.html?page=2">2</a></li><li><a href="/cate/all.html?page=3">3</a></li><li><a href="/cate/all.html?page=4">4</a></li><li><a href="/cate/all.html?page=5">5</a></li><li><a href="/cate/all.html?page=6">6</a></li><li><a href="/cate/all.html?page=7">7</a></li><li><a href="/cate/all.html?page=8">8</a></li><li><a href="/cate/all.html?page=9">9</a></li><li><a href="/cate/all.html?page=10">10</a></li> <li><a href="/cate/all.html?page=2">&raquo;</a></li></ul> -->
					</div>
				</div>

			</div>

			<jsp:include page="right.jsp"></jsp:include>


		</div>
	</div>
	<a href="/bbs/forum/add.html" class="site-tree-mobile-edit layui-hide">
		<i class="iconfont icon-fabu"></i>
	</a>
	<jsp:include page="footer.jsp"></jsp:include>
	<!--页面JS脚本-->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>


	<ul class="layui-fixbar">
		<li class="layui-icon" lay-type="bar1"
			style="background-color: #009688"></li>
		<li class="layui-icon layui-fixbar-top" lay-type="top"
			style="background-color: #009688"></li>
	</ul>
</body>
</html>