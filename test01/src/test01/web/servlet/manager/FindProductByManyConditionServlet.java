package test01.web.servlet.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.Product;
import test01.service.ProductService;


public class FindProductByManyConditionServlet extends HttpServlet {

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
		System.out.println(name);
		String category = new String(request.getParameter("category").getBytes("iso-8859-1"), "utf-8"); // 商品类别
		String minprice = request.getParameter("minprice"); // 最小价格
		String maxprice = request.getParameter("maxprice"); // 最大价格
		
		// 2.创建ProductService对象
		ProductService service = new ProductService();
		// 3.调用service层用于条件查询的方法
		List<Product> ps = service.findProductByManyCondition(id, name,
				category, minprice, maxprice);
		// 4.将条件查询的结果放进request域中
		request.setAttribute("ps", ps);
		// 5.请求重定向到商品管理首页product_list.jsp页面
		request.getRequestDispatcher("/admin/product_list.jsp").forward(request, response);
	}
}
