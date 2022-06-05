package test01.web.servlet.manager;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test01.dao.UserDao;
import test01.domain.SalesUser;

/**
 * Servlet implementation class FindSalesmanByIdServlet
 */
public class FindSalesmanByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 得到销售人员的id
		int id = Integer.parseInt(request.getParameter("id"));
		UserDao dao = new UserDao();
		SalesUser suser;
		try {
			suser = dao.findSalesUserById(id);
			request.setAttribute("suser", suser);
			request.getRequestDispatcher("/admin/salesman_edit.jsp").forward(request, response);
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
