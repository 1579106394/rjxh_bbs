<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>${user.niko }的主页</title>

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

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<link rel="stylesheet" href="/template/u_default/css/tp5page.css">
		<div class="fly-home" style="background-image: url();">
			<img src="${user.image }" alt="${user.niko }">
			<h1>
        ${user.niko } <i class="iconfont icon-nv"></i>    </h1>
			<p class="fly-home-info">
				<i class="layui-icon">&#xe637;</i><span>${user.time } 加入</span>
				<i class="layui-icon">&#xe715;</i><span>${user.clazz }</span>
			</p>
			<p class="fly-home-sign">
				<c:if test="${user.autograph != null }">
					${user.autograph }
				</c:if>
				<c:if test="${user.autograph == null }">
					（这个人懒得留下签名）
				</c:if>
				</p>
		</div>
		<div class="layui-container">

			<div class="layui-tab layui-tab-brief">

				<ul class="layui-tab-title" style="padding-left: 39%;">
					<li style="padding:0 20px;"  class="layui-this">ta发表的帖子</li>
					<li style="padding:0 20px;">ta收藏的帖子</li>
				</ul>

				<div class="fly-panel leifeng-rank layui-tab-content" style="padding: 20px;min-height:100px">
		
					<div class="layui-tab-item layui-show" style="text-align: center;">
						
							<table id="demo" lay-filter="test"></table>
							<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-1" style=" ">
								<div class="layui-table-box">
									<div class="layui-table-header">
										<table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
											<thead>
												<tr>
													<th data-field="title" data-minwidth="300">
														<div class="layui-table-cell laytable-cell-1-title"><span>帖子标题</span></div>
													</th>
													<th data-field="status">
														<div class="layui-table-cell laytable-cell-1-status" align="center"><span>状态</span></div>
													</th>
													<th data-field="time">
														<div class="layui-table-cell laytable-cell-1-time" align="center"><span>发表时间</span></div>
													</th>
													<th data-field="3">
														<div class="layui-table-cell laytable-cell-1-3" align="center"><span>点赞</span></div>
													</th>
													
												</tr>
											</thead>
										</table>
									</div>
									<div class="layui-table-body layui-table-main">
										<table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
											<tbody id="myCartTbody">
												
											</tbody>
										</table>
											<div id="myCartNone" class="layui-none">无数据</div>
										
									</div>
								</div>
								<div class="layui-table-page layui-hide">
									<div id="layui-table-page1"></div>
								</div>
								<style>
									.laytable-cell-1-title {
										width: 663px;
										text-aline: left;
									}
									
									.laytable-cell-1-status {
										width: 100px;
									}
									
									.laytable-cell-1-time {
										width: 215px;
									}
									
									.laytable-cell-1-3 {
										width: 150px;
									}
								
								</style>
							</div>
					</div>
					<div class="layui-tab-item" style="text-align: center;">
						<table id="myCollection" lay-filter="test11"></table>
							<div class="layui-form layui-border-box layui-table-view" lay-filter="LAY-table-2" style=" ">
								<div class="layui-table-box">
									<div class="layui-table-header">
										<table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
											<thead>
												<tr>
													<th data-field="title" data-minwidth="300">
														<div class="layui-table-cell laytable-cell-1-title"><span>帖子标题</span></div>
													</th>
													<th data-field="status">
														<div class="layui-table-cell laytable-cell-1-status" align="center"><span>作者</span></div>
													</th>
													<th data-field="time">
														<div class="layui-table-cell laytable-cell-1-time" align="center"><span>发表时间</span></div>
													</th>
													<th data-field="3">
														<div class="layui-table-cell laytable-cell-1-3" align="center"><span>点赞</span></div>
													</th>
												</tr>
											</thead>
										</table>
									</div>
									<div class="layui-table-body layui-table-main">
										<table class="layui-table" lay-skin="line" cellspacing="0" cellpadding="0" border="0">
											<tbody id="myShoucangTbody">
											</tbody>
										</table>
										<div id="myShoucangNone" class="layui-none">无数据</div>
									</div>
								</div>
								<div class="layui-table-page layui-hide">
									<div id="layui-table-page2"></div>
								</div>
								<style>
									.laytable-cell-2-title {
										width: 396px;
										text-aline: left;
									}
									
									.laytable-cell-2-username {
										width: 396px;
									}
									
									.laytable-cell-2-time {
										width: 120px;
									}
								</style>
							</div>
					</div>

				</div>
			</div>
		</div>
		
		<script>
