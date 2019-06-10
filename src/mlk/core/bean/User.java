package mlk.core.bean;

import java.io.Serializable;

/**
 * 领域对象 对应数据库和表单页面
 * 
 * @author mlk
 * 
 */
public class User implements Serializable {
	/*
	 * 对应数据库
	 */
	private String username;
	private String password;
	/*
	 * 对应表单
	 * * 登录：用户名和密码
	 * * 注册：用户名、密码、确认密码、验证码
	 */
	private String repassword;//确认密码
	private String verifyCode;//验证码
    public User(){}
	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
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

    public User(String username, String password, String repassword, String verifyCode){
	    this.username=username;
	    this.password=password;
	    this.repassword=repassword;
	    this.verifyCode=verifyCode;
    }
    public User(String username, String password){
    	this.username=username;
    	this.password=password;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password
				 + ", repassword="
				+ repassword + ", verifyCode=" + verifyCode + "]";
	}
}
