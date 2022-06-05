<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<title>商品列表</title>
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
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findSalesmanProductByManyCondition?sid=${suser.id}" method="post">
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
								<td height="22" align="center" class="ta_01">商品编号</td>
								<td class="ta_01">
									<input type="text" name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" class="ta_01">价格区间(元)：</td>
								<td class="ta_01" >
									<input type="text" name="minprice" size="10" value="" />
									- 
									<input type="text" name="maxprice" size="10" value="" />
								</td>
							</tr>
							<tr>
								<td height="22" align="center" class="ta_01">&nbsp;&nbsp;&nbsp;商品名称：</td>
								<td class="ta_01">
									<input type="text" name="name" size="15" value="" id="Form1_userName" class="bg" />
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
					<td class="ta_01" align="center" bgColor="#483D8B"><strong>商 品 列 表</strong>
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
								<td align="center" width="24%">商品编号</td>
								<td align="center" width="18%">商品名称</td>
								<td align="center" width="9%">商品价格</td>
								<td align="center" width="9%">商品数量</td>
								<td width="8%" align="center">商品类别</td>
								<td width="8%" align="center">编辑</td>
								<td width="8%" align="center">删除</td>
							</tr>
                            <!--  循环输出所有商品 -->
							<c:forEach items="${ps}" var="p">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="200">${p.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="18%">${p.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">${p.pnum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">${p.category}</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
									    <a href="${pageContext.request.contextPath}/findProductById?id=${p.id}&type=admin">
											<font style="CURSOR: hand">编辑</font>
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px" width="7%">
										<a href="${pageContext.request.contextPath}/deleteProduct?id=${p.id}" onclick="javascript:return p_del()">
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