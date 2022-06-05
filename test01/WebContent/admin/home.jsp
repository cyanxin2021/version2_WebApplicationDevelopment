<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员系统首页</title>
</head>
	<frameset rows="103,*" frameborder=0 border="0" framespacing="0">
  		<frame src="${pageContext.request.contextPath}/admin/head.jsp" name="topFrame" scrolling="NO" noresize>
  		<frameset cols="159,*" frameborder="0" border="0" framespacing="0">
			<frame src="${pageContext.request.contextPath}/admin/left.jsp" name="leftFrame" noresize scrolling="YES">
			<frame src="${pageContext.request.contextPath}/listProduct" name="mainFrame">
  		</frameset>
	</frameset>


</html>