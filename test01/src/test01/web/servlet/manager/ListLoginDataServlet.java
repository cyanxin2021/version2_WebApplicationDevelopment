package test01.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.LoginData;
import test01.service.UserService;

/**
 * Servlet implementation class ListLoginDataServlet
 */
public class ListLoginDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService service = new UserService();
		List<LoginData> ld = service.listAllData();
		request.setAttribute("ld", ld);
		request.getRequestDispatcher("/admin/logindata_list.jsp").forward(request, response);
		return;
	}

}
