<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="fly-panel-title fly-filter" lay-filter="user">
								  <a id="createtime" href="${pageContext.request.contextPath }/cart/cartList.html?orderBy=createtime&typeId=${typeId}">新帖</a>
	<span class="fly-mid"></span> <a id="huifutime" href="${pageContext.request.contextPath }/cart/cartList.html?orderBy=huifutime&typeId=${typeId}">新回复</a>
	<span class="fly-mid"></span> <a id="readnum" href="${pageContext.request.contextPath }/cart/cartList.html?orderBy=readnum&typeId=${typeId}">热帖</a>
	<span class="fly-mid"></span> <a id="great" href="${pageContext.request.contextPath }/cart/cartList.html?orderBy=great&typeId=${typeId}">精华</a>
</div>

	<script>
	$(function() {
		 var orderBy = "${orderBy}";
		 $("#"+orderBy).addClass("layui-this");
		
	});
	</script>