<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="test01.domain.User"%>
<script type="text/javascript">
//退出确认框
function confirm_logout() {   
    var msg = "您确定要退出登录吗？";   
    if (confirm(msg)==true){   
    	return true;   
    }
    else{   
    	return false;   
    }   
} 
</script>
<div id="divhead">
	<table cellspacing="0" class="headtable">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath }/client/index.jsp">
					<img src="${pageContext.request.contextPath}/client/images/my_logo.png" width="400" height="60" border="0" /> 
				</a>
			</td>
			<td style="text-align:right; font-size:12px;">
				<%
				User user = (User) request.getSession().getAttribute("user");
				if(null == user){
				%>
				欢迎光临，请<a href="${pageContext.request.contextPath}/myAccount"><font color="#ff0000">登录
				</font></a>
				<%
				}
				else {
				%>
				欢迎您：${user.username}
				| <a href="${pageContext.request.contextPath}/client/cart.jsp">购物车</a> 
				<%
				}
				%>
				<% 
				if(null == user){
				%>
				| <a href="${pageContext.request.contextPath}/client/register.jsp">新用户注册</a>							
				<% 	
				}else {
				%>
				| <a href="${pageContext.request.contextPath}/myAccount">我的帐户</a>
				| <a href="${pageContext.request.contextPath}/logout?time=${logintime}&id=${user.id}" onclick="javascript:return confirm_logout()">用户退出</a>
				<%
				}
				%>	
			</td>		
		</tr>
	</table>
</div>