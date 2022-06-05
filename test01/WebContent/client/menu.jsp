<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

a href {
	cursor: pointer;
	}

.menu_list{font-size:14px; padding-right:12px; display:block; width:135px; height:30px; line-height:30px; text-align:center;}

</style>

<div id="divmenu">
		<ul>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=医药" class="menu_list">医药</a> </li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=数码" class="menu_list">数码</a> </li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=食品" class="menu_list">食品</a> </li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=服饰" class="menu_list">服饰</a> </li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=家电" class="menu_list">家电</a></li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage?category=百货" class="menu_list">百货</a></li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage" class="menu_list">全部商品</a></li>
			<hr/>
			<li style="list-style-type:none;"><a href="${pageContext.request.contextPath}/showProductByPage" class="menu_list">猜你喜欢</a></li>
		</ul>
				
</div>