package test01.domain;

import java.io.Serializable;

public class SalesUser implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id; // 用户编号
	private String username; // 用户姓名
	private String password; // 用户密码
	private String email; // 用户邮箱
	private String telephone; // 用户联系电话
	private String category; // 用户角色
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
}
