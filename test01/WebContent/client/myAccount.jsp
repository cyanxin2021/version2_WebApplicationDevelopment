<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>陈妍欣的电子商务平台</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
	<script type="text/javascript">
	//退出确认框
	function confirm_logout() {   
	    var msg = "您确定要退出登录吗？";   
	    if (confirm(msg)==true){   
	    return true;   
	    }else{   
	    return false;   
	    }   
	} 
	</script>
	<style type="text/css">
		* {
			padding: 0;
		}
		
		#divmenu {
			border-style: none;
			background-color: none;
		}
		
		#divpagecontent {
			margin-left: 50px;
		}
	</style>
</head>
<body class="main">
	<p:user/>
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div class="container">
		<%@include file="menu.jsp" %>
		
	
	
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0" style="margin-top:30px">
						<tr>
							<td class="listtitle">我的帐户</td>
						</tr>
						
						<tr>
							<td class="listtd">
								
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="${pageContext.request.contextPath}/findOrderByUser" style="font-size:20px;">&nbsp;>>订单查询</a>
							</td>
						</tr>
						<br/><br/>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					
					<table cellspacing="0">
						<tr>
							<td style="padding:20px; height:300px;"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>
