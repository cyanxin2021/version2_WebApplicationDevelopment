package test01.web.servlet.salesman;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.domain.Product;
import test01.domain.SalesUser;
import test01.exception.ListProductException;
import test01.service.ProductService;


/**
 * 后台系统
 * 查询所有商品信息的servlet
 */
public class ListProductByCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.创建service层的对象
		ProductService service = new ProductService();
		// 2.获取销售人员数据
		SalesUser suser = (SalesUser) request.getSession().getAttribute("suser");
		String category = suser.getCategory(); // 商品类别
		System.out.println(category);
		// 3.调用service层用于条件查询的方法
		List<Product> ps = service.findProductByManyCondition(null, null,
		category, null, null);
		// 4.将查询出的所有商品放进request域中
		request.setAttribute("ps", ps);
		// 5.重定向到product_list.jsp页面
		request.getRequestDispatcher("/salesman/product_list.jsp").forward(request, response);
		return;
	}
}
