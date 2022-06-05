package test01.web.servlet.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.User;

/**
 * Servlet implementation class MyAccountServlet
 */
public class MyAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/**
		 * 点击前台系统中的【我的账户】，分以下两种情况：
		 * 1、用户未登录，进入登录页面
		 * 2、用户已登录
		 *   a、超级用户，进入到后台系统
		 *   b、普通用户，登录到我的账户
		 */
		//在session中查找名为“user”的会话
		User user = (User) request.getSession().getAttribute("user");
		//如果找到没有名为“user”的会话，说明用户没有登录，此时跳转到登录页面
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/client/login.jsp");
			return;
		}
		//如果是超级用户，进入到商务平台的后台管理系统；否则进入到普通用户的账户信息页面
		if ("超级用户".equals(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp");
//			return;
		}else{
			response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
//			return;
		}
	}

}
