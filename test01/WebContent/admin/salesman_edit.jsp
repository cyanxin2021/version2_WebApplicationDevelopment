<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑销售人员</title>
	
	<LINK href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
	<script type="text/javascript">
// 		//设置类别的默认值
// 		function setProductCategory(t) {
// 			var category = document.getElementById("category");
	
// 			var ops = category.options;
// 			for ( var i = 0; i < ops.length; i++) {
	
// 				if (ops[i].value == t) {
// 					ops[i].selected = true;
// 					return;
// 				}
// 			}
	
// 		};
	</script>
	<style type="text/css">
		strong {
			color: #fff;
		}
		
		td {
			height: 50px;
		}
	</style>
</HEAD>
<body">
	<form id="userAction_save_do" name="Form1" action="${pageContext.request.contextPath}/editSalesman?id=${suser.id}" method="post"
		>
		<input type="hidden" name="id" value="${p.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#483D8B" colSpan="4" height="26">
					<strong>编辑销售人员</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">销售人员名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="username" class="bg" value="${suser.username }" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">登录口令：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="password" class="bg" value="${suser.password }" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">邮箱：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="email" class="bg" value="${suser.email}" />
				</td>
				<TD class="ta_01" align="center" bgColor="#f5fafe">联系电话：</TD>
				<TD class="ta_01" bgColor="#ffffff">
					<input type="text" name="telephone" class="bg" value="${suser.telephone }" />
				</TD>
			</tr>
			<TR>
				<td align="center" bgColor="#f5fafe" class="ta_01">管理商品类别：</td>
				<td class="ta_01" bgColor="#ffffff">
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
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="submit" class="button_ok" value="确定"> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel" /> 
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"> </span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>