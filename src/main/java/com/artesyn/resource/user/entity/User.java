package com.artesyn.resource.user.entity;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.Pattern;


public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer uid;
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",
			message="用户名必须是2-5位中文或者6-16位英文和数字的组合")
	private String username;
	@Pattern(regexp="^[a-zA-Z0-9_-]{4,16}$",message="账号必须是4到16位字符")
	private String loginname;
	@Pattern(regexp="^[A-Za-z0-9]{6,16}$",message="密码最少6位,必须由字母或数字组成")
	private String password;
	private Integer status;
	private Date createDate;
	private String remark;
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "User [id=" + uid + ", username=" + username + ", loginname=" + loginname + ", password=" + password
				+ ", status=" + status + ", createDate=" + createDate + ", remark=" + remark + "]";
	}
}
