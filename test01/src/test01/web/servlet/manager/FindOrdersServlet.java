package test01.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.Order;
import test01.service.OrderService;


public class FindOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService service = new OrderService();
		List<Order> orders = service.findAllOrder();
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/admin/order_list.jsp").forward(request, response);
	}

}
