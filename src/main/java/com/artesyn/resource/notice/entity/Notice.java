package com.artesyn.resource.notice.entity;

import java.util.Date;

import com.artesyn.resource.user.entity.User;

public class Notice {
	private Integer nid;
	private String title;
	private String content;
	private Integer status;
	private Date createDate;
	private Date publishDate;
	private Integer uid;
	private String remark;
	private User user;
	
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getNid() {
		return nid;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", title=" + title + ", content=" + content + ", status=" + status
				+ ", publishDate=" + publishDate + ", uid=" + uid + ", remark=" + remark + "]";
	}
}
