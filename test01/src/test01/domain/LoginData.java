package test01.domain;


public class LoginData {
	private int id; // 数据编号
	private String logintime; // 登入时间
	private String logouttime; // 登出时间
	private String ip; // IP地址

	private int user_id; // 用户编号
	private String username; // 用户名称

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getLogintime() {
		return logintime;
	}
	
	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}
	
	public String getLogouttime() {
		return logouttime;
	}
	
	public void setLogouttime(String logouttime) {
		this.logouttime = logouttime;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
}
