<%@ page language="java" pageEncoding="UTF-8"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>菜单</title>
    <link href="${pageContext.request.contextPath}/admin/css/left.css" rel="stylesheet" type="text/css">
</head>

<body>
    <table width="100" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="12"></td>
        </tr>
    </table>
    <table border="0" style="height:99%">
        <tr>
            <td>
                <table>
                <tr>
                    <td><a href="${pageContext.request.contextPath}/listProduct" target="mainFrame" class="left_list">商品管理</a>
                    </td>
                </tr>
                <tr>
                    <td><a href="${pageContext.request.contextPath}/findOrders" target="mainFrame" class="left_list">订单管理</a>
                    </td>
                </tr>
                <tr>
                    <td><a href="${pageContext.request.contextPath}/listSalesman" target="mainFrame"
                    class="left_list">销售人员管理</a></td>
                </tr>
                </table>
            </td>
        </tr>
<!--         <tr> -->
<!--         	<td> -->
<!--         		<table> -->
<!--         		<tr> -->
<!--         			<td height="100%"></td> -->
<!--         		</tr> -->
<!--         	</table> -->
<!--         	</td> -->
<!--         </tr> -->
    </table>
</body>

</html>