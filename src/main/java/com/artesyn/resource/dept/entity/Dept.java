package com.artesyn.resource.dept.entity;

import java.io.Serializable;

public class Dept  implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer did;
	private String dname;
	private String dremark;
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDremark() {
		return dremark;
	}
	public void setDremark(String dremark) {
		this.dremark = dremark;
	}
	@Override
	public String toString() {
		return "Dept [did=" + did + ", dname=" + dname + ", dremark=" + dremark + "]";
	}
}
