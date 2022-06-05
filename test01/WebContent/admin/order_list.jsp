<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<title>订单列表</title>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/add.jsp";
		}
		//删除商品
		function p_del() {   
			var msg = "您确定要删除该订单吗？";   
			if (confirm(msg)==true){   
			return true;   
			}else{   
			return false;   
			}   
		}   
	</script>
	<style>
		body {
			margin: 0;
			padding: 0;
		}
		
		.bg {
			border-top:0px ;
			border-left:0px ;
			border-right:0px ;
			border-bottom: solid 1px gray;
			height:21px ;
			width:150px;
		}
		
		strong {
			color: #fff;
		}
	</style>
</HEAD>
<body>
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findOrderByManyCondition" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#483D8B">
						<strong>查 询 条 件</strong>
					</td>
				</tr>
				<tr height="22" bgColor="#fdfcf8"></tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%" bgColor="#fdfcf8">
							<tr>
								<td height="22" align="center" class="ta_01">订单编号</td>
								<td class="ta_01">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" class="ta_01">类别：</td>
								<td class="ta_01" >
								<select name="category" id="category">
										<option value="" selected="selected">--选择商品类加--</option>
										<option value="医药">医药</option>
										<option value="数码">数码</option>
										<option value="食品">食品</option>
										<option value="服饰">服饰</option>
										<option value="家电">家电</option>
										<option value="百货">百货</option>
								</select>
								</td>
							</tr>
							<tr>
								<td height="22" align="center" class="ta_01">收件人</td>
								<td class="ta_01">
									<input type="text" name="receiverName" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" class="ta_01">用户名</td>
								<td class="ta_01" >
									<input type="text" name="userName" size="15" value="" id="Form1_userName" class="bg">
								</td>
							</tr>
							<tr>
								<td width="100" height="22" class="ta_01"></td>
								<td class="ta_01" >
									<font face="宋体" color="red"> &nbsp;</font>
								</td>
								<td align="right" class="ta_01">
									<br /><br />
								</td>
								<td style="text-align:right;" class="ta_01">
									<button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
										&#26597;&#35810;
									</button> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#483D8B"><strong>订单列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #483D8B; color: #fff">
								<td align="center" width="20%">订单编号</td>
								<td align="center" width="8%">收件人</td>
								<td align="center" width="20%">收货地址</td>
								<td align="center" width="10%">电话</td>
								<td align="center" width="8%">订单总价</td>
								<td width="8%" align="center">用户名</td>
								<td width="10%" align="center">订单状态</td>
								<td width="8%" align="center">查看</td>
								<td width="8%" align="center">删除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${orders}" var="order">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${order.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${order.receiverName }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${order.receiverAddress }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${order.receiverPhone }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${order.money }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${order.user.username}</td>
									<td width="10%" align="center">${order.paystate==0?"未支付":"已支付"}</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}&type=admin">
											<font style="CURSOR: hand">查看</font>
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
                                        <!--  已支付，弹出提示框由操作人确认 -->
									    <c:if test="${order.paystate!=0 }">
											<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=admin" onclick="javascript:return o_del()">
												<font style="CURSOR: hand">删除</font>
											</a>
										</c:if> 
										<!--  未支付 ，不能删除-->
										<c:if test="${order.paystate==0 }">
											<a href="javascript:alert('不能删除未支付订单')">
												<font style="CURSOR: hand">删除</font>
											</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>