<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>邮箱注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/client/js/form.js"></script>

<style type="text/css">
#register {
	width: 450px;
	height: 100px;
	margin: 50px auto;
}

#btn {
/* 	margin-left: 197px; */
	margin-left: 287px;
	margin-top: -33px;
	width: 120px;
	height: 28px;
	font-size: 14px;
/* 	color: #7904c9; */
	color: #fff;
	background-color: #A9A9A9;
}

body {
/* 	background-color: #ecfcf9; */
	background-color: #ffffdf;
}
</style>


<script type="text/javascript">

$(function(){
	$("#btn").click(function(){
		if($("#email").val()){
			$.ajax({
				type:"POST",
				url :"SendEmailServlet?random"+Math.random(),
				data:{
					email:$("#email").val(),
				},
				success:function(data){
					alert("验证码发送成功，请注意查收。");
				},
			})
		}else{
			alert("邮箱发送失败");
			$("#notice").html("请填写邮箱");
			setTimeout(function(){
				$("#notice").hide();
			},1000);
		}
	}
	);
		//  判断用户是否可以注册
		$("#submit").click(function() {
			return checkForm();
			if ($("#email").val()) {
				$("#RegistForm").submit();
			} else { //  如果没有值
				$("#notice").html("请填写完整信息");
				setTimeout(function() {
					$("#notice").hide();
				}, 1000);
			}
		});
	});
</script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<div class="container">
		<div id="register">
			<form class="form-horizontal" id="RegistForm" method="post"
				action="${pageContext.request.contextPath}/RegistServlet"
				onsubmit="return checkForm();">
				<fieldset>
					<div id="legend" class="">
						<legend class="">用户注册</legend>
					</div>
					<div class="form-group">
						<!-- Text input-->
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-5">
							<input type="text" placeholder="字母数字下划线1到10位, 不能是数字开头"
								class="form-control" id="username" name="username"
								onkeyup="checkUsername();"><span id="usernameMsg"></span>
							<!-- 								<font color="#999999">字母数字下划线1到10位, 不能是数字开头</font> -->
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" placeholder="密码请设置6-16位字符"
								class="form-control" name="password" id="password"
								onkeyup="checkPassword();"> <span id="passwordMsg"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">重复密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" name="repassword"
								id="repassword" onkeyup="checkConfirm();"> <span
								id="confirmMsg"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-5">
							<input type="email" placeholder="请输入有效的邮箱地址" class="form-control"
								id="email" name="email" onkeyup="checkEmail();"><span
								id="emailMsg"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">联系电话</label>
						<div class="col-sm-5">
							<input type="text" placeholder="请输入电话号码..." class="form-control"
								name="telephone"">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-5">
							<input type="text" name="code" id="code" placeholder="请输入邮箱的验证码"
								class="form-control" required> <input type="button"
								name="btn" class="btn btn-default" id="btn" value="发送验证码" />
						</div>
					</div>
					<span id="notice" class="hide">请先完成邮箱验证</span><br />
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a href="${pageContext.request.contextPath}/client/login.jsp" class="btn btn-success">返回登录</a> <input
								class="btn btn-info" type="submit" id="submit" value="邮箱注册" />
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>
