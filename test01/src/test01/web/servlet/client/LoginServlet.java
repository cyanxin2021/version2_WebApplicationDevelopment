package test01.web.servlet.client;
import javax.security.auth.login.LoginException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import test01.domain.User;
import test01.service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.获取登录页面输入的用户名与密码
		String username = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
		String password = request.getParameter("password");
		// 2.调用service完成登录操作。
		UserService service = new UserService();
		try {
			User user = service.login(username, password);
			
			// 3.登录成功，将用户存储到session中.
			request.getSession().setAttribute("user", user);
			
			// 4.获取用户登入的时间，存储到session中
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String logintime = sdf.format(now);
	        System.out.println(logintime);
	        request.getSession().setAttribute("logintime", logintime);
			
			// 获取用户的角色，其中用户的角色分普通用户和超级用户两种
			String role = user.getRole();
			// 如果是超级用户，就进入到后台管理系统；否则进入我的账户页面
			if ("超级用户".equals(role)) {
				response.sendRedirect(request.getContextPath() + "/admin/home.jsp");
				return;
			} else {
				response.sendRedirect(request.getContextPath() + "/client/myAccount.jsp");
				return;
			}
		} catch (LoginException e) {
			// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
			e.printStackTrace();
			request.setAttribute("register_message", e.getMessage());
			request.getRequestDispatcher("/client/login.jsp").forward(request, response);
			return;
		}
	}
	
}
