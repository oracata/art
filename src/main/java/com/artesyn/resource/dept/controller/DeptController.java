package com.artesyn.resource.dept.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artesyn.resource.dept.entity.Dept;
import com.artesyn.resource.dept.service.DeptService;
import com.artesyn.resource.utils.Msg;

@Controller
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	private DeptService deptService;

	/**
	 * 跳转到部门主页
	 * 
	 * @return
	 */
	@RequestMapping("/todept")
	public String todept() {
		return "dept/dept";
	}

	/**
	 * 部门添加页面
	 * 
	 * @param dept
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Msg add(Dept dept) {
		try {
			deptService.add(dept);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Msg list() {
		try {
			List<Dept> depts = deptService.getAll();
			return Msg.success().add("depts", depts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 根据id删除部门
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value ="/delete/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("id") Integer id) {
		try {
			deptService.delete(id);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	/**
	 * 根据部门ID获取部门
	 * @param id
	 * @return
	 */
	@RequestMapping(value ="/getById/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id") Integer id){
		try {
			Dept dept = deptService.getById(id);
			return Msg.success().add("dept", dept);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
	
	@RequestMapping(value ="/edit/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public Msg edit(@PathVariable("id") Integer did,Dept dept){
		dept.setDid(did);
		try {
			deptService.update(dept);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
}
