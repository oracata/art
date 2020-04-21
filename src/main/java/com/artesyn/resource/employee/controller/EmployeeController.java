package com.artesyn.resource.employee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artesyn.resource.constant.ResourceConstants;
import com.artesyn.resource.employee.entity.Employee;
import com.artesyn.resource.employee.service.EmployeeService;
import com.artesyn.resource.utils.Msg;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/emp")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	/**
	 * 跳转到list页面
	 * 
	 * @return
	 */
	@RequestMapping("/tolist")
	public String tolist() {
		return "emp/list";
	}

	/**
	 * 跳转到add页面
	 * 
	 * @return
	 */
	@RequestMapping("/toadd")
	public String toadd() {
		return "emp/add";
	}

	/**
	 * 查询分页
	 * 
	 * @param pageNum
	 *            当前页
	 * @return
	 */
	@RequestMapping("/list/{pageNum}")
	@ResponseBody
	public Msg list(@PathVariable("pageNum") Integer pageNum) {
		try {
			PageInfo<Employee> pageInfo = employeeService.getAllByPage(pageNum, ResourceConstants.PAGE_DEFAULT_SIZE);
			return Msg.success().add("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 新增
	 * 
	 * @param emp
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public Msg add(@Valid Employee emp, BindingResult result) {
		try {
			if (result.hasErrors()) {
				Map<String, Object> map = new HashMap<>();
				List<FieldError> fieldErrors = result.getFieldErrors();
				for (FieldError fieldError : fieldErrors) {
					map.put(fieldError.getField(), fieldError.getDefaultMessage());
				}
				return Msg.fail().add("errorInfo", map);
			}
			employeeService.add(emp);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 删除
	 * 
	 * @param eid
	 * @return
	 */
	@RequestMapping(value = "/delete/{eid}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg delete(@PathVariable("eid") Integer eid) {
		try {
			employeeService.delete(eid);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 *            ids的字符串
	 * @return
	 */
	@RequestMapping(value = "/batchDelete/{ids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Msg batchDelete(@PathVariable("ids") String ids) {
		if (ids == null || ids.equals("")) {
			return Msg.fail();
		}
		String[] eids = ids.split(",");
		try {
			employeeService.batchDelete(eids);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 查询分页
	 * 
	 * @param emp
	 * @return
	 */
	@RequestMapping(value = "/getByCondition")
	@ResponseBody
	public Msg getByCondition(Employee emp) {
		if (emp == null) {
			return Msg.fail();
		}
		try {
			PageInfo<Employee> pageInfo = employeeService.getByCondition(emp);
			return Msg.success().add("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 根据ID查询获取用户
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/getById/{id}")
	@ResponseBody
	public Msg getById(@PathVariable("id") Integer id) {
		try {
			Employee emp = employeeService.getById(id);
			return Msg.success().add("emp", emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}

	/**
	 * 用户修改
	 * @param id
	 * @param emp
	 * @return
	 */
	@RequestMapping(value="/edit/{id}",method=RequestMethod.PUT )
	@ResponseBody
	public Msg edit(@PathVariable("id")Integer id,@Valid Employee emp,BindingResult result){
		emp.setEid(id);
		try {
			if (result.hasErrors()) {
				Map<String, Object> map = new HashMap<>();
				List<FieldError> fieldErrors = result.getFieldErrors();
				for (FieldError fieldError : fieldErrors) {
					map.put(fieldError.getField(), fieldError.getDefaultMessage());
				}
				return Msg.fail().add("errorInfo", map);
			}
			 employeeService.update(emp);
			return Msg.success();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Msg.fail();
	}
}
