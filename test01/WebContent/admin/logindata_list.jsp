<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<title>商品列表</title>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" height="25" bgColor="#483D8B"><strong>登录数据</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right" height="20" bgColor="#fdfcf8">
						
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #483D8B; color: #fff">
								<td align="center" width="10%">数据编号</td>
								<td align="center" width="10%">用户编号</td>
								<td align="center" width="18%">用户名</td>
								<td align="center" width="20%">登入时间</td>
								<td width="20%" align="center">登出时间</td>
								<td width="20%" align="center">IP地址</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${ld}" var="l">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${l.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${l.user_id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${l.username }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${l.logintime }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${l.logouttime}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${l.ip}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
</body>
</HTML>