package test01.web.servlet.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.service.ProductService;
import test01.service.UserService;

/**
 * 后台系统
 * 删除销售人员信息的servlet
 */
public class DeleteSalesmanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取请求参数，产品id
		String id = request.getParameter("id");
		UserService service = new UserService();
		// 调用service完成添加商品操作
		service.deleteSalesman(id);
		response.sendRedirect(request.getContextPath() + "/listSalesman");
		return;
	}

}
