package test01.web.servlet.salesman;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.dao.UserDao;
import test01.domain.Order;
import test01.domain.Product;
import test01.domain.SalesUser;
import test01.service.OrderService;
import test01.service.ProductService;

/**
 * Servlet implementation class FindSalesmanOrderByManyConditionServlet
 */
public class FindSalesmanOrderByManyConditionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取表单数据
		String id = new String(request.getParameter("id").getBytes("iso-8859-1"), "utf-8"); // 商品id
		String userName = new String(request.getParameter("userName").getBytes("iso-8859-1"), "utf-8"); // 用户名称
		String receiverName = new String(request.getParameter("receiverName").getBytes("iso-8859-1"), "utf-8"); // 收件人
		
		// 获取用户id
		int sid = Integer.parseInt(request.getParameter("sid"));
		UserDao dao = new UserDao();
		SalesUser suser = null;
		try {
			suser = dao.findSalesUserById(sid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String category = suser.getCategory(); // 商品类别
		System.out.println(category);
		
		// 2.创建OrderService对象
		OrderService service = new OrderService();
		// 3.调用service层用于条件查询的方法
		List<Order> orders = service.findOrderByManyCondition(id, receiverName, userName, category);
		// 4.将条件查询的结果放进request域中
		request.setAttribute("orders", orders);
		// 5.请求重定向到商品管理首页product_list.jsp页面
		request.getRequestDispatcher("/salesman/order_list.jsp").forward(request, response);
	}
}
