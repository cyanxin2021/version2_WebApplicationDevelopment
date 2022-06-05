package test01.web.servlet.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test01.domain.User;
import test01.service.OrderService;
import test01.domain.Order;

public class DelOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//订单id
		String id = request.getParameter("id");
		OrderService service = new OrderService();
		// 已支付的订单带有type值为client的参数
		String type = request.getParameter("type");
		// 删除已支付的订单
		if(type != null && type.trim().length() > 0) {
			service.delOrderById(id);
			if("admin".equals(type)) {
				request.getRequestDispatcher("/findOrders").forward(request, response);
				return;
			}
		} else {
			// 调用service层方法删除相应未支付的订单
			service.delOrderByIdWithClient(id);
		}
		request.getRequestDispatcher("/findOrderByUser").forward(request, response);
		return;
	}

}
