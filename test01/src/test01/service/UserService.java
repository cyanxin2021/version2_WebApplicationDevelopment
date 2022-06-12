package test01.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.security.auth.login.LoginException;
import test01.dao.UserDao;
import test01.domain.LoginData;
import test01.domain.Product;
import test01.domain.SalesUser;
import test01.domain.User;
import test01.exception.RegisterException;

public class UserService {
	private UserDao dao = new UserDao();
	// 注册操作
	public void register(User user) throws RegisterException {
		// 调用dao完成注册操作
		try {
			dao.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RegisterException("注册失败");
		}
	}

	// 登录操作
	public User login(String username, String password) throws LoginException {
		try {
			//根据登录时表单输入的用户名和密码，查找用户
			User user = dao.findUserByUsernameAndPassword(username, password);
			if (user != null) {
				return user;
			}
			throw new LoginException("用户名或密码错误");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
	
	// 销售人员登录操作
	public SalesUser slogin(String username, String password) throws LoginException {
		try {
			//根据登录时表单输入的用户名和密码，查找用户
			SalesUser suser = dao.findSalesUserByUsernameAndPassword(username, password);
			if(suser != null) return suser;
			throw new LoginException("用户名或密码错误");
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException("登录失败");
		}
	}
	
	// 记录登录数据
	public void addLoginData(int id, String username, String logintime, String logouttime, String ip) {
		try {
			dao.addLoginData(id, username, logintime, logouttime, ip);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 查找所有销售人员信息
	public List<SalesUser> listAll() {
		try {
			return dao.listAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	// 多条件查询
	public List<SalesUser> findSalesmanByManyCondition(String id, String category) {
		List<SalesUser> ss = null;
		try {
			ss = dao.findSalesmanByManyCondition(id, category);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ss;
	}
	
	// 修改销售人员信息
	public void editSalesman(SalesUser suser) {
		try {
			dao.editSalesman(suser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//后台系统，根据id删除销售人员信息
	public void deleteSalesman(String id) {
		try {
			dao.deleteSalesman(id);
		} catch (SQLException e) {
			throw new RuntimeException("后台系统根据id删除销售人员信息失败！");
		}
	}
	
	//添加销售人员
	public void addSalesman(SalesUser suser) {
		try {
			dao.addSalesman(suser);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查找所有登录数据
	public List<LoginData> listAllData() {
		try {
			return dao.listAllData();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
