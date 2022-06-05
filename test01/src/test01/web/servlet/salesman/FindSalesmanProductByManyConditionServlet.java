package test01.web.servlet.salesman;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.dao.UserDao;
import test01.domain.Product;
import test01.domain.SalesUser;
import test01.domain.User;
import test01.service.ProductService;


public class FindSalesmanProductByManyConditionServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取表单数据
		String id = new String(request.getParameter("id").getBytes("iso-8859-1"), "utf-8"); // 商品id
		String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8"); // 商品名称
		String minprice = request.getParameter("minprice"); // 最小价格
		String maxprice = request.getParameter("maxprice"); // 最大价格
		
		// 获取用户id
		int sid = Integer.parseInt(request.getParameter("sid"));
		UserDao dao = new UserDao();
		SalesUser suser = null;
		try {
			suser = dao.findSalesUserById(sid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String category = suser.getCategory(); // 商品类别
		System.out.println(category);
		
		// 2.创建ProductService对象
		ProductService service = new ProductService();
		// 3.调用service层用于条件查询的方法
		List<Product> ps = service.findProductByManyCondition(id, name,
				category, minprice, maxprice);
		// 4.将条件查询的结果放进request域中
		request.setAttribute("ps", ps);
		// 5.请求重定向到商品管理首页product_list.jsp页面
		request.getRequestDispatcher("/salesman/product_list.jsp").forward(request, response);
	}
}

