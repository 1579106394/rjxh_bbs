<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 导航栏 -->

<div class="fly-panel fly-column">
	<div class="layui-container">
		<ul class="layui-clear ul1" id="ul1">

		</ul>
		<div class="fly-column-right layui-hide-xs">
			<span class="fly-search"> <i class="layui-icon">&#xe615;</i></span> <a
				href="${pageContext.request.contextPath }/fatie.html"
				class="layui-btn">发表新帖</a>
		</div>
		<div class="layui-hide-sm layui-show-xs-block"
			style="margin-top: -10px; padding-bottom: 10px; text-align: center;">
			<span class="fly-search"> <i class="layui-icon">&#xe615;</i></span> <a
				href="${pageContext.request.contextPath }/fatie.html"
				class="layui-btn">发表新帖</a>
		</div>
	</div>
</div>
<script>
	layui.define([ 'layer' ],
					function(exports) {
						var $ = layui.jquery, layer = layui.layer;
						$('.fly-search')
								.on('click',function() {
											var url = "${pageContext.request.contextPath}/cart/searchCart.html";
											layer.open({
														type : 1,
														title : false,
														closeBtn : false,
														shadeClose : true,
														maxWidth : 10000,
														skin : 'fly-layer-search',
														content : [
																'<form action="' + url + '" method="post">',
																'<input name="keyWords" autocomplete="off" placeholder="请输入文章标题、内容，回车开始搜索" type="text" style="width:350px" name="ks">',
																'</form>' ].join(''),
														success : function(layero) {
														var input = layero.find('input');
														input.focus();
														layero.find('form').submit(function() {
																			var val = input.val();
																			if (val.replace(/\s/g,'') === '') {
																				return false;
																			}
																			input.val(input.val());
																		});
														}
													})
										});
					});
</script>

<!-- ajax加载导航栏菜单 -->
<script type="text/javascript">
	$(function() {
		$.ajax({
					url : "${pageContext.request.contextPath}/type/ajaxGetTypeList.action",
					contentType : "application/json;charset=UTF-8",
					type : "post",
					dataType : "json",
					success : function(dep) {
						var typeId = "${typeId}";
						var cartList = eval(dep);
						
						for (var i = 0; i < cartList.length; i++) {
							$(".ul1").append("<li id="+cartList[i].typeId+" class=''><a href='${pageContext.request.contextPath}/"+ cartList[i].url+"'>"+ cartList[i].name + "</a> </li>");
						}
						$(".ul1").append("<li class='layui-hide-xs layui-hide-sm layui-show-md-inline-block'><span class='fly-mid'></span></li>");
						$("#"+typeId).addClass("layui-this");
						
						
					}
				});
	});
	
	
</script>
