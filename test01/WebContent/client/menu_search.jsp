<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
/**
 * my_click和my_blur均是用于前台页面搜索框的函数
 */
//鼠标点击搜索框时执行
function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}
//鼠标不聚焦在搜索框时执行
function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}

/**
 * 点击搜索按钮执行的函数
 */
 function search(){
		document.getElementById("searchform").submit();
	}
</script>
<style>
	.search {
		color: #fff;
    	background-color: #8FBC8F;
    	border-color: #4cae4c;
    	padding: 7px 25px;
    	font-size: 18px;
    	border-radius: 4px;
    	vertical-align: middle;
	}
</style>
<div id="divsearch">
<form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr>
			<td style="text-align:center; ">
				
				<input type="text" name="textfield" class="inputtable" id="textfield" value="请输入要查找的商品"
				onmouseover="this.focus();"
				onclick="my_click(this, 'textfield');"
				onBlur="my_blur(this, 'textfield');"
				style="width: 60%; height: 40px; vertical-align:middle;"  />&nbsp;&nbsp;
<!-- 				<a href="#"> -->
<%-- 					<img src="${pageContext.request.contextPath}/client/images/serchbutton.gif" height="40px" border="0" style="margin-bottom:-4px;vertical-align:middle;" onclick="search()"/>  --%>
<!-- 				</a> -->
				<input type="submit" value="搜索" onclick="search()" class="search" />
			</td>
		</tr>
	</table>
</form>
</div>