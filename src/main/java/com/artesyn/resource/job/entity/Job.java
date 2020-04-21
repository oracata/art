package com.artesyn.resource.job.entity;

public class Job {
	public Integer jid;
	public String jname;
	public String jremark;
	public Integer getJid() {
		return jid;
	}
	public void setJid(Integer jid) {
		this.jid = jid;
	}
	public String getJname() {
		return jname;
	}
	public void setJname(String jname) {
		this.jname = jname;
	}
	public String getJremark() {
		return jremark;
	}
	public void setJremark(String jremark) {
		this.jremark = jremark;
	}
	@Override
	public String toString() {
		return "Job [jid=" + jid + ", jname=" + jname + ", jremark=" + jremark + "]";
	}
	
}
