<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>陈妍欣的电子商务平台</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
	<script type="text/javascript">
	//删除订单
	function o_del() {   
	    var msg = "您确定要删除该订单吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	</script>
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0" >
			<tr>
				<td width="20%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						<tr>
							<td class="listtd">
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/findOrderByUser">&nbsp;>>订单查询</a>
							</td>
						</tr>
					</table>
				</td>
			
				<td>
					<div style="text-align:left; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/client/index.jsp">首页</a>
						&nbsp;&nbsp;&gt;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;我的帐户</a>
						&nbsp;&nbsp;&gt;&nbsp;&nbsp;
						订单查询
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p><b>我的订单</b></p>
								<p>
									共有<font style="color:#FF0000" >${orders.size()}</font>个订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td class="tableopentd01">订单号</td>
										<td class="tableopentd01">收件人</td>
										<td class="tableopentd01">订单时间</td>
										<td class="tableopentd01">状态</td>
										<td class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="order">
										<tr>
											<td class="tableopentd02">${order.id}</td>
											<td class="tableopentd02">${order.receiverName }</td>
											<td class="tableopentd02">${order.ordertime}</td>
											<td class="tableopentd02">${order.paystate==0?"未支付":"已支付"}</td>
											<td class="tableopentd03">
												<a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">查看</a>&nbsp;&nbsp;
												<c:if test="${order.paystate==0 }">
													<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}" onclick="javascript:return o_del()">删除</a>
												</c:if> 
												<c:if test="${order.paystate!=0 }">
													<a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client" onclick="javascript:return o_del()">删除</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
