package com.artesyn.resource.employee.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

import com.artesyn.resource.dept.entity.Dept;
import com.artesyn.resource.job.entity.Job;
import com.artesyn.resource.utils.Validator;

public class Employee {
	private Integer eid;
	@NotNull(message="部门不能为空")
	private Integer did;
	@NotNull(message="职位不能为空")
	private Integer jid;
	@Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",
			message="用户名必须是2-5位中文或者6-16位英文和数字的组合")
	private String ename;
	@Pattern(regexp=Validator.REGEX_ID_CARD,message="身份证格式错误")
	private String cardId;
	@NotNull(message="联系地址不能为空")
	@NotEmpty(message="联系地址不能为空")
	private String address;
	@Pattern(regexp="^[1-9][0-9]{5}$",message="邮政编码格式错误")
	private String postCode;
	@Pattern(regexp=Validator.REGEX_MOBILE,message="手机号格式错误")
	private String tel;
	private String phone;
	@Pattern(regexp="^\\d{5,12}$",message="QQ格式错误")
	private String qqNum;
	@Pattern(regexp=Validator.REGEX_EMAIL,message="邮箱格式错误")
	private String email;
	@NotNull(message="性别不能为空")
	private Integer sex;
	private String party;//政治面貌
	@Pattern(regexp="^(19|20)\\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$",message="生日格式错误")
	private String birthday;
	private String race;//民族
	private String education;
	private String speciality;//专业
	private String hobby;
	private Date createDate;
	private String remark;
	private Dept dept;
	private Job job;
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQqNum() {
		return qqNum;
	}
	public void setQqNum(String qqNum) {
		this.qqNum = qqNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}

	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getRace() {
		return race;
	}
	public void setRace(String race) {
		this.race = race;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public Integer getJid() {
		return jid;
	}
	public void setJid(Integer jid) {
		this.jid = jid;
	}
	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", did=" + did + ", jid=" + jid + ", ename=" + ename + ", cardId=" + cardId
				+ ", address=" + address + ", postCode=" + postCode + ", tel=" + tel + ", phone=" + phone + ", qqNum="
				+ qqNum + ", email=" + email + ", sex=" + sex + ", party=" + party + ", birthday=" + birthday
				+ ", race=" + race + ", education=" + education + ", speciality=" + speciality + ", hobby=" + hobby
				+ ", createDate=" + createDate + ", remark=" + remark + "]";
	}
	
}