//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  
  //…
});
</script>
		
		<jsp:include page="footer.jsp"></jsp:include>
		<!--页面JS脚本-->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/home.js"></script>
		<ul class="layui-fixbar">
			<li class="layui-icon" lay-type="bar1" style="background-color:#009688"></li>
			<li class="layui-icon layui-fixbar-top" lay-type="top" style="background-color:#009688"></li>
		</ul>
	</body>
	
		<script type="text/javascript">
	/* ajax加载我的帖子 */
	$(function() {
		var id = "${user.id}";
		var value="{\"id\":\""+id+"\"}";
		$.ajax({
			url : "${pageContext.request.contextPath}/user/getMyCartList.action",
			data : value,
			contentType : "application/json;charset=UTF-8",
			type : "post",
			dataType : "json",
			success : function(data){
					 var cartList = eval(data);
					 var tbody = document.getElementById("myCartTbody");
					var trArrays = tbody.getElementsByTagName("tr");
					//清除操作
					for(var i=0;i<trArrays.length;i++){
						tbody.removeChild(trArrays[i]);
						i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
							//如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
					}
					
					for(var i=0;i<cartList.length;i++){
						$("#myCartNone").html("");
						$("#myCaryNum").html(cartList.length);
						var flag;
						if(cartList[i].great == 2)
							flag = "加精";
						else if(cartList[i].top == 2)
							flag = "置顶";
						else 
							flag = "正常";
						$("#myCartTbody").append(
							"<tr>                                                                                                 "+
							"	<td  data-minwidth='300'>                                                                         "+
							"		<div class='layui-table-cell laytable-cell-1-title'><span>"+
							"<a href='${pageContext.request.contextPath}/cart/"+cartList[i].cartId+".html'>"+cartList[i].title+"</a>"+
							"</span></div>               "+
							"	</td>                                                                                             "+
							"	<td >                                                                                             "+
							"		<div class='layui-table-cell laytable-cell-1-status' align='center'><span>"+flag+"</span></div>   "+
							"	</td>                                                                                             "+
							"	<td  data-minwidth='150'>                                                                                             "+
							"		<div class='layui-table-cell laytable-cell-1-time' align='center'><span>"+cartList[i].createtime+"</span></div> "+
							"	</td>                                                                                            "+
							"	<td >                                                                                            "+
							"		<div class='layui-table-cell laytable-cell-1-3'><span>"+cartList[i].zan+"</span></div>                       "+
							"	</td>                                                                                            "+
							"</tr>		                                                                                          "
						);                                                                                                       
					}
					
					
					
					
			}
		});
	});

	/* ajax加载我的收藏 */
	$(function() {
		var id = "${user.id}";
		var value="{\"id\":\""+id+"\"}";
		$.ajax({
			url : "${pageContext.request.contextPath}/user/getMyShoucangList.action",
			data : value,
			contentType : "application/json;charset=UTF-8",
			type : "post",
			dataType : "json",
			success : function(data){
					 var cartList = eval(data);
					 var tbody = document.getElementById("myShoucangTbody");
					var trArrays = tbody.getElementsByTagName("tr");
					//清除操作
					for(var i=0;i<trArrays.length;i++){
						tbody.removeChild(trArrays[i]);
						i--;//此处的i--是因为当删除一个optionArrays中的一个数据，它的长度就会减一，
							//如果没有进行着操作的话，就会导致清除的效果不佳，使得有些选项没有被删除
					}
					
					for(var i=0;i<cartList.length;i++){
						$("#myShoucangNone").html("");
						$("#myShoucangNum").html(cartList.length);
						$("#myShoucangTbody").append(
							"<tr>                                                                                                 "+
							"	<td  data-minwidth='300'>                                                                         "+
							"		<div class='layui-table-cell laytable-cell-1-title'><span>"+
							"<a href='${pageContext.request.contextPath}/cart/"+cartList[i].cartId+".html'>"+cartList[i].title+"</a>"+
							"</span></div>               "+
							"	</td>                                                                                             "+
							"	<td >                                                                                             "+
							"		<div class='layui-table-cell laytable-cell-1-status' align='center'><span>"+
							"<a href='${pageContext.request.contextPath}/homepage"+cartList[i].user.id+".html'>"+cartList[i].user.niko+"</a>"+
							"</span></div>   "+
							"	</td>                                                                                             "+
							"	<td  data-minwidth='150'>                                                                                             "+
							"		<div class='layui-table-cell laytable-cell-1-time' align='center'><span>"+cartList[i].createtime+"</span></div> "+
							"	</td>                                                                                            "+
							"	<td >                                                                                            "+
							"		<div class='layui-table-cell laytable-cell-1-3'><span>"+cartList[i].zan+"</span></div>                       "+
							"	</td>                                                                                            "+
							"</tr>		                                                                                          "
						);                                                                                                       
					}
					
					
					
					
			}
		});
	});

	</script>

</html>