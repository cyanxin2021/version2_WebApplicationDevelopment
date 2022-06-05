package test01.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import test01.domain.Product;
import test01.domain.SalesUser;
import test01.domain.User;
import test01.utils.DataSourceUtils;

public class UserDao {
	// 添加用户
	public void addUser(User user) throws SQLException {
		String sql = "insert into user(username,password,email,telephone) values(?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, user.getUsername(), user.getPassword(),
				user.getEmail(), user.getTelephone());
		if (row == 0) {
			throw new RuntimeException();
		}
	}

	
	//根据用户名与密码查找用户
	public User findUserByUsernameAndPassword(String username, String password) throws SQLException {
		String sql = "select * from user where username=? and password=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class),username,password);
	}
	
	
	//根据用户id查找用户
	public User findUserById(int id) throws SQLException {
		String sql = "select * from user where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<User>(User.class), id);
	}
	
	//根据用户名与密码查找销售人员
	public SalesUser findSalesUserByUsernameAndPassword(String username, String password) throws SQLException {
		String sql="select * from salesman where username=? and password=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<SalesUser>(SalesUser.class), username, password);
	}
	
	
	//根据用户id查找销售人员
	public SalesUser findSalesUserById(int id) throws SQLException {
		String sql = "select * from salesman where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<SalesUser>(SalesUser.class), id);
	}
	
	//添加用户登入时间
	public void addLoginData(int id, String username, String logintime, String logouttime, String ip) throws SQLException {
		String sql = "insert into logindata(user_id,username,logintime,logouttime,ip) values(?,?,?,?,?)";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int row = runner.update(sql, id, username, logintime, logouttime, ip);
		if(row == 0) {
			throw new RuntimeException();
		}
	}
	
	
	//查找所有销售人员信息
	public List<SalesUser> listAll() throws SQLException {
		String sql = "select * from salesman";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<SalesUser>(SalesUser.class));
	}
	
	//多条件查询
	public List<SalesUser> findSalesmanByManyCondition(String id, String category) throws SQLException {
		List<Object> list = new ArrayList<Object>();
		String sql = "select * from salesman where 1=1 ";
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		
		if (id != null && id.trim().length() > 0) {
			sql += " and id=?";
			list.add(id);
		}
		
		if (category != null && category.trim().length() > 0) {
			sql += " and category=?";
			list.add(category);
		}
		
		Object[] params = list.toArray();
		return runner.query(sql, new BeanListHandler<SalesUser>(SalesUser.class), params);
	}
	
	// 修改销售人员信息
	public void editSalesman(SalesUser suser) throws SQLException {
		//1.创建集合并将商品信息添加到集合中
		List<Object> obj = new ArrayList<Object>();
		obj.add(suser.getUsername());
		obj.add(suser.getPassword());
		obj.add(suser.getEmail());
		obj.add(suser.getTelephone());
		obj.add(suser.getCategory());
		//2.创建sql语句，并拼接sql
		String sql  = "update salesman " +
				      "set username=?,password=?,email=?,telephone=?,category=? ";
		
		sql += " where id=?";
		obj.add(suser.getId());		
		System.out.println(sql);		
		System.out.println(obj);
		//3.创建QueryRunner对象
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		//4.使用QueryRunner对象的update()方法更新数据
		runner.update(sql, obj.toArray());
	}


	public void deleteSalesman(String id) throws SQLException {
		String sql = "DELETE FROM salesman WHERE id = ?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		runner.update(sql, id);
	}
}
