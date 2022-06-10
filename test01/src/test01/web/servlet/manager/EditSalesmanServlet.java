package test01.web.servlet.manager;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import test01.dao.UserDao;
import test01.domain.SalesUser;
import test01.service.ProductService;
import test01.service.UserService;

/**
 * 后台系统
 * 用于编辑销售人员信息的servlet
 */
public class EditSalesmanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 创建javaBean,将上传数据封装.
		
		UserDao dao = new UserDao();
//		Map<String, String> map = new HashMap<String, String>();
		
//		try {
//			// 将数据封装到javaBean中
//			BeanUtils.populate(suser, map);
//			
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
				
		int id = Integer.parseInt(request.getParameter("id"));
		SalesUser suser;
		try {
			suser = dao.findSalesUserById(id);
			String username = request.getParameter("username");
			if(username != null && username.trim().length() > 0) {
				System.out.println(username);
				suser.setUsername(username);
			}
			
			
			String password = request.getParameter("password");
			if(password != null && password.trim().length() > 0) {
				System.out.println("密码："+password);
				suser.setPassword(password);
			}
			
			
			String email = request.getParameter("email");
			if(email != null && email.trim().length() > 0) {
				System.out.println(email);
				suser.setEmail(email);
			}
			
			
			String telephone = request.getParameter("telephone");
			if(telephone != null && telephone.trim().length() > 0) {
				System.out.println(telephone);
				suser.setTelephone(telephone);
			}
			
			
			String category = request.getParameter("category"); // 管理商品类别
			if(category != null && category.trim().length() > 0) {
				System.out.println(category);
				suser.setCategory(category);
			}
			
			
			UserService service = new UserService();

			// 调用service完成修改商品操作
			service.editSalesman(suser);
			response.sendRedirect(request.getContextPath() + "/listSalesman");
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
