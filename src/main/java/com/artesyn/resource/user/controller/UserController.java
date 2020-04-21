package com.artesyn.resource.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artesyn.resource.base.aop.SystemControllerLog;
import com.artesyn.resource.constant.ResourceConstants;
import com.artesyn.resource.user.entity.User;
import com.artesyn.resource.user.service.UserService;
import com.artesyn.resource.utils.CookieTool;
import com.artesyn.resource.utils.Msg;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = Logger.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	/**
	 * 跳转到登录页面
	 * 
	 * @return
	 * @throws InterruptedException
	 */
	@RequestMapping("/tologin")
	@SystemControllerLog(description = "用户")
	public String tologin() throws InterruptedException {
		return "login";
	}

	/**
	 * 跳转到主页面
	 * 
	 * @return
	 */
	@RequestMapping("/tomain")
	@SystemControllerLog(description = "用户")
	public String tomain() {
		return "main";
	}

	/**
	 * 获取登录信息
	 * 
	 * @return
	 */
	@RequestMapping("/loginInfo")
	@SystemControllerLog(description = "用户")
	public String loginInfo() {
		return "loginInfo";
	}

	/**
	 * 跳转到add页面
	 * 
	 * @return
	 */
	@RequestMapping("/toadd")
	@SystemControllerLog(description = "用户")
	public String toadd(HttpSession session) {
		return "user/add";
	}

	/**
	 * 跳转到list页面
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@SystemControllerLog(description = "用户")
	public String golist(HttpSession session) {
		return "user/list";
	}

	/**
	 * 
	 * @param user
	 *            用户
	 * @param map
	 *            map
	 * @param request
	 * @param response
	 * @param flag
	 *            是否记住密码
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@SystemControllerLog(description = "用户")
	public String login(User user, Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
			boolean flag) {
		if (user == null) {
			return "login";
		}
		if (userService.login(user.getLoginname(), user.getPassword())) {
			User userInfo = userService.getUserByLoginName(user.getLoginname());
			request.getSession().setAttribute("user", userInfo);
			request.getSession().setMaxInactiveInterval(60 * 60 * 24);
			if (flag) {
				int loginMaxAge = 7 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是7天。单位为秒
				CookieTool.addCookie(response, "loginname", user.getLoginname(), loginMaxAge);
				CookieTool.addCookie(response, "password", user.getPassword(), loginMaxAge);
			} else {
				CookieTool.addCookie(response, "loginname", null, 0); // 清除Cookie
				CookieTool.addCookie(response, "password", null, 0); // 清除Cookie
			}
			return "redirect:/user/tomain";
		} else {
			map.put("msg", "用户名或密码错误");
		}
		return "login";
	}

	/**
	 * 根据id查询用户
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/getUserById/{id}")
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg getUserById(@PathVariable("id") Integer id) {
		User user = userService.getUserById(id);
		return Msg.success().add("user", user);
	}

	/**
	 * 注销登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	@SystemControllerLog(description = "用户")
	public String exit(HttpSession session, HttpServletResponse response) {
		session.removeAttribute("user");
		CookieTool.addCookie(response, "loginname", null, 0); // 清除Cookie
		CookieTool.addCookie(response, "password", null, 0); // 清除Cookie
		return "login";
	}

	/**
	 * 检查用户账号是否可用
	 * 
	 * @param loginname
	 * @return
	 */
	@RequestMapping("/checkName")
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg checkName(String loginname) {
		if (userService.checkName(loginname)) {
			return Msg.success();
		}
		return Msg.fail();
	}

	/**
	 * 用户列表
	 * 
	 * @param pageNum
	 *            当前页
	 * @return
	 */
	@RequestMapping("/list/{pageNum}")
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg list(@PathVariable("pageNum") Integer pageNum) {
		PageInfo<User> pageInfo = userService.getUsersByPage(pageNum, ResourceConstants.PAGE_DEFAULT_SIZE);
		return Msg.success().add("pageInfo", pageInfo);
	}

	/**
	 * 根据ID删除用户
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delUser/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg delUser(@PathVariable("id") Integer id) {
		try {
			userService.deleteUserById(id);
			return Msg.success();
		} catch (Exception e) {
			logger.error("删除失败");
			e.printStackTrace();
			return Msg.fail();
		}
	}

	/**
	 * 用户新增
	 * 
	 * @param user
	 *            用户对象
	 * @param result
	 *            验证结果集
	 * @return
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg addUser(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorInfo", map);
		}
		userService.addUser(user);
		return Msg.success();
	}

	/**
	 * 修改用户
	 * 
	 * @param id
	 * @param user
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.PUT)
	@ResponseBody
	@SystemControllerLog(description = "用户")
	public Msg edit(@PathVariable("id") Integer id, @Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for (FieldError fieldError : fieldErrors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorInfo", map);
		}

		if (id == null) {
			return Msg.fail();
		}
		user.setUid(id);
		userService.updateUser(user);
		return Msg.success();
	}
}
