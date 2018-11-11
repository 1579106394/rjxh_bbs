<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>新增模块</title>

		<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/editor/dist/css/wangEditor.min.css">
		<script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
		<script src="${pageContext.request.contextPath }/layui/layui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        #div1 {
            width: 100%;
            height: 500px;
        }
    </style>
		<style type="text/css">
			.tpt_sels a {
				padding-right: 15px;
				position: relative
			}

			.tpt_sels a {
				padding: 0 20px 0 8px;
				color: #3B6268;
				background: #FFFFBA;
				border: 1px #F8E06E solid;
				margin-right: 5px;
				margin-bottom: 5px;
				font-size: 14px;
				height: 26px;
				line-height: 26px;
				display: block;
				float: left
			}

			.tpt_pres a.selected {
				padding: 0 8px;
				color: #3B6268;
				background: #FFFFBA;
				border: 1px #F8E06E solid;
				margin-right: 5px;
				margin-bottom: 5px;
				font-size: 14px;
				height: 26px;
				line-height: 26px;
				display: block;
				float: left
			}

			.tpt_pres a {
				padding: 0 8px;
				color: #fff;
				background: #5AC7A9;
				border: 1px #5AC7A9 solid;
				margin-right: 5px;
				margin-bottom: 5px;
				font-size: 14px;
				height: 26px;
				line-height: 26px;
				display: block;
				float: left
			}

			.tpt_sels a em {
				width: 12px;
				height: 12px;
				font-style: normal;
				display: block;
				position: absolute;
				top: 7px;
				right: 4px;
				z-index: 2;
				background: url(/public//images/sx.png) no-repeat 0 0;
			}

			.cl {
				zoom: 1
			}

			.cl:after {
				content: '\20';
				display: block;
				height: 0;
				clear: both;
				visibility: hidden
			}

		</style>

	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="layui-container fly-marginTop">
			<div class="fly-panel" pad20="" style="padding-top: 5px;">
				<div class="layui-tab layui-tab-brief" lay-filter="user">
					<ul class="layui-tab-title">
						<li class="layui-this">新增模块</li>

					</ul>
					<form id="form" action="${pageContext.request.contextPath }/type/addType.html" method="post">
						<div class="layui-form layui-form-pane" style="padding: 20px 0;">

                            <div class="layui-form-item">
                                <label for="L_title" class="layui-form-label">版块名称</label>
                                <div class="layui-input-block">
                                    <input id="L_title" type="text" name="name" required lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label for="L_title" class="layui-form-label">版块URL</label>
                                <div class="layui-input-block">
                                    <input id="L_title" type="text" name="url" required lay-verify="required" autocomplete="off" class="layui-input">
                                </div>
                            </div>

							<style type="text/css">
								.wp_urls a {
									padding-right: 15px;
									position: relative
								}

								.wp_urls a {
									padding: 0 20px 0 8px;
									color: #3B6268;
									background: #FFFFBA;
									border: 1px #F8E06E solid;
									margin-right: 5px;
									margin-bottom: 5px;
									font-size: 14px;
									height: 26px;
									line-height: 26px;
									display: block;
									float: left
								}

								.wp_urls a em {
									width: 12px;
									height: 12px;
									font-style: normal;
									display: block;
									position: absolute;
									top: 7px;
									right: 4px;
									z-index: 2;
									background: url("public/images/sx.png") no-repeat 0 0;
								}
							</style>
							<div class="layui-form-item">
								<button class="layui-btn" type="submit">立即创建</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>

	</body>
</html>