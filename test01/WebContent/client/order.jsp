<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>陈妍欣的电子商务平台</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/client/js/order.js"></script>
	<style>
		* {
			padding:0;
		}
		
		.btn {
			background-color: #FF8C00;
			height: 40px;
			width: 130px;
			font-size: 16px;
		}
	</style>
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div class="container">
		<jsp:include page="menu.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:left; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/client/index.jsp">首页</a>
						   &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/client/cart.jsp">&nbsp;购物车</a>
						   &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;订单
					</div>
					<form id="orderForm" action="${pageContext.request.contextPath}/createOrder" method="post">
						<table cellspacing="0" class="infocontent">
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0">
										<tr>
											<td>
												<p>您好，${user.username}！欢迎您来到结算中心</p>
											</td>
										</tr>
										<tr>
											<td>
											    <table cellspacing="1" class="carttable">
													<tr>
														<td width="10%">序号</td>
														<td width="40%">商品名称</td>
														<td width="10%">价格</td>
														<td width="10%">类别</td>
														<td width="10%">数量</td>
														<td width="10%">小计</td>
													</tr>
												</table> 
												<c:set value="0" var="totalPrice"/>
												<c:forEach items="${cart}" var="entry" varStatus="vs">
													<table width="100%" border="0" cellspacing="0">
														<tr>
															<td width="10%">${vs.count}</td>
															<td width="40%">${entry.key.name }</td>
															<td width="10%">${entry.key.price }</td>
															<td width="10%">${entry.key.category}</td>
															<td width="10%">
															  <input name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
															</td>
															<td width="10%">${entry.key.price*entry.value}</td>
														</tr>
													</table>
													<c:set var="totalPrice" value="${totalPrice+entry.key.price*entry.value}"/>
												</c:forEach>

												<table cellspacing="1" class="carttable">
													<tr>
														<td style="text-align:right; padding-right:40px;"><font
															style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}元</font>
															<input type="hidden" name="money" value="${totalPrice}">
														</td>
													</tr>
												</table>
												<p>
													收货地址：<input id="receiverAddress" name="receiverAddress" type="text" value=""style="width:350px; height:25px" onkeyup="checkReceiverAddress();" />
													&nbsp;&nbsp;&nbsp;&nbsp;
													<span id="receiverAddressMsg"></span>
													<br/><br/>
												        收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName" name="receiverName" type="text" value="${user.username}" style="width:150px; height:25px" onkeyup="checkReceiverName();" />
												    <span id="receiverNameMsg"></span>
												    &nbsp;&nbsp;&nbsp;&nbsp;
													<br/> <br/>
													联系方式：<input type="text" id="receiverPhone" name="receiverPhone" value="${user.telephone}" style="width:150px; height:25px" onkeyup="checkReceiverPhone();" />
													<span id="receiverPhoneMsg"></span>
													&nbsp;&nbsp;&nbsp;&nbsp;
												</p>
												<hr />
												<p style="text-align:right">
													<input value="提&nbsp;交&nbsp;订&nbsp;单&nbsp;>>" class="btn" type="submit" onclick="return checkOnSubmit();" />
<!-- 													<input value="提&nbsp;交&nbsp;订&nbsp;单&nbsp;>>" class="btn" type="submit" onclick="alert('hello');" /> -->
												</p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>
