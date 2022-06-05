<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>陈妍欣的电子商务平台</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
	<style>
		.btn {
			padding: 6px 12px;
			font-size: 14px;
			color: #fff;
			background-color: #FFA500;
			height: 30px;
			width: 100px;
			border: 1px solid transparent;
			border-radius: 4px;
			cursor: pointer;
			text-align:center;
		}
	</style>
	<script language="javascript">
		
	function formcheck(){
		if(!form1.username.value) {
			alert("用户名必须填写!");
			return false;
		}else if(!form1.password.value) {
			alert("密码必须填写!");
			return false;
		}
		return true;
	}
	
	function send1(){
		if(formcheck()){
			document.form1.action="${pageContext.request.contextPath}/login";
			document.form1.submit();
		}
		else return false;
	}
	
	function send2(){
		if(formcheck()){
			document.form1.action="${pageContext.request.contextPath}/saleslogin";
			document.form1.submit();
		}
		else return false;
	}
	</script>
</head>
<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divcontent">
<%-- 		<form name="form1" action="${pageContext.request.contextPath}/login" method="post" onsubmit="return formcheck();"> --%>
		<form name="form1" method="post">

			<table width="900px" border="0" cellspacing="0">
				<tr>
					<td style="padding:30px"><div style="height:470px">
							<div>
								<table width="85%" border="0" cellspacing="0" align="center">
									<tr>
										<td id="logindiv">
											
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td style="text-align:left; padding-top:20px; padding-left: 120px;">
															<%-- <img src="${pageContext.request.contextPath }/client/images/logintitle.gif" width="150" height="30" /> --%>
															<font weight="bold" size="5px" color="green">个人用户登录</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center;padding-top:20px;"><font
															color="#ff0000">${requestScope["register_message"]}</font>
														</td>
													</tr>
													<tr>
														<td style="text-align:center">
															<table width="80%" border="0" cellspacing="0"
																style="margin-top:15px ;margin-left:auto; margin-right:auto">
																<tr>
																	<td
																		style="text-align:right; padding-top:5px; width:25%; font-size:20px">用户名：</td>
																	<td style="text-align:left"><input name="username"
																		type="text" class="textinput" style="width: 70%; height:30px" /><br><br>
																	</td>
																</tr>
																
																<tr>
																	<td style="text-align:right; padding-top:5px; font-size:20px">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
																	<td style="text-align:left"><input name="password"
																		type="password" class="textinput" style="width: 70%; height:30px" /><br><br>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center">
																		<input name="submit1" type="submit" class="btn" value="登录" onclick="send1();"/>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:center">
																		<input name="submit2" type="submit" class="btn" value="销售人员登录&nbsp;" style="background-color:#DC143C" onclick="send2();"/>
																	</td>
																</tr>
																<tr>
																	<td colspan="2"
																		style="padding-top:10px; text-align:right;"><a
																		href="${pageContext.request.contextPath}/client/register.jsp" ><font size="3" color="red">>> 立即注册</font>
																	</a></td>
																
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
