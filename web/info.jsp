<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>我的通知</title>


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
	<script type="text/javascript">
	function toPage() {
		var value = $(".zhuandao-input").val();
		window.location.href = "${pageContext.request.contextPath}/myinfo.html?currentPage="
				+ value;
	}
	
	/* 标记为已读 */
	
	function readyRead(id) {
		layer.confirm('确定要标记为已读吗?', {icon: 3, title:'提示'}, function(index){
		  //do something
		  window.location.href = "${pageContext.request.contextPath }/user/alreadyReadNotice"+id+".html";
		  layer.close(index);
		});
		
	}
	
	/* 全部已读 */
	function allRead() {
		layer.confirm('确定全部标记成已读吗?', {icon: 3, title:'提示'}, function(index){
			  //do something
		  window.location.href = "${pageContext.request.contextPath }/user/alreadyReadNotice.html";
		  layer.close(index);
		});
	}

	/* 删除 */
	
	function deleteById(id) {
		layer.confirm('确定要删除吗?', {icon: 3, title:'警告！'}, function(index){
		  //do something
		  window.location.href = "${pageContext.request.contextPath }/user/deleteNotice"+id+".html";
		  layer.close(index);
		});
		
	}
	
	/* 全部删除 */
	function allDelete() {
		layer.confirm('确定全部删除吗?', {icon: 3, title:'警告！'}, function(index){
			  //do something
		  window.location.href = "${pageContext.request.contextPath }/user/deleteNotice.html";
		  layer.close(index);
		});
	}
	
	</script>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<link rel="stylesheet" href="/public/css/tp5page.css">
		<div class="layui-container fly-marginTop fly-user-main">
			
			<jsp:include page="mineleft.jsp"></jsp:include>
			
			<div class="site-mobile-shade"></div>

			<div class="fly-panel fly-panel-user" pad20="">
				<div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">

					<div id="LAY_minemsg" style="margin-top: 10px;">

						<a href="javascript:void(0);" onclick="allRead();" class="layui-btn layui-btn-primary read_del">全部标记已读</a>

						<a href="javascript:void(0);" onclick="allDelete();" class="layui-btn layui-btn-danger read_del">删除全部消息</a>

						<a href="${pageContext.request.contextPath}/newInfo.jsp" class="layui-btn layui-btn read_del">发布通知</a>

						<ul class="mine-msg">
							<c:forEach items="${pageBean.list }" var="notice">
							<li class="messagelist">
								<blockquote class="layui-elem-quote">
									${notice.article } </blockquote>
								<p><span>${notice.notTime }</span> 
								<c:if test="${notice.notFlag == 1 }">
									<a href="javascript:void(0);" onclick="readyRead(${notice.noticeId});" class=" elementread layui-btn layui-btn-sm layui-btn-primary fly-delete">
										标记已读
									</a> 
								</c:if>
								<a href="javascript:;" onclick="deleteById(${notice.noticeId});"
										class=" elementdel layui-btn layui-btn-sm layui-btn-danger fly-delete">
										删除</a></p>
							</li>
							</c:forEach>

						</ul>
						<div style="text-align: center;">

							<ul class="pagination">
							<!-- 判断是否是第一页 -->
							<c:if test="${pageBean.currentPage == 1 }">
								<li disabled="disabled"><span>&laquo;</span></li>
							</c:if>
							<c:if test="${pageBean.currentPage != 1 }">
								<li><a
									href="${pageContext.request.contextPath }/myinfo.html?currentPage=${pageBean.currentPage-1 }">&laquo;</a>
								</li>
							</c:if>

							<c:forEach begin="1" end="${end }" var="page">
								<c:if test="${pageBean.currentPage == page }">
									<li class="active"><span>${page }</span></li>
								</c:if>
								<c:if test="${pageBean.currentPage != page }">
									<li><a
										href="${pageContext.request.contextPath }/myinfo.html?currentPage=${page }">${page }</a></li>
								</c:if>
							</c:forEach>
							
							<c:if test="${pageBean.currentPage == pageBean.totalPage }">
								<li disabled="disabled"><span>&raquo;</span></li>
							</c:if>
							<c:if test="${pageBean.currentPage != pageBean.totalPage }">
								<li>
								<li><a
									href="${pageContext.request.contextPath }/myinfo.html?currentPage=${pageBean.currentPage+1 }">&raquo;</a>
								</li>
								</li>
							</c:if>

							<li><input type="text" value="${pageBean.currentPage }"
								name="title" autocomplete="off"
								class="layui-input zhuandao-input"></li>
							<li><a href="javascript:void(0);"
								onclick="toPage();" class="layui-btn-mini zhuandao">转到
									→</a></li>

						</ul>

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
	</body>

</html>