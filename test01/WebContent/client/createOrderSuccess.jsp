<%@ page language="java" import="java.util.*, test01.domain.Order" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>陈妍欣的电子商务平台</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/client/js/my.js">	
	</script>
</head>
<body class="main">
	<div id="divcontent">
		<table width="850px" border="0" cellspacing="0">
			<tr>
				<td style="padding:30px; text-align:center">
				    <table width="100%" border="0" cellspacing="0" style="margin-top:70px">
						<tr>
							<td style="width:98">
								<img src="${pageContext.request.contextPath }/client/images/checkmark.png" width="128" height="128" />
							</td>
							<td style="padding-top:30px">
								<font style="font-weight:bold; color:#FF0000">亲，订单生成成功，请到“我的账户”-“订单查询”中支付！</font><br /> <br />
								<a href="${pageContext.request.contextPath }/client/myAccount.jsp">
									<span id="second">5</span>秒后自动为您跳转回我的账户</a>
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
