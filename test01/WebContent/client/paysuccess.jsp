<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>支付成功</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/mypay.js">	
	</script>
</head>
<body class="main">
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
				    <table width="60%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:70">
								<img src="${pageContext.request.contextPath }/client/images/checkmark.png" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">支付成功！祝您购物愉快！</font><br /> <br />
								<a href="${pageContext.request.contextPath }/findOrderByUser">
									<span id="second">5</span>秒后自动为您转跳回订单首页</a>
							</td>
						</tr>
					</table>
				  <h1>&nbsp;</h1>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>