package test01.web.servlet.salesman;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.SalesUser;
import test01.service.UserService;

public class SalesLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.获取登录页面输入的用户名与密码
		String username = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
		String password = request.getParameter("password");
		// 2.调用service完成登录操作。
		UserService service = new UserService();
		try {
			SalesUser suser = service.slogin(username, password);
			
			// 3.登录成功，将用户存储到session中.
			request.getSession().setAttribute("suser", suser);
			
			// 4.获取销售人员的登入时间
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String logintime = sdf.format(now);
	        System.out.println(logintime);
	        request.getSession().setAttribute("logintime", logintime);
			
			response.sendRedirect(request.getContextPath() + "/salesman/account.jsp");
			
		} catch (LoginException e) {
			// 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
			e.printStackTrace();
			request.setAttribute("register_message", e.getMessage());
			request.getRequestDispatcher("/client/login.jsp").forward(request, response);
			return;
		}
	}

}
