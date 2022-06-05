package test01.web.servlet.client;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test01.dao.UserDao;
import test01.domain.SalesUser;
import test01.domain.User;
import test01.service.UserService;

public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取session对象.
		HttpSession session = request.getSession();
		// 销毁session
		session.invalidate();
		// flag标识
		String flag = request.getParameter("flag");
		if (flag == null || flag.trim().isEmpty()) {
			
			// 获取登出时间
			String logouttime = getTime();
			// 获取登入时间
			String logintime = request.getParameter("time");
			// 获取用户id
			int id = Integer.parseInt(request.getParameter("id"));
			// 获取ip地址
			String ip = getIpAddr(request);
			// 获取用户角色
			String type = request.getParameter("type");
			UserDao dao = new UserDao();
			UserService service = new UserService();
			
			if(type == null) {
				User user = null;
				try {
					user = dao.findUserById(id);
				} catch (SQLException e) {
					//TODO Auto-generated catch block
					e.printStackTrace();
				}
				service.addLoginData(id, user.getUsername(), logintime, logouttime, ip);
			} else {
				SalesUser suser = null;
				try {
					suser = dao.findSalesUserById(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				service.addLoginData(id, suser.getUsername(), logintime, logouttime, ip);
			}
			
			// 重定向到首页
			response.sendRedirect(request.getContextPath() + "/client/index.jsp");
		}
	}
	

	/**
     * 获取登录用户的IP地址
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ("0:0:0:0:0:0:0:1".equals(ip)) {
            ip = "127.0.0.1";
        }
        if (ip.split(",").length > 1) {
            ip = ip.split(",")[0];
        }
        return ip;
    }
    
    /**
     * 获取当前时间
     * @return
     */
    public String getTime( ) {
    	Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(now);
        return time;
    }
}