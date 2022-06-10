package test01.web.servlet.manager;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import test01.domain.SalesUser;
import test01.service.UserService;

/**
 * Servlet implementation class AddSalesmanServlet
 */
public class AddSalesmanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String username = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
//		String username = request.getParameter("username");
//		System.out.println(username);
//		String password = request.getParameter("password");
//		String email = request.getParameter("email");
//		String telephone = request.getParameter("telephone");
//		String category = new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8");
		SalesUser suser = new SalesUser();
		try {
			BeanUtils.populate(suser, request.getParameterMap());
			String category = new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8");
			suser.setCategory(category);
			System.out.println(suser.getUsername());
			System.out.println(suser.getPassword());
			System.out.println(suser.getCategory());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		SalesUser suser = new SalesUser();
//		String username = request.getParameter("username");
//		if(username != null && username.trim().length() > 0) {
//			System.out.println("用户名："+username);
//			suser.setUsername(username);
//		}
//		
//		
//		String password = request.getParameter("password");
//		if(password != null && password.trim().length() > 0) {
//			System.out.println("密码："+password);
//			suser.setPassword(password);
//		}
//		
//		
//		String email = request.getParameter("email");
//		if(email != null && email.trim().length() > 0) {
//			System.out.println("邮箱："+email);
//			suser.setEmail(email);
//		}
//		
//		
//		String telephone = request.getParameter("telephone");
//		if(telephone != null && telephone.trim().length() > 0) {
//			System.out.println("联系电话："+telephone);
//			suser.setTelephone(telephone);
//		}
//		
//		
//		String category = request.getParameter("category"); // 管理商品类别
//		if(category != null && category.trim().length() > 0) {
//			System.out.println("类别："+category);
//			suser.setCategory(category);
//		}
		
		
		UserService service = new UserService();

		//调用service完成修改商品操作
		service.addSalesman(suser);
		response.sendRedirect(request.getContextPath() + "/listSalesman");
		return;
	}

}
