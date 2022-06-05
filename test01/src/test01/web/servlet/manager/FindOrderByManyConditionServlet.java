package test01.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.Order;
import test01.service.OrderService;


public class FindOrderByManyConditionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取订单编号 收件人名称和用户名
		String id = request.getParameter("id");
		String receiverName = request.getParameter("receiverName");
		String userName = request.getParameter("userName");
		String category = new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8"); // 商品类别
		//创建Service层对象
		OrderService service = new OrderService();
		//调用Service层OrderService类的findOrderByManyCondition()方法查询数据
		List<Order> orders = service.findOrderByManyCondition(id, receiverName, userName, category);
		//将查询结果添加到request作用域中
		request.setAttribute("orders", orders);
		//请求转发到order_list.jsp页面，并将request请求和response响应也转发到该页面中
		request.getRequestDispatcher("/admin/order_list.jsp").forward(request, response);
	}

}
