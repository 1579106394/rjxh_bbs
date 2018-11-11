<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>基本设置</title>

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
		<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/favicon.ico">
		  <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/globall.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath }/css/tp5page.css">
		<script src="https://hm.baidu.com/hm.js?8809b1cab8e955d96e2d72b31e9d460c"></script>
		
		
            
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/layui/lay/modules/layer.js"></script>
		<link id="layuicss-layer" rel="stylesheet" href="${pageContext.request.contextPath }/css/layer.css" media="all">
			
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jigsaw.css">

			<script>
			layui.use(['form', 'layedit', 'laydate'], function(){
			  var form = layui.form
			  ,layer = layui.layer
			  ,layedit = layui.layedit
			  ,laydate = layui.laydate;
			
			   //自定义验证规则
			  form.verify({
				  username: function(value){ //value：表单的值、item：表单的DOM对象
					    if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
					      return '用户名不能有特殊字符';
					    }
					    if(/(^\_)|(\__)|(\_+$)/.test(value)){
					      return '用户名首尾不能出现下划线\'_\'';
					    }
					    if(value.length < 6 || value.length > 12){
					        return '用户名长度必须在6-12之间';
					    }
					  }
			  ,repass: function(value){
				  var repassvalue = $('#L_pass').val();
				  if(value != repassvalue){
				  return '两次输入的密码不一致!';
				  }
			  }
					  //我们既支持上述函数式的方式，也支持下述数组的形式
					  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
					  ,pass: [
					    /^[\S]{6,12}$/
					    ,'密码必须6到12位，且不能出现空格'
					  ]      
			  }); 
			  
			 
			  
			  
			});
			</script>
	</head>
	
	<script type="text/javascript">
		function commitBase() {
			$("#baseForm").submit();
		}
	</script>

	<body>
	<c:set var="user" value="${sessionScope.user }"></c:set>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="layui-container fly-marginTop fly-user-main">
			
			<!-- 引入左边 -->
			<jsp:include page="mineleft.jsp"></jsp:include>
			
			<div class="site-mobile-shade"></div>

			<div class="fly-panel fly-panel-user" pad20="">
				<div class="layui-tab layui-tab-brief" lay-filter="user">
					<ul class="layui-tab-title" id="LAY_mine">
						<li class="layui-this" lay-id="info">我的资料</li>
						<li lay-id="avatar" class="">头像</li>
						<li lay-id="pass" class="">密码</li>
					</ul>
					<div class="layui-tab-content" style="padding: 20px 0;">
					<div class="layui-form layui-form-pane layui-tab-item layui-show">
				<form id="baseForm" action="${pageContext.request.contextPath }/user/updateBase.html" method="post">
				<input type="hidden" name="id" value="${user.id }"> 

                    <div class="layui-form-item">
                        <div class="layui-form-item">
                            <label for="L_city" class="layui-form-label">昵称</label>
                            <div class="layui-input-inline">
                                <input name="niko" title="4-10个字节" required="" lay-verify="required" value="${user.niko }" class="layui-input" type="text">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_city" class="layui-form-label">手机号</label>
                            <div class="layui-input-inline">
                                <input name="telephone" disabled value="${user.telephone }" class="layui-input" type="text">
                            </div>
                        </div>
                        <label for="L_email" class="layui-form-label">邮箱</label>
                        <div class="layui-input-inline">
                            <input id="L_email" name="email" disabled autocomplete="off" value="${user.email }" class="layui-input" type="text">
                        </div>
       <!-- <div class="layui-form-mid layui-word-aux"><a href="javascript:;" style="font-size: 12px; color: #4f99cf;" id="jhemail">激活邮箱</a>。</div> -->

                        

                    </div>
                    <%-- <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>


                        <div class="layui-input-block">
                        <c:if test="${user.sex == 2 }">
                            <input name="sex" value="1" title="男" type="radio"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                            <input name="sex" value="2" title="女" checked="" type="radio"><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>女</div></div>
                      	</c:if>
                        <c:if test="${user.sex == 1 }">
                            <input name="sex" value="1" title="男" checked="" type="radio"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>男</div></div>
                            <input name="sex" value="2" title="女" type="radio"><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>女</div></div>
                      	</c:if>
                        </div>

                    </div> --%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <c:if test="${user.sex == 2 }">
                        <input type="radio" name="sex" value="1" title="男">
							<input type="radio" name="sex" value="2" title="女" checked>
                        </c:if>
                        <c:if test="${user.sex == 1 }">
                        <input type="radio" name="sex" value="1" title="男" checked>
						<input type="radio" name="sex" value="2" title="女" >
                        </c:if>
                        <c:if test="${user.sex != 1 and user.sex != 2 }">
                        <input type="radio" name="sex" value="1" title="男">
						<input type="radio" name="sex" value="2" title="女" >
                        </c:if>
					 </div>
                    <div class="layui-form-item">
                        <label for="L_city" class="layui-form-label">住址</label>
                        <div class="layui-input-inline">
                            <input id="L_city" name="clazz" value="${user.clazz }" autocomplete="off" class="layui-input" type="text">
                        </div>
                    </div>


                    <div class="layui-form-item layui-form-text">
                        <label for="L_sign" class="layui-form-label">签名</label>
                        <div class="layui-input-block">
                            <textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="autograph" autocomplete="off" class="layui-textarea" style="height: 80px;">${user.autograph }</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button onclick="commitBase();" class="layui-btn" key="set-mine" lay-filter="user_set">修改</button>
                    </div>
                    
                    <style>
