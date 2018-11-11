<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="layui-col-md4">
			<c:if test="${!empty sessionScope.user }">
				<div class="fly-panel">
					<h3 class="fly-panel-title">我的收藏</h3>
					<ul id="shoucang" class="fly-panel-main fly-list-static">
					<!-- 收藏贴 -->
					</ul>
				</div>
			</c:if>
				<dl id="hot" class="fly-panel fly-list-one">
					<dt class="fly-panel-title">热议帖子</dt>
					<c:forEach items="${hotList }" var="cart">
						<dd>
							<a href="${pageContext.request.contextPath }/cart/${cart.cartId }.html">${cart.title } </a> <span>
								<i class="layui-icon layui-icon-reply-fill"></i> ${cart.huifunum }
							</span>
	
						</dd>
					</c:forEach>
						
					</dl>
				<script>(function(){
        var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec":"https://jspassport.ssl.qhimg.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec";
        document.write('<script src="' + src + '" id="sozz"><\/script>');
    })();
    </script>
				<script
					src="http://js.passport.qihucdn.com/11.0.1.js?9aef00782b02f3b58fc2fc109bed62ec"
					id="sozz"></script>
				<script charset="utf-8"
					src="http://s5.qhres.com/static/ab77b6ea7f3fbf79.js"></script>

			</div>
		<!-- ajax加载热帖 -->
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/cart/ajaxHotCartList.action",
				contentType : "application/json;charset=UTF-8",
				type : "post",
				dataType : "json",
				success : function(dep) {
					var typeId = "${typeId}";
					var cartList = eval(dep);
					for (var i = 0; i < cartList.length; i++) {
						$("#hot").append("<dd><a href='${pageContext.request.contextPath }/cart/"+cartList[i].cartId+".html'>"+cartList[i].title+"</a> <span>"+
								"<i class='layui-icon' title='评论'>&#xe611;</i>"+cartList[i].huifunum+"</span></dd>");
					}
				}
			});
		});
	</script>		
			
		<!-- ajax加载收藏 -->
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/cart/ajaxShoucangCartList.action",
				contentType : "application/json;charset=UTF-8",
				type : "post",
				dataType : "json",
				success : function(dep) {
					var typeId = "${typeId}";
					var cartList = eval(dep);
					if(cartList.length == 0) {
						$("#shoucang").append("<li><a>您没有收藏任何帖子</a></li>"); 
					}else {
						var len = cartList.length;
						if(len>10) {
							len = 10;
						}
						 
						for (var i = 0; i < len; i++) {
							$("#shoucang").append("<li><a href='${pageContext.request.contextPath }/cart/"+cartList[i].cartId+".html'>"+cartList[i].title+"</a></li>");
						}
					}
				}
			});
		});
	</script>		
			