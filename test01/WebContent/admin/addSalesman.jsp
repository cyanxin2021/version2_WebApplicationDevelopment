<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加销售人员</title>
	<LINK href="${pageContext.request.contextPath}/admin/css/Style.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		strong {
			color: #fff;
		}
		
		td {
			height: 50px;
		}
	</style>
</HEAD>
<body>
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/addSalesman" method="post">
<!-- 		enctype="multipart/form-data"> -->
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#483D8B" colSpan="4"
					height="26"><strong>添加销售人员</strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">销售人员名称：</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text" name="username" class="bg" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">登录口令：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="password" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">电子邮箱：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="email" class="bg" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
				<td class="ta_01" bgColor="#ffffff">
					<input type="text" name="telephone" class="bg" />
				</td>
			</tr>
			<tr>
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
<!-- 				<td class="ta_01" bgColor="#ffffff"><td class="ta_01" bgColor="#ffffff"> -->
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<input type="submit" class="button_ok" value="确定">	
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" class="button_cancel">					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	</form>
</body>
</HTML>