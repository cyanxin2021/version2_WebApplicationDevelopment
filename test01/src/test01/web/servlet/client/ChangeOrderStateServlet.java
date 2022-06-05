package test01.web.servlet.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.service.OrderService;

/**
 * Servlet implementation class ChangeOrderStateServlet
 */
public class ChangeOrderStateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("id");
		String paySuccess = "恭喜您支付成功!";
		if(orderid != null) {
			OrderService service = new OrderService();
			// 根据订单号修改订单状态
			try {
				service.updateState(orderid);
				request.setAttribute("paySuccess", paySuccess);
				request.getRequestDispatcher("/findOrderByUser").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().write("修改订单状态失败");
			}
		}
		
	}

}
