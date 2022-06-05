package test01.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import test01.domain.User;
import test01.exception.RegisterException;
import test01.service.UserService;


/**
 * 
 *@class_name：RegistServlet
 *@comments: 注册请求处理
 *@param:验证码校验 
 *@return: jsp跳转
 *@author:邹涛/Zoutao
 *@createtime:2019年2月22日
 */

public class RegistServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取session中的验证码
				String sessionCode = (String) request.getSession().getAttribute("code");
				System.out.println(sessionCode);
				
				if(sessionCode != null) {
					//  获取页面提交的验证码
					String inputCode = request.getParameter("code");
					System.out.println("页面提交的验证码:" + inputCode);
					if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
						String username = new String(request.getParameter("username").getBytes("iso-8859-1"), "utf-8");
						String password = request.getParameter("password");
						String email = request.getParameter("email");
						String telephone = request.getParameter("telephone");
//						System.out.println("页面提交:" + username+password);
						//  验证成功，跳转成功页面
//						request.setAttribute("username", username);
						
						// 将表单提交的数据封装到javaBean
						User user = new User();
//						try {
//							BeanUtils.populate(user, request.getParameterMap());
//						} catch (IllegalAccessException e) {
//							e.printStackTrace();
//						} catch (InvocationTargetException e) {
//							e.printStackTrace();
//						}
						user.setUsername(username);
						user.setPassword(password);
						user.setEmail(email);
						user.setTelephone(telephone);

						
						// 调用service完成注册操作。
						UserService service = new UserService();
						try {
							service.register(user);
						} catch (RegisterException e) {
							e.printStackTrace();
							response.getWriter().write(e.getMessage());
							return;
						}
						
						request.getRequestDispatcher("/client/success.jsp").forward(request, response);
					}else {
						//  验证失败
						request.getRequestDispatcher("/client/fail.jsp").forward(request, response);
					}
				}else {
					//  验证失败
					request.getRequestDispatcher("/client/fail.jsp").forward(request, response);
				}
				//  移除session中的验证码
				request.removeAttribute("code");
			}
}