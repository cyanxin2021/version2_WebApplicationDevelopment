<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
* {
	padding: 0;
}

BODY {
	MARGIN: 0px;
/* 	BACKGROUND-COLOR: #FFFAF0; */
	border-bottom: 5px solid #5F9EA0;
}

BODY {
	FONT-SIZE: 14px;
	COLOR: #000000
}

a {
	text-decoration: none;
}

.height1 {
	width:100%; 
	height:74px; 
}

.headtable {
	padding: 10px 50px 25px 135px;
}

.btn {
	padding: 6px 12px;
	font-size: 14px;
	color: #fff;
	background-color: #6495ED;
	height: 30px;
	width: 100px;
	border: 1px solid transparent;
	border-radius: 4px;
	cursor: pointer;
	text-align:center;
}
</style>

<script type="text/javascript">
	function exitSys() {
		var flag = window.confirm("确认退出系统吗?");
		if (flag) {
			top.location.href="${pageContext.request.contextPath}/logout?time=${logintime}&id=${user.id}";
		}

	}
</script>
</HEAD>
<body>
	<div class="height1">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="headtable">
		<tr>
			<td>
				<img class="img_logo" src="${pageContext.request.contextPath}/client/images/my_logo.png" width="400" height="60" border="0">
			</td>
			<td style="text-align:right; font-size:14px;">
				<input class="btn" value="退出系统" type="button" onclick="exitSys()" />
			</td>
		</tr>
	</table>
	</div>
</body>
</HTML>
