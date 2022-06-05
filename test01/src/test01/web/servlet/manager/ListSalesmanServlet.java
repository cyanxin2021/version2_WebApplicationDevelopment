package test01.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.SalesUser;
import test01.service.UserService;

/**
 * 后台系统
 * 查询所有销售人员信息的servlet
 */
public class ListSalesmanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.创建service层的对象
		UserService service = new UserService();
		// 2.调用service层用于查询所有销售人员的方法
		List<SalesUser> ss = service.listAll();
		// 3.将查询出的所有销售人员放进request域中
		request.setAttribute("ss", ss);
		// 4.重定向到salesman_list.jsp页面
		request.getRequestDispatcher("/admin/salesman_list.jsp").forward(request, response);
		return;
	}

}
