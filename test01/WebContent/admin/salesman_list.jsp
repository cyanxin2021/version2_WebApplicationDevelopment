<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<title>销售人员列表</title>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	    //添加商品
		function addProduct() {
			window.location.href = "${pageContext.request.contextPath}/admin/add.jsp";
		}
		//删除商品
		function p_del() {   
			var msg = "您确定要删除该商品吗？";   
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
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findSalesmanByManyCondition" method="post">
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
								<td height="22" align="center" class="ta_01">销售人员ID</td>
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
					<td class="ta_01" align="center" bgColor="#483D8B"><strong>销售人员 列 表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right" bgColor="#fdfcf8">
						<button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
							&#28155;&#21152;
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #483D8B; color: #fff">
								<td align="center" width="8%">销售人员ID</td>
								<td align="center" width="10%">销售人员名称</td>
								<td align="center" width="9%">登录口令</td>
								<td align="center" width="14%">邮箱</td>
								<td width="14%" align="center">联系电话</td>
								<td width="9%" align="center">负责商品类别</td>
								<td width="7%" align="center">编辑</td>
								<td width="7%" align="center">删除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${ss}" var="s">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${s.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${s.username }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="9%">${s.password }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="14%">${s.email }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${s.telephone}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${s.category}</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="${pageContext.request.contextPath}/findSalesmanById?id=${s.id}">
											<font style="CURSOR: hand">编辑</font>
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="${pageContext.request.contextPath}/deleteSalesman?id=${s.id}" onclick="javascript:return p_del()">
												<font style="CURSOR: hand">删除</font>
										</a>
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