.kill-color{
display: block;
width:60px;
cursor:pointer;
float:left;
margin-right:10px;
height: 30px;

line-height: 30px;
padding: 0px 5px;
background-color: #999;
color: #FFF;
font-size: 12px;
border-radius: 0px;
}
.setcolor{height:30px;line-height: 30px;padding: 0px 5px;float:left;margin-right:5px;cursor:pointer;color:#FFF}
</style>


<script>

layui.use('form', function(){
  var form = layui.form
  ,jq = layui.jquery;

  
})
</script>
                </form>
                </div>
					<!-- </form> -->
						<div class="layui-form layui-form-pane layui-tab-item">
							<form method="post">
								<div class="layui-form-item">
									<div class="avatar-add">
										<p>建议尺寸168*168，支持jpg、png、gif，最大不能超过50KB</p>

										<button id="image" type="button" class="layui-btn upload-img"> <i class="layui-icon"></i>上传头像 </button>
										<input name="image" value="" class="layui-input" type="hidden">
										<img id="touxiang" src="${user.image }">
									</div>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn" lay-submit="" lay-filter="user_headedit">确认修改</button>
								</div>
							</form>
						</div>

						<div class="layui-form layui-form-pane layui-tab-item">
							<form id="passForm" action="${pageContext.request.contextPath }/user/updatePass.html"class="layui-form" method="post">

								<input type="hidden" name="id" value="${user.id }"> 
								<div class="layui-form-item">
										<label for="L_pass" class="layui-form-label">新密码</label>
										<div class="layui-input-inline">
											<input type="password" id="L_pass" name="password" required lay-verify="required|pass" placeholder="必填：6到12个字符" autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label for="L_repass" class="layui-form-label">确认密码</label>
										<div class="layui-input-inline">
											<input type="password" id="L_repass" required lay-verify="required|repass" placeholder="必填：6到12个字符" autocomplete="off" class="layui-input">
										</div>
									</div>
								<div class="layui-form-item">
									<input class="layui-btn" key="set-mine" type="submit" value="确认修改">
								</div>
							</form>
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
	
	<script>
layui.use(['form','layer','table','upload'], function(){
	 var $ = layui.jquery
     , upload = layui.upload;
   
      var uploadInst = upload.render({
       elem: '#image'
    	,accept: 'file'
       ,url: '${pageContext.request.contextPath}/upload/uploadImage.action',
    	   size: 1000,
           accept: 'file',
           size:'204800', //kb
           done: function(res){
         var src = res.data.src;
         layer.msg('上传成功');
         $("#touxiang").attr('src', src);
         $("#headerImage").attr('src', src);
         
       }
       ,error: function(){
    	   layer.msg('上传失败，请尽量选小一点的图片');
       }
     });
});
</script>

</html>